package com.example.banvemaybay;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface FlightRepository extends JpaRepository<Flight, Integer> {

    @Query(value = 
        "SELECT " +
            "f.id AS flightId, " +
            "f.scheduled_departure AS scheduledDeparture, " +
            "f.scheduled_arrival AS scheduledArrival, " +
            "f.status AS status, " +
            "al.name AS airlineName, " +
            "ac.model AS aircraftModel, " +  
            "dep.name AS departureLocation, " + 
            "arr.name AS arrivalLocation, " +   
            "MAX(CASE WHEN cp.class_name = 'Economy' THEN cp.price END) AS priceEconomy, " +
            "MAX(CASE WHEN cp.class_name = 'Premium' THEN cp.price END) AS pricePremium, " +
            "MAX(CASE WHEN cp.class_name = 'Business' THEN cp.price END) AS priceBusiness, " +
            "MAX(CASE WHEN cp.class_name = 'First' THEN cp.price END) AS priceFirst " + 
        "FROM flight f " +
        "LEFT JOIN airline al ON f.airline_id = al.id " +
        "LEFT JOIN aircraft ac ON f.aircraft_id = ac.id " + 
        "LEFT JOIN airport dep ON f.departs_airport_id = dep.id " +
        "LEFT JOIN airport arr ON f.arrives_airport_id = arr.id " +
        "LEFT JOIN class_price cp ON f.id = cp.flight_id " + 
        "GROUP BY f.id, f.scheduled_departure, f.scheduled_arrival, f.status, al.name, ac.model, dep.name, arr.name", 
        nativeQuery = true)
    List<Map<String, Object>> findAllFlightInfoWithPrices();

    // ĐÃ FIX: Dùng CAST() để ép MySQL trả về Text, không bị ép thành Boolean nữa
    @Query(value = 
        "SELECT " +
            "p.payment_time AS \"paymentDate\", " +
            "p.reservation_id AS \"reservationId\", " +
            "p.amount AS \"totalRevenue\", " +
            "CAST(p.status AS CHAR) AS \"paymentStatus\" " + 
        "FROM payment p " +
        "WHERE p.status IN (1, 2) " + 
        "ORDER BY p.payment_time DESC", 
        nativeQuery = true)
    List<Map<String, Object>> getDailyRevenue();
}