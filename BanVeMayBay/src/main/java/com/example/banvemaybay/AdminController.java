package com.example.banvemaybay;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Controller
public class AdminController {

    @Autowired private TicketRepository ticketRepository;
    @Autowired private CustomerRepository customerRepository;
    @Autowired private FlightRepository flightRepository;
    @Autowired private AircraftRepository aircraftRepository;
    @Autowired private ReservationRepository reservationRepository;
    
    @Autowired private JdbcTemplate jdbcTemplate;

    @GetMapping("/admin/login")
    public String showLoginPage() { return "forward:/admin/login.html"; }

    @PostMapping("/api/admin/login")
    public String handleLogin(@RequestParam String username, @RequestParam String password) {
        Optional<Customer> user = customerRepository.findByUsername(username);
        if (user.isPresent() && user.get().getPassword().equals(password)) {
            return "redirect:/admin/dashboard"; 
        }
        return "redirect:/admin/login?error=true"; 
    }

    @GetMapping("/admin/dashboard")
    public String showDashboard() { return "forward:/admin/dashboard.html"; }

    @GetMapping("/api/flights")
    @ResponseBody 
    public List<Map<String, Object>> getAllFlights() { 
        return flightRepository.findAllFlightInfoWithPrices(); 
    }

    @GetMapping("/api/aircrafts")
    @ResponseBody 
    public List<Map<String, Object>> getAllAircrafts() { return aircraftRepository.findAllAircraftInfo(); }

    // Sắp xếp ID Tăng dần theo yêu cầu của bạn
    @GetMapping("/api/reservations")
    @ResponseBody 
    public List<Map<String, Object>> getAllReservations() { 
        String sql = "SELECT r.id AS reservationId, " +
                     "GROUP_CONCAT(DISTINCT t.flight_id ORDER BY t.id ASC SEPARATOR ', ') AS flightCodes, " +
                     "c.name AS customerName, c.phone_no AS customerPhone, " +
                     "r.created_at AS createdAt, " +
                     "COUNT(t.id) AS ticketCount, " +
                     "SUM(t.price) AS totalAmount, " +
                     "r.status " +
                     "FROM reservation r " +
                     "LEFT JOIN customer c ON r.customer_id = c.id " +
                     "LEFT JOIN ticket t ON r.id = t.reservation_id " +
                     "GROUP BY r.id, c.name, c.phone_no, r.created_at, r.status " +
                     "ORDER BY r.id ASC"; 
        return jdbcTemplate.queryForList(sql); 
    }

    @PutMapping("/api/reservations/{id}/status")
    @ResponseBody 
    @Transactional 
    public String updateResStatus(@PathVariable Integer id, @RequestBody Map<String, String> body) {
        Reservation res = reservationRepository.findById(id).orElse(null);
        if(res != null) {
            String st = body.get("status");
            res.setStatus(st);
            reservationRepository.save(res);
            String time = java.time.LocalDateTime.now().toString().replace("T", " ").substring(0,19);
            
            if ("confirmed".equals(st)) {
                reservationRepository.confirmPaymentSafe(id, time);
                assignSeatsForReservation(id);
            }
            return "OK";
        }
        return "Error";
    }

    private void assignSeatsForReservation(Integer reservationId) {
        String getTicketsSql = "SELECT id, flight_id FROM ticket WHERE reservation_id = ? AND seat_no IS NULL";
        List<Map<String, Object>> tickets = jdbcTemplate.queryForList(getTicketsSql, reservationId);
        
        for (Map<String, Object> t : tickets) {
            Integer ticketId = (Integer) t.get("id");
            Integer flightId = (Integer) t.get("flight_id");

            String getTakenSeatsSql = "SELECT seat_no FROM ticket WHERE flight_id = ? AND seat_no IS NOT NULL AND status != 'cancelled'";
            List<String> takenSeats = jdbcTemplate.queryForList(getTakenSeatsSql, String.class, flightId);

            String[] seatLetters = {"A", "B", "C", "D", "E", "F"};
            int currentRow = 1;
            int currentLetterIndex = 0;
            String assignedSeat = null;

            while (assignedSeat == null) {
                String potentialSeat = currentRow + seatLetters[currentLetterIndex];
                if (!takenSeats.contains(potentialSeat)) {
                    assignedSeat = potentialSeat;
                } else {
                    currentLetterIndex++;
                    if (currentLetterIndex >= seatLetters.length) {
                        currentLetterIndex = 0;
                        currentRow++; 
                    }
                }
            }
            jdbcTemplate.update("UPDATE ticket SET seat_no = ? WHERE id = ?", assignedSeat, ticketId);
        }
    }

    @PostMapping("/api/reservations/{id}/refund")
    @ResponseBody
    public Map<String, Object> refundReservation(@PathVariable Integer id) {
        try {
            reservationRepository.cancelReservationStatus(id);
            reservationRepository.insertRefundTransaction(id);
            return Map.of("success", true, "message", "Hoàn tiền thành công");
        } catch (Exception e) {
            return Map.of("success", false, "message", "Lỗi: " + e.getMessage());
        }
    }

    @GetMapping("/api/reports/revenue")
    @ResponseBody 
    public List<Map<String, Object>> getReports() { return flightRepository.getDailyRevenue(); }
    
    @GetMapping("/api/passengers")
    @ResponseBody 
    public List<Map<String, Object>> getPassengers() { return ticketRepository.findAllPassengerManifest(); }
}