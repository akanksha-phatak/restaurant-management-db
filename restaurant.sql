-- Schema SQL
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    phone VARCHAR(15),
    address VARCHAR(100),
    type VARCHAR(10)
);

CREATE TABLE Menu (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    item_name VARCHAR(50),
    price DECIMAL(5,2)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(7,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Order_Items (
    order_id INT,
    item_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (item_id) REFERENCES Menu(item_id)
);

CREATE TABLE Delivery (
    delivery_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    delivery_boy VARCHAR(50),
    area_code INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

CREATE TABLE Payment (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    amount DECIMAL(7,2),
    status VARCHAR(20),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);



-- Query SQL
INSERT INTO Customers (name, phone, address, type)
VALUES 
('Akanksha Phatak', '9876543210', 'Pune - Chinchwad', 'Premium'),
('Rahul Sharma', '9123456789', 'Pune - Wakad', 'Regular'),
('Sneha Patil', '9988776655', 'Pune - Hinjewadi', 'Premium');

INSERT INTO Menu (item_name, price)
VALUES 
('Paneer Butter Masala', 250),
('Veg Biryani', 180),
('Dal Tadka', 150),
('Butter Roti', 30),
('Jeera Rice', 120);

INSERT INTO Orders (customer_id, order_date, total_amount)
VALUES 
(1, CURDATE(), 430),
(2, CURDATE(), 210),
(3, CURDATE(), 300);

INSERT INTO Order_Items (order_id, item_id, quantity)
VALUES 
(1, 1, 1),
(1, 2, 1),
(2, 3, 1),
(2, 4, 2),
(3, 1, 1),
(3, 5, 1);

INSERT INTO Delivery (order_id, delivery_boy, area_code)
VALUES 
(1, 'Ramesh', 411033),
(2, 'Suresh', 411057),
(3, 'Amit', 411018);

INSERT INTO Payment (order_id, amount, status)
VALUES 
(1, 430, 'Paid'),
(2, 210, 'Paid'),
(3, 300, 'Pending');
SELECT * FROM Customers;
SELECT * FROM Menu;
SELECT * FROM Orders;
SELECT * FROM Payment;
SELECT c.name, o.order_id, o.total_amount
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id;
