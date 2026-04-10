package com.example.banvemaybay;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("/api/customer")
public class CustomerController {

    @Autowired
    private CustomerRepository customerRepository;

    @PostMapping("/login")
    public ResponseEntity<Map<String, Object>> loginCustomer(@RequestBody Map<String, String> credentials) {
        String username = credentials.get("username");
        String password = credentials.get("password");

        Optional<Customer> user = customerRepository.findByUsername(username);
        Map<String, Object> response = new HashMap<>();

        // Kiểm tra tài khoản và mật khẩu
        if (user.isPresent() && user.get().getPassword().equals(password)) {
            response.put("success", true);
            response.put("customerId", user.get().getId());
            response.put("customerName", user.get().getName());
            return ResponseEntity.ok(response);
        }

        // Báo lỗi nếu sai
        response.put("success", false);
        response.put("message", "Tên đăng nhập hoặc mật khẩu không chính xác!");
        return ResponseEntity.status(401).body(response);
    }
    
    @PostMapping("/register")
    public ResponseEntity<Map<String, Object>> registerCustomer(@RequestBody Customer newCustomer) {
        Map<String, Object> response = new HashMap<>();

        try {
            // 1. Kiểm tra xem Tên đăng nhập (username) đã tồn tại chưa
            Optional<Customer> existingUser = customerRepository.findByUsername(newCustomer.getUsername());
            if (existingUser.isPresent()) {
                response.put("success", false);
                response.put("message", "Tên đăng nhập đã tồn tại, vui lòng chọn tên khác!");
                return ResponseEntity.badRequest().body(response);
            }

            // 2. Tự động sinh ID khách hàng (Ví dụ: C + 5 số ngẫu nhiên)
            // Đảm bảo không cần khách hàng nhập ID bằng tay
            int randomNum = (int) (Math.random() * 90000) + 10000; 
            String generatedId = "C" + randomNum;
            newCustomer.setId(generatedId);

            // 3. Lưu vào Cơ sở dữ liệu
            customerRepository.save(newCustomer);

            response.put("success", true);
            response.put("message", "Đăng ký thành công!");
            return ResponseEntity.ok(response);

        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "Đã xảy ra lỗi: " + e.getMessage());
            return ResponseEntity.status(500).body(response);
        }
    }
}