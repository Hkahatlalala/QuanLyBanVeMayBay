package com.example.banvemaybay;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.WebApplicationType;

@SpringBootApplication
public class BanVeMayBay {

    public static void main(String[] args) {
        SpringApplication app = new SpringApplication(BanVeMayBay.class);
        // Dòng quan trọng nhất: Ép chạy kiểu Web Servlet
        app.setWebApplicationType(WebApplicationType.SERVLET); 
        app.run(args);
        System.out.println("SERVER DANG CHAY TAI: http://localhost:8080/admin/login.html");
        System.out.println("KHACH HANG DANG NHAP TAI: http://localhost:8080/login.html");
    }
}