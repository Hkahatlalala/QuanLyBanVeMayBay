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

    @GetMapping("/api/reservations")
    @ResponseBody 
    public List<Map<String, Object>> getAllReservations() { return reservationRepository.findAllReservationInfo(); }

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
        if (tickets.isEmpty()) return; 

        Integer flightId = (Integer) tickets.get(0).get("flight_id");
        String getTakenSeatsSql = "SELECT seat_no FROM ticket WHERE flight_id = ? AND seat_no IS NOT NULL AND status != 'cancelled'";
        List<String> takenSeats = jdbcTemplate.queryForList(getTakenSeatsSql, String.class, flightId);

        String[] seatLetters = {"A", "B", "C", "D", "E", "F"};
        int currentRow = 1;
        int currentLetterIndex = 0;

        for (Map<String, Object> t : tickets) {
            Integer ticketId = (Integer) t.get("id");
            String assignedSeat = null;

            while (assignedSeat == null) {
                String potentialSeat = currentRow + seatLetters[currentLetterIndex];
                if (!takenSeats.contains(potentialSeat)) {
                    assignedSeat = potentialSeat;
                    takenSeats.add(assignedSeat); 
                }
                currentLetterIndex++;
                if (currentLetterIndex >= seatLetters.length) {
                    currentLetterIndex = 0;
                    currentRow++; 
                }
            }
            jdbcTemplate.update("UPDATE ticket SET seat_no = ? WHERE id = ?", assignedSeat, ticketId);
        }
    }

    // --- API HOÀN TIỀN CHUẨN ---
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