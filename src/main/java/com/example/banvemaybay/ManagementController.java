package com.example.banvemaybay;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class ManagementController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // ==========================================
    // 1. CÁC API CHO TÀU BAY (AIRCRAFT)
    // ==========================================
    
    @PostMapping("/aircrafts")
    public ResponseEntity<String> addAircraft(@RequestBody Map<String, Object> payload) {
        try {
            String sql = "INSERT INTO aircraft (number, model, total_seats, airline_id, status) VALUES (?, ?, ?, ?, ?)";
            jdbcTemplate.update(sql, 
                payload.get("number"), 
                payload.get("model"), 
                payload.get("totalSeats"), 
                payload.get("airlineId"), 
                payload.get("status")
            );
            return ResponseEntity.ok("OK");
        } catch (Exception e) {
            return ResponseEntity.status(500).body("Lỗi: " + e.getMessage());
        }
    }

    @PutMapping("/aircrafts/{id}")
    public ResponseEntity<String> updateAircraft(@PathVariable Integer id, @RequestBody Map<String, Object> payload) {
        try {
            String sql = "UPDATE aircraft SET number=?, model=?, total_seats=?, airline_id=?, status=? WHERE id=?";
            jdbcTemplate.update(sql, 
                payload.get("number"), 
                payload.get("model"), 
                payload.get("totalSeats"), 
                payload.get("airlineId"), 
                payload.get("status"), 
                id
            );
            return ResponseEntity.ok("OK");
        } catch (Exception e) {
            return ResponseEntity.status(500).body("Lỗi: " + e.getMessage());
        }
    }

    @DeleteMapping("/aircrafts/{id}")
    public ResponseEntity<String> deleteAircraft(@PathVariable Integer id) {
        try {
            jdbcTemplate.update("DELETE FROM aircraft WHERE id=?", id);
            return ResponseEntity.ok("OK");
        } catch (Exception e) {
            return ResponseEntity.status(500).body("Lỗi (Có thể tàu bay này đã có chuyến bay nên không cho xóa): " + e.getMessage());
        }
    }

    // ==========================================
    // 2. CÁC API CHO CHUYẾN BAY (FLIGHT) + XỬ LÝ GIÁ
    // ==========================================

    @PostMapping("/flights")
    @org.springframework.transaction.annotation.Transactional
    public ResponseEntity<String> addFlight(@RequestBody Map<String, Object> payload) {
        try {
            String sqlFlight = "INSERT INTO flight (scheduled_departure, scheduled_arrival, airline_id, aircraft_id, departs_airport_id, arrives_airport_id, status) VALUES (?, ?, ?, ?, ?, ?, ?)";
            
            // Lấy ID tự tăng ngay sau khi Insert
            org.springframework.jdbc.support.KeyHolder keyHolder = new org.springframework.jdbc.support.GeneratedKeyHolder();
            jdbcTemplate.update(connection -> {
                java.sql.PreparedStatement ps = connection.prepareStatement(sqlFlight, java.sql.Statement.RETURN_GENERATED_KEYS);
                ps.setObject(1, payload.get("scheduledDeparture"));
                ps.setObject(2, payload.get("scheduledArrival"));
                ps.setObject(3, payload.get("airlineId"));
                ps.setObject(4, payload.get("aircraftId"));
                ps.setObject(5, payload.get("departsAirportId"));
                ps.setObject(6, payload.get("arrivesAirportId"));
                ps.setObject(7, payload.get("status"));
                return ps;
            }, keyHolder);

            Integer flightId = keyHolder.getKey().intValue();

            // Lưu 4 mức giá vé cho chuyến bay này
            String sqlPrice = "INSERT INTO class_price (flight_id, class_name, price) VALUES (?, ?, ?)";
            jdbcTemplate.update(sqlPrice, flightId, "economy", payload.get("priceEconomy"));
            jdbcTemplate.update(sqlPrice, flightId, "premium_economy", payload.get("pricePremium"));
            jdbcTemplate.update(sqlPrice, flightId, "business", payload.get("priceBusiness"));
            jdbcTemplate.update(sqlPrice, flightId, "first", payload.get("priceFirst"));

            return ResponseEntity.ok("OK");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("Lỗi: " + e.getMessage());
        }
    }

    @PutMapping("/flights/{id}")
    @org.springframework.transaction.annotation.Transactional
    public ResponseEntity<String> updateFlight(@PathVariable Integer id, @RequestBody Map<String, Object> payload) {
        try {
            String sqlFlight = "UPDATE flight SET scheduled_departure=?, scheduled_arrival=?, airline_id=?, aircraft_id=?, departs_airport_id=?, arrives_airport_id=?, status=? WHERE id=?";
            jdbcTemplate.update(sqlFlight, 
                payload.get("scheduledDeparture"), payload.get("scheduledArrival"), 
                payload.get("airlineId"), payload.get("aircraftId"), 
                payload.get("departsAirportId"), payload.get("arrivesAirportId"), 
                payload.get("status"), id
            );

            // Cập nhật lại giá bằng cách xóa giá cũ và thêm giá mới
            jdbcTemplate.update("DELETE FROM class_price WHERE flight_id=?", id);
            
            String sqlPrice = "INSERT INTO class_price (flight_id, class_name, price) VALUES (?, ?, ?)";
            jdbcTemplate.update(sqlPrice, id, "economy", payload.get("priceEconomy"));
            jdbcTemplate.update(sqlPrice, id, "premium", payload.get("pricePremium"));
            jdbcTemplate.update(sqlPrice, id, "business", payload.get("priceBusiness"));
            jdbcTemplate.update(sqlPrice, id, "first", payload.get("priceFirst"));

            return ResponseEntity.ok("OK");
        } catch (Exception e) {
            return ResponseEntity.status(500).body("Lỗi: " + e.getMessage());
        }
    }

    @DeleteMapping("/flights/{id}")
    @org.springframework.transaction.annotation.Transactional
    public ResponseEntity<String> deleteFlight(@PathVariable Integer id) {
        try {
            jdbcTemplate.update("DELETE FROM class_price WHERE flight_id=?", id);
            jdbcTemplate.update("DELETE FROM flight WHERE id=?", id);
            return ResponseEntity.ok("OK");
        } catch (Exception e) {
            return ResponseEntity.status(500).body("Lỗi (Chuyến bay đã có khách đặt nên không thể xóa): " + e.getMessage());
        }
    }

    // ==========================================
    // 3. CÁC API CHO QUẢN LÝ TÀI KHOẢN (CUSTOMER)
    // ==========================================

    @GetMapping("/customers")
    public ResponseEntity<List<Map<String, Object>>> getAllCustomers() {
        try {
            String sql = "SELECT id, username, password, name, email, phone_no FROM customer";
            List<Map<String, Object>> customers = jdbcTemplate.queryForList(sql);
            return ResponseEntity.ok(customers);
        } catch (Exception e) {
            return ResponseEntity.status(500).body(null);
        }
    }

    @PutMapping("/customers/{id}")
    public ResponseEntity<String> updateCustomer(@PathVariable String id, @RequestBody Map<String, Object> payload) {
        try {
            String sql = "UPDATE customer SET name=?, username=?, password=?, email=?, phone_no=? WHERE id=?";
            jdbcTemplate.update(sql, 
                payload.get("name"), 
                payload.get("username"), 
                payload.get("password"), 
                payload.get("email"), 
                payload.get("phoneNo"), 
                id
            );
            return ResponseEntity.ok("OK");
        } catch (Exception e) {
            return ResponseEntity.status(500).body("Lỗi: " + e.getMessage());
        }
    }

    @DeleteMapping("/customers/{id}")
    public ResponseEntity<String> deleteCustomer(@PathVariable String id) {
        try {
            jdbcTemplate.update("DELETE FROM customer WHERE id=?", id);
            return ResponseEntity.ok("OK");
        } catch (Exception e) {
            return ResponseEntity.status(500).body("Lỗi (Khách hàng này đã có lịch sử giao dịch trên hệ thống nên không thể xóa): " + e.getMessage());
        }
    }

    // ==========================================
    // 4. CÁC API ĐỂ ĐỔ DỮ LIỆU VÀO DROPDOWN SELECT
    // ==========================================
    @GetMapping("/dropdown/airlines")
    public List<Map<String, Object>> getAirlines() {
        return jdbcTemplate.queryForList("SELECT id, name FROM airline");
    }

    @GetMapping("/dropdown/aircrafts")
    public List<Map<String, Object>> getAircraftsList() {
        return jdbcTemplate.queryForList("SELECT id, number, model FROM aircraft WHERE status='active'");
    }

    @GetMapping("/dropdown/airports")
    public List<Map<String, Object>> getAirportsList() {
        return jdbcTemplate.queryForList("SELECT id, name, IATA_code FROM airport");
    }
}