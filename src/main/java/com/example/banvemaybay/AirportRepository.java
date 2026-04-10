package com.example.banvemaybay;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import java.util.List;
import java.util.Map;

public interface AirportRepository extends JpaRepository<Airport, Integer> {
    
    // Đã thêm a.name AS airportName để lấy tên riêng của sân bay (Nội Bài, Tân Sơn Nhất)
    @Query(value = "SELECT a.id AS id, " +
                   "a.IATA_code AS iata, " +
                   "a.name AS airportName, " +
                   "CONCAT(c.name, ', ', c.country) AS locationText " +
                   "FROM airport a " +
                   "JOIN city c ON a.city_id = c.id", nativeQuery = true)
    List<Map<String, Object>> getAllAirportsForDropdown();
}