package com.example.banvemaybay;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "flight")
public class Flight {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String status;

    @Column(name = "scheduled_departure") // Khớp chính xác với MySQL
    private LocalDateTime scheduledDeparture;

    @Column(name = "scheduled_arrival")
    private LocalDateTime scheduledArrival;

    @Column(name = "airline_id")
    private Integer airlineId;

    @Column(name = "aircraft_id")
    private Integer aircraftId;

    @Column(name = "departs_airport_id")
    private Integer departsAirportId;

    @Column(name = "arrives_airport_id")
    private Integer arrivesAirportId;

    // --- Getter và Setter ---
    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public LocalDateTime getScheduledDeparture() { return scheduledDeparture; }
    public void setScheduledDeparture(LocalDateTime scheduledDeparture) { this.scheduledDeparture = scheduledDeparture; }

    public LocalDateTime getScheduledArrival() { return scheduledArrival; }
    public void setScheduledArrival(LocalDateTime scheduledArrival) { this.scheduledArrival = scheduledArrival; }

    public Integer getAirlineId() { return airlineId; }
    public void setAirlineId(Integer airlineId) { this.airlineId = airlineId; }

    public Integer getAircraftId() { return aircraftId; }
    public void setAircraftId(Integer aircraftId) { this.aircraftId = aircraftId; }

    public Integer getDepartsAirportId() { return departsAirportId; }
    public void setDepartsAirportId(Integer departsAirportId) { this.departsAirportId = departsAirportId; }

    public Integer getArrivesAirportId() { return arrivesAirportId; }
    public void setArrivesAirportId(Integer arrivesAirportId) { this.arrivesAirportId = arrivesAirportId; }
}