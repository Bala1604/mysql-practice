create database customer_order_db;
use customer_order_db;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(30)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id)
);

INSERT INTO Customers (customer_id, customer_name, city)
VALUES
(1, 'Arun', 'Chennai'),
(2, 'Priya', 'Madurai'),
(3, 'Karthik', 'Coimbatore'),
(4, 'Meena', 'Chennai'),
(5, 'Divya', 'Salem'),
(6, 'Ravi', 'Madurai');

INSERT INTO Orders (order_id, customer_id, amount, order_date)
VALUES
(101, 1, 5000, '2026-01-10'),
(102, 2, 3000, '2026-01-15'),
(103, 1, 2500, '2026-02-05'),
(104, 3, 7000, '2026-02-10'),
(105, 4, 1500, '2026-02-20'),
(106, 2, 4500, '2026-03-01'),
(107, 5, 2000, '2026-03-05');

select * from Customers;

select * from Orders;

-- 1.	Find the total order amount for each customer
SELECT c.customer_id, c.customer_name,
       SUM(o.amount) AS total_purchase
FROM Customers c
INNER JOIN Orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;

-- 2.	Find customers who have placed more than 3 orders. 
SELECT c.customer_id, c.customer_name,
       COUNT(o.order_id) AS total_orders
FROM Customers c
INNER JOIN Orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) > 3;

-- 3.	Find the average order amount for each customer. 
SELECT c.customer_id, c.customer_name,
       AVG(o.amount) AS average_order_amount
FROM Customers c
INNER JOIN Orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;

-- 4.	Find the highest order amount placed by each customer. 
SELECT c.customer_id, c.customer_name,
       MAX(o.amount) AS highest_order_amount
FROM Customers c
INNER JOIN Orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;

-- 5.	Display customers sorted by their total purchase amount. 
SELECT c.customer_id, c.customer_name,
       SUM(o.amount) AS total_purchase
FROM Customers c
INNER JOIN Orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_purchase DESC;

-- 6.	Find customers whose total purchase amount exceeds 10,000.
SELECT c.customer_id, c.customer_name,
       SUM(o.amount) AS total_purchase
FROM Customers c
INNER JOIN Orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(o.amount) > 10000;
 
-- 7.	Display customer names along with the total number of orders placed. 
SELECT c.customer_name,
       COUNT(o.order_id) AS total_orders
FROM Customers c
LEFT JOIN Orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;

-- 8.	Find the customer who spent the highest amount. 
SELECT c.customer_id, c.customer_name,
       SUM(o.amount) AS total_purchase
FROM Customers c
INNER JOIN Orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(o.amount) = (
    SELECT MAX(customer_total)
    FROM (
        SELECT SUM(amount) AS customer_total
        FROM Orders
        GROUP BY customer_id
    ) AS totals
);

-- 9.	Find the customer who placed the maximum number of orders. 
SELECT c.customer_id, c.customer_name,
       COUNT(o.order_id) AS total_orders
FROM Customers c
INNER JOIN Orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) = (
    SELECT MAX(order_count)
    FROM (
        SELECT COUNT(*) AS order_count
        FROM Orders
        GROUP BY customer_id
    ) AS order_totals
);

-- 10.	Find customers whose average order amount is greater than 2,000. 
SELECT c.customer_id, c.customer_name,
       AVG(o.amount) AS average_order_amount
FROM Customers c
INNER JOIN Orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING AVG(o.amount) > 2000;

-- 11.	Display the top 5 customers based on total purchase amount. 
SELECT c.customer_id, c.customer_name,
       SUM(o.amount) AS total_purchase
FROM Customers c
INNER JOIN Orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_purchase DESC, c.customer_name ASC
LIMIT 5;

-- 12.	Find the minimum order amount for each customr. 
SELECT c.customer_id, c.customer_name,
       MIN(o.amount) AS minimum_order_amount
FROM Customers c
INNER JOIN Orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;

-- 13.	Find customers who have placed orders worth more than 5,000 in total. 
SELECT c.customer_id, c.customer_name,
       SUM(o.amount) AS total_purchase
FROM Customers c
INNER JOIN Orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(o.amount) > 5000;

-- 14.	Display customer-wise total orders and total purchase amount. 
SELECT c.customer_id, c.customer_name,
       COUNT(o.order_id) AS total_orders,
       COALESCE(SUM(o.amount), 0) AS total_purchase
FROM Customers c
LEFT JOIN Orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;

-- 15.	Find customers who placed more than 2 orders and spent more than 8,000
SELECT c.customer_id, c.customer_name,
       COUNT(o.order_id) AS total_orders,
       SUM(o.amount) AS total_purchase
FROM Customers c
INNER JOIN Orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) > 2
   AND SUM(o.amount) > 8000;




