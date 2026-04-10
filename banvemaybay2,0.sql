CREATE DATABASE IF NOT EXISTS `ban_ve` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `ban_ve`;

-- 1. Bảng Hãng hàng không
CREATE TABLE `airline` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(50),
  `IATA_code` CHAR(2) UNIQUE,
  `contact_info` VARCHAR(50),
  `country` VARCHAR(50)
) ENGINE=InnoDB;

-- 2. Bảng Thành phố
CREATE TABLE `city` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(50),
  `country` VARCHAR(50)
) ENGINE=InnoDB;

-- 3. Bảng Sân bay
CREATE TABLE `airport` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(50),
  `IATA_code` CHAR(3) UNIQUE,
  `city_id` INT,
  CONSTRAINT `fk_airport_city` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`)
) ENGINE=InnoDB;

-- 4. Bảng Tàu bay
CREATE TABLE `aircraft` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `model` VARCHAR(100),
  `number` VARCHAR(20),
  `total_seats` INT,
  `status` ENUM('active', 'maintenance', 'retired') DEFAULT 'active',
  `airline_id` INT,
  CONSTRAINT `fk_aircraft_airline` FOREIGN KEY (`airline_id`) REFERENCES `airline` (`id`)
) ENGINE=InnoDB;

-- 5. Bảng Chuyến bay
CREATE TABLE `flight` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `scheduled_departure` DATETIME NOT NULL,
  `scheduled_arrival` DATETIME NOT NULL,
  `status` VARCHAR(255),
  `airline_id` INT,
  `aircraft_id` INT,
  `departs_airport_id` INT,
  `arrives_airport_id` INT,
  CONSTRAINT `fk_flight_airline` FOREIGN KEY (`airline_id`) REFERENCES `airline` (`id`),
  CONSTRAINT `fk_flight_aircraft` FOREIGN KEY (`aircraft_id`) REFERENCES `aircraft` (`id`),
  CONSTRAINT `fk_flight_departs` FOREIGN KEY (`departs_airport_id`) REFERENCES `airport` (`id`),
  CONSTRAINT `fk_flight_arrives` FOREIGN KEY (`arrives_airport_id`) REFERENCES `airport` (`id`)
) ENGINE=InnoDB;

-- 6. Bảng Giá vé theo hạng ghế
CREATE TABLE `class_price` (
  `cprice_id` INT NOT NULL AUTO_INCREMENT,
  `flight_id` INT NOT NULL,
  `class_name` VARCHAR(50) NOT NULL,
  `price` INT NOT NULL,
  PRIMARY KEY (`cprice_id`, `flight_id`),
  CONSTRAINT `fk_price_flight` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB;

-- 7. Bảng Tài khoản Khách hàng
CREATE TABLE `customer` (
  `id` CHAR(12) NOT NULL PRIMARY KEY,
  `username` VARCHAR(50) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `phone_no` VARCHAR(15),
  `email` VARCHAR(50)
) ENGINE=InnoDB;

-- 8. Bảng Thông tin Hành khách bay
CREATE TABLE `passenger` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(50),
  `passport_no` VARCHAR(20) UNIQUE,
  `DOB` DATE,
  `address` VARCHAR(100),
  `phone_no` VARCHAR(15),
  `email` VARCHAR(100),
  `nationality` VARCHAR(30)
) ENGINE=InnoDB;

-- 9. Bảng Đơn đặt vé (Reservation)
CREATE TABLE `reservation` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `created_at` DATETIME,
  `status` ENUM('pending', 'confirmed', 'cancelled'),
  `customer_id` CHAR(12),
  CONSTRAINT `fk_res_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB;

-- 10. Bảng Thanh toán (Payment)
CREATE TABLE `payment` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `payment_time` DATETIME,
  `amount` DECIMAL(10,2),
  `method` ENUM('transfer', 'card', 'cash'),
  `status` TINYINT(1),
  `reservation_id` INT,
  CONSTRAINT `fk_pay_res` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`)
) ENGINE=InnoDB;

-- 11. Bảng Vé (Ticket)
CREATE TABLE `ticket` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `seat_no` VARCHAR(5),
  `seat_class` ENUM('economy', 'premium_economy', 'business', 'first'),
  `type` ENUM('one_way', 'round_trip', 'multi_city'),
  `price` DECIMAL(10,2),
  `status` ENUM('booked', 'completed', 'cancelled'),
  `reservation_id` INT,
  `passenger_id` INT,
  `flight_id` INT,
  UNIQUE INDEX `idx_flight_seat` (`flight_id`, `seat_no`), -- Một ghế trên một chuyến chỉ có 1 vé active
  CONSTRAINT `fk_ticket_res` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`),
  CONSTRAINT `fk_ticket_passenger` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`id`),
  CONSTRAINT `fk_ticket_flight` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`id`)
) ENGINE=InnoDB;