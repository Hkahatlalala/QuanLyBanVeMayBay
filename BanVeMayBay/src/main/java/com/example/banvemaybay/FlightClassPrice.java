package com.example.banvemaybay;

import jakarta.persistence.*;

@Entity
@Table(name = "class_price") // Đã cập nhật tên bảng
public class FlightClassPrice {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "cprice_id") // Đã cập nhật tên cột khóa chính
    private Integer id;

    @Column(name = "flight_id")
    private Integer flightId;

    @Column(name = "class_name") // Đã cập nhật tên cột hạng ghế
    private String seatClass;

    private Integer price;

    // --- Getter & Setter ---
    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public Integer getFlightId() { return flightId; }
    public void setFlightId(Integer flightId) { this.flightId = flightId; }

    public String getSeatClass() { return seatClass; }
    public void setSeatClass(String seatClass) { this.seatClass = seatClass; }

    public Integer getPrice() { return price; }
    public void setPrice(Integer price) { this.price = price; }
}