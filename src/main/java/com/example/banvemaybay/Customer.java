package com.example.banvemaybay;

import jakarta.persistence.*;

@Entity
@Table(name = "customer")
public class Customer {

    @Id
    private String id; // ID là String vì bạn đang dùng C001, C002...

    private String name;

    private String email;

    @Column(name = "phone_no")
    private String phoneNo;

    private String username;

    private String password;

    // --- Getter và Setter (Đây là những hàm mà Controller đang gọi) ---

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}