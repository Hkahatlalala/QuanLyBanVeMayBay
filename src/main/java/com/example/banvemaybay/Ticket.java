package com.example.banvemaybay;

import jakarta.persistence.*;

@Entity
@Table(name = "ticket")
public class Ticket {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id; // Khớp với cột id

    @Column(name = "seat_no")
    private String seatNo;

    @Column(name = "seat_class")
    private String seatClass;

    private String type; 

    private Double price;

    private String status; 

    @Column(name = "reservation_id")
    private Integer reservationId;

    @Column(name = "passenger_id")
    private Integer passengerId;

    @Column(name = "flight_id")
    private Integer flightId;

    // --- GETTER & SETTER (Tự viết thay cho @Data) ---
    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public String getSeatNo() { return seatNo; }
    public void setSeatNo(String seatNo) { this.seatNo = seatNo; }

    public String getSeatClass() { return seatClass; }
    public void setSeatClass(String seatClass) { this.seatClass = seatClass; }

    public String getType() { return type; }
    public void setType(String type) { this.type = type; }

    public Double getPrice() { return price; }
    public void setPrice(Double price) { this.price = price; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public Integer getReservationId() { return reservationId; }
    public void setReservationId(Integer reservationId) { this.reservationId = reservationId; }

    public Integer getPassengerId() { return passengerId; }
    public void setPassengerId(Integer passengerId) { this.passengerId = passengerId; }

    public Integer getFlightId() { return flightId; }
    public void setFlightId(Integer flightId) { this.flightId = flightId; }
}