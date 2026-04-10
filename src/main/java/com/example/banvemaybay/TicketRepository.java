package com.example.banvemaybay;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import java.util.List;
import java.util.Map;

// SỬA TẠI ĐÂY: Phải là Ticket (Entity quản lý vé), không phải Reservation
public interface TicketRepository extends JpaRepository<Ticket, Integer> { 
    
    @Query(value = "SELECT t.id AS \"ticketId\", " +
                   "p.passport_no AS \"passportNumber\", " +
                   "p.name AS \"name\", " +
                   "TIMESTAMPDIFF(YEAR, p.DOB, CURDATE()) AS \"age\", " +
                   "p.address AS \"address\", " +
                   "p.phone_no AS \"phone\", " +
                   "p.email AS \"email\", " +
                   "t.seat_no AS \"seatNumber\", " +
                   "t.seat_class AS \"seatClass\", " +
                   "t.flight_id AS \"flightId\", " +
                   "t.reservation_id AS \"reservationId\" " +
                   "FROM ticket t " +
                   "JOIN passenger p ON t.passenger_id = p.id " + // Map p.id
                   "JOIN reservation r ON t.reservation_id = r.id " +
                   "WHERE r.status = 'confirmed' " +
                   "ORDER BY t.flight_id, t.seat_no", nativeQuery = true)
    List<Map<String, Object>> findAllPassengerManifest();
}