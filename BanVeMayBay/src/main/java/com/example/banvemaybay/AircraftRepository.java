package com.example.banvemaybay;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import java.util.List;
import java.util.Map;

public interface AircraftRepository extends JpaRepository<Aircraft, Integer> {
    
    @Query(value = "SELECT a.id AS \"aircraftId\", " +
                   "a.number AS \"regNumber\", " + 
                   "al.name AS \"airlineName\", " +
                   "al.contact_info AS \"contactInfo\", " + 
                   "a.model AS \"aircraftModel\", " +
                   "a.total_seats AS \"totalSeat\", " +
                   "a.status AS \"status\" " +
                   "FROM aircraft a " +
                   "JOIN airline al ON a.airline_id = al.id", nativeQuery = true) // Đã map theo al.id
    List<Map<String, Object>> findAllAircraftInfo();
}