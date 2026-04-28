Schema SQL

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


Query SQL

INSERT INTO Customers (name, phone, address, type)
VALUES 
('Akanksha Phatak', '9876543210', 'Pune - Chinchwad', 'Premium'),
('Rahul Sharma', '9123456789', 'Pune - Wakad', 'Regular'),
('Ankita Joshi', '9365284537', 'Pune - Shivajinagar', 'Regular'),
('Priya Mehta', '9853816962', 'Pune - Kothrud', 'Premium'),
('Shubham Chavan', '9766666525', 'Pune - Warje', 'Premium'),
('Neha Saxena', '9077065529', 'Pune - Hinjewadi', 'Regular'),
('Swati Kumthekar', '9890690608', 'Pune - Kothrud', 'Premium'),
('Sneha Patil', '9988776655', 'Pune - Hinjewadi', 'Premium');

INSERT INTO Menu (item_name, price)
VALUES 
('Paneer Butter Masala', 250),
('Veg Pulao', 160),
('Veg Biryani', 180),
('Rajasthani Thali', 180),
('Punjabi Thali', 240),
('Dal Tadka', 150),
('Butter Roti', 30),
('Butter Naan', 50),
('Dal Bati Churma', 130),
('Jeera Rice', 120);


INSERT INTO Orders (customer_id, order_date, total_amount)
VALUES 
(1, CURDATE(), 410),
(2, CURDATE(), 210),
(3, CURDATE(), 250),
(4, CURDATE(), 300),
(5, CURDATE(), 180),
(6, CURDATE(), 150),
(7, CURDATE(), 280),
(8, CURDATE(), 240);

INSERT INTO Order_Items (order_id, item_id, quantity)
VALUES 
(1, 1, 1),  -- Paneer Butter Masala
(1, 2, 1),  -- Veg Pulao

(2, 3, 1),  -- Veg Biryani
(2, 7, 1),  -- Butter Roti

(3, 1, 1),  
(3, 7, 2),

(4, 5, 1),

(5, 4, 1),

(6, 6, 1),

(7, 1, 1),
(7, 8, 1),

(8, 5, 1);

INSERT INTO Delivery (order_id, delivery_boy, area_code)
VALUES 
(1, 'Ramesh', 411033),
(2, 'Suresh', 411057),
(3, 'Amit', 411018),
(4, 'Ramesh', 411025),
(5, 'Suresh', 411048),
(6, 'Ramesh', 411043),
(7, 'Suresh', 411002),
(8, 'Amit', 411016);

INSERT INTO Payment (order_id, amount, status)
VALUES 
(1, 410, 'Paid'),
(2, 210, 'Paid'),
(3, 250, 'Paid'),
(4, 300, 'Pending'),
(5, 180, 'Pending'),
(6, 150, 'Paid'),
(7, 280, 'Paid'),
(8, 240, 'Pending');

SELECT * FROM Customers;
SELECT * FROM Menu;
SELECT * FROM Orders;
SELECT * FROM Payment;

SELECT c.name, o.order_id, o.total_amount
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id;

INSERT INTO Customers (name, phone, address, type)
VALUES ('Demo User', '9000000000', 'Pune - Baner', 'Regular');
SELECT * FROM Customers;

UPDATE Customers
SET type = 'Premium'
WHERE name = 'Demo User';
SELECT * FROM Customers;

DELETE FROM Customers
WHERE name = 'Demo User';
SELECT * FROM Customers;