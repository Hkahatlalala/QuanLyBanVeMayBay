package com.example.banvemaybay;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
public class PageController {

    @Autowired
    private AirportRepository airportRepository;

    // ==========================================
    // 1. CÁC HÀM TRẢ VỀ GIAO DIỆN WEB (HTML)
    // ==========================================

    @GetMapping("/login")
    public String showLoginPage() {
        return "forward:/login.html"; 
    }

    @GetMapping("/register")
    public String showRegisterPage() {
        return "forward:/register.html"; 
    }

    @GetMapping("/")
    public String showHomePage() {
        return "forward:/index.html"; 
    }

    // ĐÂY CHÍNH LÀ ĐOẠN ĐƯỢC THÊM VÀO ĐỂ FIX LỖI 404 NÀY
    @GetMapping("/search-results")
    public String showSearchResultsPage() {
        return "forward:/search-results.html"; 
    }
    
    @GetMapping("/checkout")
    public String showCheckoutPage() {
        return "forward:/checkout.html"; 
    }

    @GetMapping("/my-bookings")
    public String showMyBookingsPage() {
        return "forward:/my-bookings.html"; 
    }

    // ==========================================
    // 2. CÁC HÀM TRẢ VỀ DỮ LIỆU (JSON)
    // ==========================================

    @GetMapping("/api/airports")
    @ResponseBody 
    public List<Map<String, Object>> getAirports() {
        return airportRepository.getAllAirportsForDropdown();
    }
}