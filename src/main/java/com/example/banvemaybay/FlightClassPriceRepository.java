package com.example.banvemaybay;

import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface FlightClassPriceRepository extends JpaRepository<FlightClassPrice, Integer> {
    
    // Hàm này sẽ dùng để lấy toàn bộ 4 mức giá khi khách hàng click vào 1 chuyến bay cụ thể
    List<FlightClassPrice> findByFlightId(Integer flightId);
    
}