-- ===========================================================================
-- FOOD DELIVERY ANALYTICS
-- ===========================================================================
CREATE DATABASE food_delivery_db;
USE food_delivery_db;
SHOW TABLES;

CREATE TABLE customers(
customer_id INT PRIMARY KEY,
customer_name VARCHAR(50),
city VARCHAR(30),
signup_date DATE
);

CREATE TABLE restaurants(
restaurant_id INT PRIMARY KEY,
restaurant_name VARCHAR(50),
city VARCHAR(30),
cuisine VARCHAR(30)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    restaurant_id INT,
    category VARCHAR(30),
    price DECIMAL(10,2),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_time TIME,
    payment_method VARCHAR(20),
    order_status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE deliveries (
    delivery_id INT PRIMARY KEY,
    order_id INT,
    delivery_time INT,
    delivery_status VARCHAR(20),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
ALTER TABLE deliveries
ADD CONSTRAINT unique_order UNIQUE (order_id);

DESCRIBE customers;
DESCRIBE restaurants;
DESCRIBE products;
DESCRIBE orders;
DESCRIBE order_items;
DESCRIBE deliveries;

INSERT INTO customers
(customer_id, customer_name, city, signup_date)
VALUES
(1, 'Arjun Nair', 'Kochi', '2024-01-12'),
(2, 'Ananya Menon', 'Trivandrum', '2024-01-18'),
(3, 'Rahul Kumar', 'Thrissur', '2024-01-25'),
(4, 'Meera Thomas', 'Kochi', '2024-02-03'),
(5, 'Akhil Raj', 'Calicut', '2024-02-11'),
(6, 'Sneha Joseph', 'Kottayam', '2024-02-19'),
(7, 'Vishnu Prasad', 'Kochi', '2024-02-27'),
(8, 'Devika Suresh', 'Kannur', '2024-03-05'),
(9, 'Adithya Krishnan', 'Malappuram', '2024-03-14'),
(10, 'Nimisha Paul', 'Ernakulam', '2024-03-22'),
(11, 'Aman Varma', 'Kochi', '2024-04-01'),
(12, 'Diya Mathew', 'Trivandrum', '2024-04-08'),
(13, 'Nikhil Das', 'Thrissur', '2024-04-16'),
(14, 'Amritha Nair', 'Kochi', '2024-04-24'),
(15, 'Rohit Menon', 'Calicut', '2024-05-02'),
(16, 'Athira Raj', 'Kottayam', '2024-05-10'),
(17, 'Sreehari Kumar', 'Kochi', '2024-05-18'),
(18, 'Gopika Mohan', 'Kannur', '2024-05-26'),
(19, 'Abhinav Thomas', 'Malappuram', '2024-06-03'),
(20, 'Neha Joseph', 'Ernakulam', '2024-06-11'),
(21, 'Kiran Suresh', 'Kochi', '2024-06-19'),
(22, 'Aiswarya Menon', 'Trivandrum', '2024-06-27'),
(23, 'Arun Raj', 'Thrissur', '2024-07-05'),
(24, 'Keerthana Paul', 'Kochi', '2024-07-13'),
(25, 'Sanjay Kumar', 'Calicut', '2024-07-21'),
(26, 'Parvathy Nair', 'Kottayam', '2024-07-29'),
(27, 'Joel Mathew', 'Kochi', '2024-08-06'),
(28, 'Fathima Shirin', 'Kannur', '2024-08-14'),
(29, 'Rakesh Das', 'Malappuram', '2024-08-22'),
(30, 'Reshma Thomas', 'Ernakulam', '2024-08-30'),
(31, 'Hari Krishnan', 'Kochi', '2024-09-07'),
(32, 'Lakshmi Nair', 'Trivandrum', '2024-09-15'),
(33, 'Sidharth Menon', 'Thrissur', '2024-09-23'),
(34, 'Aparna Joseph', 'Kochi', '2024-10-01'),
(35, 'Manu Kumar', 'Calicut', '2024-10-09'),
(36, 'Greeshma Raj', 'Kottayam', '2024-10-17'),
(37, 'Jithin Paul', 'Kochi', '2024-10-25'),
(38, 'Swetha Suresh', 'Kannur', '2024-11-02'),
(39, 'Muhammed Rafi', 'Malappuram', '2024-11-10'),
(40, 'Sandra Mathew', 'Ernakulam', '2024-11-18'),
(41, 'Akshay Nair', 'Kochi', '2024-11-26'),
(42, 'Maya Menon', 'Trivandrum', '2024-12-04'),
(43, 'Vivek Kumar', 'Thrissur', '2024-12-12'),
(44, 'Anjali Thomas', 'Kochi', '2024-12-20'),
(45, 'Naveen Raj', 'Calicut', '2024-12-28'),
(46, 'Sona Joseph', 'Kottayam', '2025-01-05'),
(47, 'Pranav Menon', 'Kochi', '2025-01-13'),
(48, 'Ishita Nair', 'Kannur', '2025-01-21'),
(49, 'Shyam Das', 'Malappuram', '2025-01-29'),
(50, 'Asha Paul', 'Ernakulam', '2025-02-06'),
(51, 'Adarsh Kumar', 'Kochi', '2025-02-14'),
(52, 'Riya Mathew', 'Trivandrum', '2025-02-22'),
(53, 'Vineeth Raj', 'Thrissur', '2025-03-02'),
(54, 'Nandana Suresh', 'Kochi', '2025-03-10'),
(55, 'Faisal Rahman', 'Calicut', '2025-03-18'),
(56, 'Anu Thomas', 'Kottayam', '2025-03-26'),
(57, 'Roshan Joseph', 'Kochi', '2025-04-03'),
(58, 'Malavika Nair', 'Kannur', '2025-04-11'),
(59, 'Shahil Khan', 'Malappuram', '2025-04-19'),
(60, 'Maria Paul', 'Ernakulam', '2025-04-27'),
(61, 'Anoop Menon', 'Kochi', '2025-05-05'),
(62, 'Nayana Raj', 'Trivandrum', '2025-05-13'),
(63, 'Vimal Kumar', 'Thrissur', '2025-05-21'),
(64, 'Saniya Thomas', 'Kochi', '2025-05-29'),
(65, 'Rohith Nair', 'Calicut', '2025-06-06'),
(66, 'Ameya Joseph', 'Kottayam', '2025-06-14'),
(67, 'Vishal Menon', 'Kochi', '2025-06-22'),
(68, 'Greeshma Paul', 'Kannur', '2025-06-30'),
(69, 'Niyas Rahman', 'Malappuram', '2025-07-08'),
(70, 'Tina Mathew', 'Ernakulam', '2025-07-16'),
(71, 'Aravind Nair', 'Kochi', '2025-07-24'),
(72, 'Keerthi Menon', 'Trivandrum', '2025-08-01'),
(73, 'Sajin Kumar', 'Thrissur', '2025-08-09'),
(74, 'Amal Raj', 'Kochi', '2025-08-17'),
(75, 'Hiba Shirin', 'Calicut', '2025-08-25'),
(76, 'Akhil Thomas', 'Kottayam', '2025-09-02'),
(77, 'Sreya Joseph', 'Kochi', '2025-09-10'),
(78, 'Nikhil Nair', 'Kannur', '2025-09-18'),
(79, 'Shabna Rahman', 'Malappuram', '2025-09-26'),
(80, 'Alwin Paul', 'Ernakulam', '2025-10-04'),
(81, 'Abhishek Menon', 'Kochi', '2025-10-12'),
(82, 'Anagha Raj', 'Trivandrum', '2025-10-20'),
(83, 'Sreejith Kumar', 'Thrissur', '2025-10-28'),
(84, 'Nithya Nair', 'Kochi', '2025-11-05'),
(85, 'Firoz Ahmed', 'Calicut', '2025-11-13'),
(86, 'Anjana Thomas', 'Kottayam', '2025-11-21'),
(87, 'Vishnu Menon', 'Kochi', '2025-11-29'),
(88, 'Riya Joseph', 'Kannur', '2025-12-07'),
(89, 'Shameer Rahman', 'Malappuram', '2025-12-15'),
(90, 'Arya Paul', 'Ernakulam', '2025-12-23'),
(91, 'Sandeep Nair', 'Kochi', '2026-01-02'),
(92, 'Devika Menon', 'Trivandrum', '2026-01-10'),
(93, 'Ranjith Kumar', 'Thrissur', '2026-01-18'),
(94, 'Amritha Thomas', 'Kochi', '2026-01-26'),
(95, 'Sahal Rahman', 'Calicut', '2026-02-03'),
(96, 'Megha Joseph', 'Kottayam', '2026-02-11'),
(97, 'Abhiram Nair', 'Kochi', '2026-02-19'),
(98, 'Fathima Nizar', 'Kannur', '2026-02-27'),
(99, 'Rohit Menon', 'Malappuram', '2026-03-07'),
(100, 'Diya Thomas', 'Ernakulam', '2026-03-15');
SELECT COUNT(*) AS total_customers
FROM customers;
SELECT * FROM customers;

INSERT INTO restaurants
(restaurant_id, restaurant_name, city, cuisine)
VALUES
(1, 'Malabar Spice', 'Kochi', 'Kerala'),
(2, 'Burger Junction', 'Kochi', 'Fast Food'),
(3, 'Pizza Story', 'Kochi', 'Italian'),
(4, 'Calicut Kitchen', 'Calicut', 'Kerala'),
(5, 'Biryani Palace', 'Malappuram', 'Biryani'),
(6, 'Dragon Bowl', 'Trivandrum', 'Chinese'),
(7, 'Dosa Point', 'Thrissur', 'South Indian'),
(8, 'Arabian Grill', 'Kottayam', 'Arabian'),
(9, 'Cafe Coffee House', 'Kochi', 'Cafe'),
(10, 'Taco Fiesta', 'Ernakulam', 'Mexican'),
(11, 'Spice Route', 'Trivandrum', 'Indian'),
(12, 'Royal Biryani', 'Kochi', 'Biryani'),
(13, 'Wok Express', 'Calicut', 'Chinese'),
(14, 'Thattukada Express', 'Thrissur', 'Kerala'),
(15, 'Grill Nation', 'Kochi', 'Arabian'),
(16, 'Chai & More', 'Kottayam', 'Cafe'),
(17, 'The Pasta House', 'Ernakulam', 'Italian'),
(18, 'Bombay Tiffin', 'Trivandrum', 'Indian'),
(19, 'Mandi Hub', 'Malappuram', 'Arabian'),
(20, 'South Spice', 'Kannur', 'South Indian');
SELECT COUNT(*) AS total_restaurants
FROM restaurants;
SELECT * FROM restaurants;

INSERT INTO products
(product_id, product_name, restaurant_id, category, price)
VALUES
-- Malabar Spice
(1, 'Kerala Parotta', 1, 'Main Course', 45.00),
(2, 'Chicken Curry', 1, 'Main Course', 180.00),
(3, 'Fish Fry', 1, 'Main Course', 220.00),

-- Burger Junction
(4, 'Classic Chicken Burger', 2, 'Burger', 160.00),
(5, 'Cheese Burger', 2, 'Burger', 190.00),
(6, 'French Fries', 2, 'Sides', 100.00),

-- Pizza Story
(7, 'Margherita Pizza', 3, 'Pizza', 299.00),
(8, 'Chicken Supreme Pizza', 3, 'Pizza', 449.00),
(9, 'Garlic Bread', 3, 'Sides', 149.00),

-- Calicut Kitchen
(10, 'Chicken Biriyani', 4, 'Biriyani', 220.00),
(11, 'Beef Biriyani', 4, 'Biriyani', 240.00),
(12, 'Pathiri Chicken Curry', 4, 'Main Course', 200.00),

-- Biryani Palace
(13, 'Chicken Dum Biriyani', 5, 'Biriyani', 250.00),
(14, 'Mutton Biriyani', 5, 'Biriyani', 320.00),
(15, 'Chicken 65', 5, 'Starters', 180.00),

-- Dragon Bowl
(16, 'Chicken Fried Rice', 6, 'Rice', 190.00),
(17, 'Schezwan Noodles', 6, 'Noodles', 210.00),
(18, 'Chilli Chicken', 6, 'Starters', 230.00),

-- Dosa Point
(19, 'Masala Dosa', 7, 'Dosa', 90.00),
(20, 'Ghee Roast Dosa', 7, 'Dosa', 120.00),
(21, 'Idli Sambar', 7, 'Breakfast', 70.00),

-- Arabian Grill
(22, 'Chicken Shawarma', 8, 'Shawarma', 140.00),
(23, 'Chicken Alfaham', 8, 'Grill', 280.00),
(24, 'Chicken Mandi', 8, 'Mandi', 350.00),

-- Cafe Coffee House
(25, 'Cappuccino', 9, 'Beverage', 140.00),
(26, 'Cold Coffee', 9, 'Beverage', 160.00),
(27, 'Chocolate Cake', 9, 'Dessert', 180.00),

-- Taco Fiesta
(28, 'Chicken Taco', 10, 'Mexican', 180.00),
(29, 'Chicken Burrito', 10, 'Mexican', 260.00),
(30, 'Nachos', 10, 'Sides', 150.00),

-- Spice Route
(31, 'Butter Chicken', 11, 'Main Course', 280.00),
(32, 'Paneer Tikka', 11, 'Starters', 220.00),
(33, 'Garlic Naan', 11, 'Bread', 70.00),

-- Royal Biryani
(34, 'Chicken Biriyani', 12, 'Biriyani', 230.00),
(35, 'Mutton Biriyani', 12, 'Biriyani', 320.00),
(36, 'Chicken Fry', 12, 'Starters', 190.00),

-- Wok Express
(37, 'Chicken Noodles', 13, 'Noodles', 200.00),
(38, 'Chicken Fried Rice', 13, 'Rice', 210.00),
(39, 'Dragon Chicken', 13, 'Starters', 250.00),

-- Thattukada Express
(40, 'Kappa Biriyani', 14, 'Main Course', 180.00),
(41, 'Beef Fry', 14, 'Main Course', 220.00),
(42, 'Egg Roast', 14, 'Main Course', 100.00),

-- Grill Nation
(43, 'Chicken Tikka', 15, 'Grill', 250.00),
(44, 'Chicken Alfaham', 15, 'Grill', 300.00),
(45, 'Mixed Grill', 15, 'Grill', 450.00),

-- Chai & More
(46, 'Masala Chai', 16, 'Beverage', 50.00),
(47, 'Samosa', 16, 'Snacks', 40.00),
(48, 'Veg Sandwich', 16, 'Snacks', 120.00),

-- The Pasta House
(49, 'Penne Arrabbiata', 17, 'Pasta', 280.00),
(50, 'Chicken Alfredo Pasta', 17, 'Pasta', 350.00),
(51, 'Lasagna', 17, 'Pasta', 380.00),

-- Bombay Tiffin
(52, 'Pav Bhaji', 18, 'Indian', 160.00),
(53, 'Paneer Butter Masala', 18, 'Main Course', 240.00),
(54, 'Veg Thali', 18, 'Thali', 220.00),

-- Mandi Hub
(55, 'Chicken Mandi', 19, 'Mandi', 330.00),
(56, 'Mutton Mandi', 19, 'Mandi', 420.00),
(57, 'Al Faham', 19, 'Grill', 290.00),

-- South Spice
(58, 'Masala Dosa', 20, 'Dosa', 90.00),
(59, 'Podi Dosa', 20, 'Dosa', 110.00),
(60, 'Vada Sambar', 20, 'Breakfast', 70.00);
SELECT COUNT(*) AS total_products
FROM products;
SELECT * FROM products;

INSERT INTO orders
(order_id, customer_id, order_date, order_time, payment_method, order_status)
VALUES
(1, 12, '2025-01-05', '12:30:00', 'UPI', 'Delivered'),
(2, 45, '2025-01-06', '19:15:00', 'Card', 'Delivered'),
(3, 7, '2025-01-08', '13:10:00', 'UPI', 'Delivered'),
(4, 83, '2025-01-10', '20:45:00', 'Cash', 'Delivered'),
(5, 21, '2025-01-12', '14:20:00', 'Wallet', 'Delivered'),
(6, 56, '2025-01-15', '19:30:00', 'UPI', 'Cancelled'),
(7, 34, '2025-01-18', '12:45:00', 'Card', 'Delivered'),
(8, 91, '2025-01-20', '21:10:00', 'UPI', 'Delivered'),
(9, 3, '2025-01-23', '13:25:00', 'Cash', 'Delivered'),
(10, 67, '2025-01-25', '19:50:00', 'Card', 'Delivered'),
(11, 14, '2025-02-02', '12:15:00', 'UPI', 'Delivered'),
(12, 72, '2025-02-05', '20:20:00', 'Wallet', 'Delivered'),
(13, 29, '2025-02-08', '13:40:00', 'Cash', 'Delivered'),
(14, 48, '2025-02-11', '19:05:00', 'UPI', 'Delivered'),
(15, 6, '2025-02-15', '21:30:00', 'Card', 'Delivered'),
(16, 37, '2025-02-18', '12:50:00', 'UPI', 'Delivered'),
(17, 81, '2025-02-21', '20:10:00', 'Cash', 'Cancelled'),
(18, 23, '2025-02-25', '13:15:00', 'Card', 'Delivered'),
(19, 59, '2025-03-01', '19:40:00', 'UPI', 'Delivered'),
(20, 96, '2025-03-04', '12:35:00', 'Wallet', 'Delivered'),
(21, 41, '2025-03-08', '20:50:00', 'Card', 'Delivered'),
(22, 15, '2025-03-12', '13:05:00', 'UPI', 'Delivered'),
(23, 64, '2025-03-16', '19:25:00', 'Cash', 'Delivered'),
(24, 88, '2025-03-20', '21:15:00', 'UPI', 'Delivered'),
(25, 30, '2025-03-23', '12:40:00', 'Card', 'Delivered'),
(26, 52, '2025-03-26', '20:05:00', 'Wallet', 'Delivered'),
(27, 9, '2025-03-28', '13:30:00', 'UPI', 'Failed'),
(28, 76, '2025-03-30', '19:55:00', 'Card', 'Delivered'),
(29, 18, '2025-04-02', '12:20:00', 'Cash', 'Delivered'),
(30, 43, '2025-04-05', '20:35:00', 'UPI', 'Delivered');
SELECT COUNT(*) AS total_orders
FROM orders;

INSERT INTO order_items
(order_item_id, order_id, product_id, quantity)
VALUES
(1, 1, 13, 1),
(2, 1, 15, 1),

(3, 2, 4, 2),
(4, 2, 6, 1),

(5, 3, 19, 2),
(6, 3, 21, 1),

(7, 4, 24, 1),
(8, 4, 22, 2),

(9, 5, 31, 1),
(10, 5, 33, 2),

(11, 6, 34, 1),
(12, 6, 36, 1),

(13, 7, 7, 1),
(14, 7, 9, 1),

(15, 8, 43, 1),
(16, 8, 44, 1),

(17, 9, 10, 2),
(18, 9, 12, 1),

(19, 10, 25, 2),
(20, 10, 27, 1),

(21, 11, 1, 2),
(22, 11, 2, 1),

(23, 12, 16, 1),
(24, 12, 18, 1),

(25, 13, 28, 2),
(26, 13, 30, 1),

(27, 14, 49, 1),
(28, 14, 50, 1),

(29, 15, 55, 1),
(30, 15, 57, 1),

(31, 16, 40, 1),
(32, 16, 41, 1),

(33, 17, 34, 1),
(34, 17, 35, 1),

(35, 18, 52, 1),
(36, 18, 54, 1),

(37, 19, 37, 1),
(38, 19, 38, 2),

(39, 20, 58, 2),
(40, 20, 60, 1),

(41, 21, 5, 1),
(42, 21, 6, 2),

(43, 22, 20, 1),
(44, 22, 19, 2),

(45, 23, 22, 1),
(46, 23, 23, 1),

(47, 24, 31, 1),
(48, 24, 32, 1),

(49, 25, 8, 1),
(50, 25, 9, 2),

(51, 26, 43, 1),
(52, 26, 45, 1),

(53, 27, 11, 1),
(54, 27, 12, 1),

(55, 28, 14, 1),
(56, 28, 15, 1),

(57, 29, 46, 2),
(58, 29, 47, 2),

(59, 30, 55, 1),
(60, 30, 56, 1);
SELECT COUNT(*) AS total_order_items
FROM order_items;
SELECT * FROM order_items;

INSERT INTO deliveries
(delivery_id, order_id, delivery_time, delivery_status)
VALUES
(1,1,32,'Delivered'),
(2,2,41,'Delivered'),
(3,3,28,'Delivered'),
(4,4,45,'Delivered'),
(5,5,36,'Delivered'),
(6,6,NULL,'Cancelled'),
(7,7,39,'Delivered'),
(8,8,52,'Delivered'),
(9,9,31,'Delivered'),
(10,10,44,'Delivered'),
(11,11,27,'Delivered'),
(12,12,48,'Delivered'),
(13,13,35,'Delivered'),
(14,14,40,'Delivered'),
(15,15,55,'Delivered'),
(16,16,30,'Delivered'),
(17,17,NULL,'Cancelled'),
(18,18,38,'Delivered'),
(19,19,43,'Delivered'),
(20,20,29,'Delivered'),
(21,21,47,'Delivered'),
(22,22,33,'Delivered'),
(23,23,42,'Delivered'),
(24,24,50,'Delivered'),
(25,25,34,'Delivered'),
(26,26,46,'Delivered'),
(27,27,NULL,'Failed'),
(28,28,37,'Delivered'),
(29,29,31,'Delivered'),
(30,30,49,'Delivered');
SELECT * FROM deliveries;

-- ANALYTICS

-- ORDER STATUS ANALYSIS
-- Find the number of orders for each order status.
SELECT order_status, COUNT(*) AS order_count
FROM orders
GROUP BY order_status;

-- PAYMENT METHOD ANALYSIS
-- Find the number of orders made using each payment method.
SELECT payment_method, COUNT(*) AS order_count
FROM orders
GROUP BY payment_method;

-- Order Status by Payment Method
SELECT payment_method, order_status, COUNT(*) AS order_count
FROM orders
GROUP BY payment_method, order_status
ORDER BY payment_method, order_status;

-- Customer Order Analysis
-- Find the number of orders for each customer.
SELECT customer_id, COUNT(*) AS order_count
FROM orders
GROUP BY customer_id
ORDER BY order_count DESC;

-- Product Price Analysis
-- Find the highest-priced product in the products table.
SELECT product_name, price
FROM products
ORDER BY price DESC
LIMIT 1;

-- Top Restaurants by Number of Orders
SELECT r.restaurant_name,
       COUNT(DISTINCT o.order_id) AS order_count FROM restaurants r
JOIN products p ON r.restaurant_id = p.restaurant_id
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id WHERE o.order_status = 'Delivered'
GROUP BY r.restaurant_id, r.restaurant_name ORDER BY order_count DESC;

-- Top 5 Best-Selling Products
SELECT p.product_name,
       SUM(oi.quantity) AS total_quantity
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity DESC
LIMIT 5;

-- Total Revenue by Restaurant
SELECT r.restaurant_name,
       SUM(p.price * oi.quantity) AS total_revenue
FROM restaurants r
JOIN products p
    ON r.restaurant_id = p.restaurant_id
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY r.restaurant_id, r.restaurant_name
ORDER BY total_revenue DESC;



