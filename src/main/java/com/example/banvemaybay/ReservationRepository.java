package com.example.banvemaybay;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;
import java.util.Map;

public interface ReservationRepository extends JpaRepository<Reservation, Integer> {
    
    // ĐÃ FIX: Thêm cột flightCodes để lấy danh sách mã chuyến bay (hỗ trợ khứ hồi)
    @Query(value = "SELECT r.id AS \"reservationId\", c.name AS \"customerName\", c.phone_no AS \"customerPhone\", " +
                   "r.created_at AS \"createdAt\", r.status AS \"status\", " +
                   "(SELECT COUNT(*) FROM ticket t WHERE t.reservation_id = r.id) AS \"ticketCount\", " +
                   "(SELECT IFNULL(SUM(price), 0) FROM ticket t WHERE t.reservation_id = r.id) AS \"totalAmount\", " +
                   "(SELECT GROUP_CONCAT(DISTINCT t.flight_id SEPARATOR ', ') FROM ticket t WHERE t.reservation_id = r.id) AS \"flightCodes\" " +
                   "FROM reservation r JOIN customer c ON r.customer_id = c.id ORDER BY r.created_at DESC", nativeQuery = true)
    List<Map<String, Object>> findAllReservationInfo();

    @Modifying
    @Transactional
    @Query(value = "INSERT INTO payment (reservation_id, amount, method, status, payment_time) " +
                   "SELECT ?1, (SELECT IFNULL(SUM(price), 0) FROM ticket WHERE reservation_id = ?1), 'transfer', 1, ?2 " +
                   "FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM payment WHERE reservation_id = ?1 AND status = 1)", nativeQuery = true)
    void confirmPaymentSafe(Integer reservationId, String exactTime);

    @Modifying
    @Transactional
    @Query(value = "UPDATE reservation SET status = 'cancelled' WHERE id = ?1", nativeQuery = true)
    void cancelReservationStatus(Integer resId);

    @Modifying
    @Transactional
    @Query(value = "INSERT INTO payment (reservation_id, amount, method, status, payment_time) " +
                   "SELECT ?1, -amount, method, 2, NOW() " +
                   "FROM payment WHERE reservation_id = ?1 AND status = 1 " +
                   "AND NOT EXISTS (SELECT 1 FROM payment p2 WHERE p2.reservation_id = ?1 AND p2.status = 2)", nativeQuery = true)
    void insertRefundTransaction(Integer resId);
}