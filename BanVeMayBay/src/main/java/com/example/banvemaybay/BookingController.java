package com.example.banvemaybay;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/booking")
public class BookingController {

    @Autowired
    private ReservationRepository reservationRepository;

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @PostMapping("/create")
    @Transactional 
    public Map<String, Object> createBooking(@RequestBody BookingPayload payload) {
        try {
            String outIdStr = (payload.getFlightId() != null) ? payload.getFlightId() : "";
            String inIdStr = (payload.getInboundFlightId() != null) ? payload.getInboundFlightId() : "";
            
            String[] outFlights = outIdStr.isEmpty() ? new String[0] : outIdStr.split("[_\\,]+");
            String[] inFlights = inIdStr.isEmpty() ? new String[0] : inIdStr.split("[_\\,]+");
            
            int totalFlightLegs = outFlights.length + inFlights.length;
            if (totalFlightLegs == 0) {
                throw new Exception("Không có chuyến bay nào được chọn");
            }

            Integer firstResId = null;

            // ===============================================
            // TẠO ĐƠN & VÉ CHO TỪNG CHUYẾN BAY CHIỀU ĐI
            // Chạy bao nhiêu chuyến thì tạo bấy nhiêu Đơn hàng riêng
            // ===============================================
            for (String flightIdStr : outFlights) {
                if (flightIdStr.trim().isEmpty()) continue;
                Integer resId = processSingleFlightReservation(flightIdStr.trim(), payload, "one_way");
                if (firstResId == null) firstResId = resId; 
            }

            // ===============================================
            // TẠO ĐƠN & VÉ CHO TỪNG CHUYẾN BAY CHIỀU VỀ (NẾU CÓ)
            // ===============================================
            for (String flightIdStr : inFlights) {
                if (flightIdStr.trim().isEmpty()) continue;
                processSingleFlightReservation(flightIdStr.trim(), payload, "one_way");
            }

            return Map.of(
                "success", true,
                "reservationId", firstResId != null ? firstResId : 0,
                "message", "Đặt vé thành công! Hệ thống đã tạo " + totalFlightLegs + " đơn hàng riêng biệt."
            );

        } catch (Exception e) {
            e.printStackTrace();
            return Map.of("success", false, "message", "Lỗi hệ thống: " + e.getMessage());
        }
    }

    // ==============================================================
    // HÀM TẠO 1 ĐƠN HÀNG ĐỘC LẬP & TỰ ĐỘNG LẤY GIÁ GỐC
    // ==============================================================
    private Integer processSingleFlightReservation(String flightIdStr, BookingPayload payload, String ticketType) {
        Integer fId = Integer.parseInt(flightIdStr);
        
        // 1. Tự động chui vào database lấy chính xác giá tiền của chuyến bay này
        double actualPricePerTicket = getFlightPrice(fId, payload.getSeatClass());

        // 2. Tạo Đơn Hàng Mới Tinh
        Reservation res = new Reservation();
        res.setCustomerId(payload.getCustomerId()); 
        res.setStatus("confirmed"); 
        res.setCreatedAt(LocalDateTime.now());
        Reservation savedRes = reservationRepository.save(res);
        Integer resId = savedRes.getId();

        // 3. Quét thông tin hành khách
        for (PassengerInfo p : payload.getPassengers()) {
            String dob = (p.getDob() != null && !p.getDob().isEmpty()) ? p.getDob() : "2000-01-01";
            Integer passengerId = null;

            String checkPassengerSql = "SELECT id FROM passenger WHERE passport_no = ?";
            try {
                passengerId = jdbcTemplate.queryForObject(checkPassengerSql, Integer.class, p.getPassport());
                String updatePassengerSql = "UPDATE passenger SET name = ?, DOB = ?, address = ?, phone_no = ?, email = ?, nationality = ? WHERE id = ?";
                jdbcTemplate.update(updatePassengerSql, p.getName(), dob, p.getAddress(), p.getPhone(), p.getEmail(), p.getNationality(), passengerId);
            } catch (EmptyResultDataAccessException e) {
                String insertPassengerSql = "INSERT INTO passenger (name, passport_no, DOB, address, phone_no, email, nationality) VALUES (?, ?, ?, ?, ?, ?, ?)";
                jdbcTemplate.update(insertPassengerSql, p.getName(), p.getPassport(), dob, p.getAddress(), p.getPhone(), p.getEmail(), p.getNationality());
                passengerId = jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID()", Integer.class);
            }

            // Xếp ghế và ghi lại giá gốc của vé
            String seat = assignAvailableSeat(fId);
            String insertTicketSql = "INSERT INTO ticket (passenger_id, reservation_id, flight_id, seat_class, seat_no, price, status, type) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            jdbcTemplate.update(insertTicketSql, passengerId, resId, fId, payload.getSeatClass(), seat, actualPricePerTicket, "booked", ticketType);
        }

        // 4. Xác nhận thanh toán
        String exactTime = java.time.LocalDateTime.now().toString().replace("T", " ").substring(0, 19);
        reservationRepository.confirmPaymentSafe(resId, exactTime);

        return resId;
    }

