package com.example.banvemaybay;

import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface CustomerRepository extends JpaRepository<Customer, String> {
    // Tự động hiểu là: SELECT * FROM customer WHERE username = ?
    Optional<Customer> findByUsername(String username);
}