package com.example.banvemaybay;

import jakarta.persistence.*;

@Entity
@Table(name = "aircraft")
public class Aircraft {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String model;
    
    private Integer number;

    @Column(name = "total_seats")
    private Integer totalSeats;

    @Column(name = "airline_id")
    private Integer airlineId;

    private String status; // Cột trạng thái mới thêm

    // --- Getter và Setter ---
    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public String getModel() { return model; }
    public void setModel(String model) { this.model = model; }

    public Integer getNumber() { return number; }
    public void setNumber(Integer number) { this.number = number; }

    public Integer getTotalSeats() { return totalSeats; }
    public void setTotalSeats(Integer totalSeats) { this.totalSeats = totalSeats; }

    public Integer getAirlineId() { return airlineId; }
    public void setAirlineId(Integer airlineId) { this.airlineId = airlineId; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}