    private double getFlightPrice(Integer flightId, String seatClass) {
        String sql = "SELECT price FROM class_price WHERE flight_id = ? AND LOWER(class_name) = LOWER(?)";
        try {
            return jdbcTemplate.queryForObject(sql, Double.class, flightId, seatClass);
        } catch (Exception e) {
            e.printStackTrace();
            return 0.0;
        }
    }

    private String assignAvailableSeat(Integer flightId) {
        String sql = "SELECT seat_no FROM ticket WHERE flight_id = ? AND seat_no IS NOT NULL AND status != 'cancelled'";
        List<String> takenSeats = jdbcTemplate.queryForList(sql, String.class, flightId);
        String[] letters = {"A", "B", "C", "D", "E", "F"};
        int row = 1;
        while (true) {
            for (String letter : letters) {
                String seat = row + letter;
                if (!takenSeats.contains(seat)) {
                    return seat;
                }
            }
            row++;
        }
    }

    // ==============================================================
    // PAYLOAD ĐÃ CHUYỂN SANG STRING - KHÔNG BAO GIỜ BỊ MẤT SỐ 7 NỮA
    // ==============================================================
    public static class BookingPayload {
        private String flightId;
        private String inboundFlightId; 
        
        private String seatClass;
        private Double totalAmount;
        private Integer ticketCount;
        private String customerId; 
        private List<PassengerInfo> passengers;

        public String getFlightId() { return flightId; }
        public void setFlightId(String flightId) { this.flightId = flightId; }
        public String getInboundFlightId() { return inboundFlightId; }
        public void setInboundFlightId(String inboundFlightId) { this.inboundFlightId = inboundFlightId; }
        public String getSeatClass() { return seatClass; }
        public void setSeatClass(String seatClass) { this.seatClass = seatClass; }
        public Double getTotalAmount() { return totalAmount; }
        public void setTotalAmount(Double totalAmount) { this.totalAmount = totalAmount; }
        public Integer getTicketCount() { return ticketCount; }
        public void setTicketCount(Integer ticketCount) { this.ticketCount = ticketCount; }
        public String getCustomerId() { return customerId; }
        public void setCustomerId(String customerId) { this.customerId = customerId; }
        public List<PassengerInfo> getPassengers() { return passengers; }
        public void setPassengers(List<PassengerInfo> passengers) { this.passengers = passengers; }
    }

    public static class PassengerInfo {
        private String name;
        private String passport;
        private String dob;
        private String nationality;
        private String phone;
        private String email;
        private String address;

        public String getName() { return name; }
        public void setName(String name) { this.name = name; }
        public String getPassport() { return passport; }
        public void setPassport(String passport) { this.passport = passport; }
        public String getDob() { return dob; }
        public void setDob(String dob) { this.dob = dob; }
        public String getNationality() { return nationality; }
        public void setNationality(String nationality) { this.nationality = nationality; }
        public String getPhone() { return phone; }
        public void setPhone(String phone) { this.phone = phone; }
        public String getEmail() { return email; }
        public void setEmail(String email) { this.email = email; }
        public String getAddress() { return address; }
        public void setAddress(String address) { this.address = address; }
    }
}