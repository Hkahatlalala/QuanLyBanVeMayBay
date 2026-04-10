package com.example.banvemaybay;

import java.time.LocalDateTime;

public interface FlightInfo {
    Integer getFlightId();
    String getAirlineName();
    String getDepartureLocation(); 
    String getArrivalLocation();   
    LocalDateTime getScheduledDeparture();
    String getStatus();
}