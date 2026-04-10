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
            // ===============================================
            // BƯỚC 1: TẠO ĐƠN ĐẶT CHỖ (BẢNG RESERVATION)
            // ===============================================
            Reservation res = new Reservation();
            res.setCustomerId(payload.getCustomerId()); 
            res.setStatus("confirmed"); // Đổi thành confirmed vì ta thanh toán luôn
            res.setCreatedAt(LocalDateTime.now());
            
            Reservation savedRes = reservationRepository.save(res);
            Integer resId = savedRes.getId();

            // ===============================================
            // BƯỚC 2: TÍNH GIÁ TIỀN CHO TỪNG VÉ
            // ===============================================
            boolean isRoundTrip = payload.getInboundFlightId() != null;
            // Lấy tổng tiền chia cho số hành khách
            double pricePerPassenger = payload.getTotalAmount() / payload.getPassengers().size();
            // Nếu là khứ hồi thì mỗi hành khách có 2 vé -> giá vé chia đôi
            double pricePerTicket = isRoundTrip ? (pricePerPassenger / 2) : pricePerPassenger;

            // ===============================================
            // BƯỚC 3: LƯU HÀNH KHÁCH VÀ TẠO VÉ + TỰ ĐỘNG XẾP GHẾ
            // ===============================================
            for (PassengerInfo p : payload.getPassengers()) {
                String dob = (p.getDob() != null && !p.getDob().isEmpty()) ? p.getDob() : "2000-01-01";
                Integer passengerId = null;

                // --- 3A. LOGIC TÌM HOẶC TẠO HÀNH KHÁCH (CHỐNG LỖI TRÙNG CCCD) ---
                String checkPassengerSql = "SELECT id FROM passenger WHERE passport_no = ?";
                try {
                    // Nếu đã có: Lấy ID và Update sđt, email mới nhất
                    passengerId = jdbcTemplate.queryForObject(checkPassengerSql, Integer.class, p.getPassport());
                    String updatePassengerSql = "UPDATE passenger SET name = ?, DOB = ?, address = ?, phone_no = ?, email = ?, nationality = ? WHERE id = ?";
                    jdbcTemplate.update(updatePassengerSql, p.getName(), dob, p.getAddress(), p.getPhone(), p.getEmail(), p.getNationality(), passengerId);
                } catch (EmptyResultDataAccessException e) {
                    // Nếu chưa có: Tạo khách hàng mới
                    String insertPassengerSql = "INSERT INTO passenger (name, passport_no, DOB, address, phone_no, email, nationality) VALUES (?, ?, ?, ?, ?, ?, ?)";
                    jdbcTemplate.update(insertPassengerSql, p.getName(), p.getPassport(), dob, p.getAddress(), p.getPhone(), p.getEmail(), p.getNationality());
                    passengerId = jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID()", Integer.class);
                }

                // --- 3B. TẠO VÉ CHIỀU ĐI (VÀ TỰ ĐỘNG XẾP GHẾ TRỐNG) ---
                String outboundSeat = assignAvailableSeat(payload.getFlightId());
                String insertTicketSql = "INSERT INTO ticket (passenger_id, reservation_id, flight_id, seat_class, seat_no, price, status) VALUES (?, ?, ?, ?, ?, ?, ?)";
                jdbcTemplate.update(insertTicketSql, passengerId, resId, payload.getFlightId(), payload.getSeatClass(), outboundSeat, pricePerTicket, "booked");

                // --- 3C. TẠO VÉ CHIỀU VỀ NẾU LÀ KHỨ HỒI (VÀ TỰ ĐỘNG XẾP GHẾ TRỐNG) ---
                if (isRoundTrip) {
                    String inboundSeat = assignAvailableSeat(payload.getInboundFlightId());
                    jdbcTemplate.update(insertTicketSql, passengerId, resId, payload.getInboundFlightId(), payload.getSeatClass(), inboundSeat, pricePerTicket, "booked");
                }
            }

            // Ghi nhận dòng tiền thanh toán
            String exactTime = java.time.LocalDateTime.now().toString().replace("T", " ").substring(0, 19);
            reservationRepository.confirmPaymentSafe(resId, exactTime);

            return Map.of(
                "success", true,
                "reservationId", resId,
                "message", "Đặt vé và xếp ghế thành công!"
            );

        } catch (Exception e) {
            e.printStackTrace();
            return Map.of("success", false, "message", "Lỗi hệ thống: " + e.getMessage());
        }
    }

    // ==============================================================
    // THUẬT TOÁN TÌM GHẾ TRỐNG THÔNG MINH
    // ==============================================================
    private String assignAvailableSeat(Integer flightId) {
        String sql = "SELECT seat_no FROM ticket WHERE flight_id = ? AND seat_no IS NOT NULL AND status != 'cancelled'";
        List<String> takenSeats = jdbcTemplate.queryForList(sql, String.class, flightId);
        
        String[] letters = {"A", "B", "C", "D", "E", "F"};
        int row = 1;
        while (true) {
            for (String letter : letters) {
                String seat = row + letter;
                // Nếu tìm thấy ghế chưa ai đặt thì lụm luôn
                if (!takenSeats.contains(seat)) {
                    return seat;
                }
            }
            row++;
        }
    }

    // ==============================================================
    // CLASS HỨNG DỮ LIỆU TỪ CHECKOUT
    // ==============================================================
    public static class BookingPayload {
        private Integer flightId;
        private Integer inboundFlightId; // ĐÃ THÊM: Nhận ID chuyến về
        private String seatClass;
        private Double totalAmount;
        private Integer ticketCount;
        private String customerId; 
        private List<PassengerInfo> passengers;

        public Integer getFlightId() { return flightId; }
        public Integer getInboundFlightId() { return inboundFlightId; }
        public String getSeatClass() { return seatClass; }
        public Double getTotalAmount() { return totalAmount; }
        public Integer getTicketCount() { return ticketCount; }
        public String getCustomerId() { return customerId; }
        public List<PassengerInfo> getPassengers() { return passengers; }
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
        public String getPassport() { return passport; }
        public String getDob() { return dob; }
        public String getNationality() { return nationality; }
        public String getPhone() { return phone; }
        public String getEmail() { return email; }
        public String getAddress() { return address; }
    }
}