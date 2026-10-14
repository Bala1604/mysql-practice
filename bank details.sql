create database if not exists bank1;
use bank1;

drop table if exists accounts;
drop table if exists customer;

create table customer(
cus_id int primary key auto_increment, 
cus_name varchar(50) not null, 
city varchar(50) not null
);

INSERT INTO customer (cus_name, city)
VALUES
('Janani','Chennai'),
('Arun','Coimbatore'),
('Priya','Madurai'),
('Karthik','Salem');

select * from customer;


CREATE TABLE accounts (
    acc_id INT PRIMARY KEY AUTO_INCREMENT,
    cus_id INT,
    acc_type VARCHAR(20),
    balance DECIMAL(10,2),
    FOREIGN KEY (cus_id) REFERENCES customer(cus_id)
);

INSERT INTO accounts (cus_id, acc_type, balance)
VALUES
(1, 'savings', 50000),
(1, 'current', 20000),
(2, 'savings', 30000),
(3, 'savings', 15000),
(4, 'current', 40000);

select * from accounts;

select * from accounts where balance > 20000;

select * from customer where city = 'Chennai';

select * from accounts where balance between 20000 and 50000;

select * from customer where cus_name like 'j%';

select * from accounts where acc_type in('savings','current');

select * from accounts where acc_type <> 'savings';

select * from customer where cus_name like '%a%';

select * from accounts where balance <=30000;

select * from customer where city <> 'madurai';

select * from accounts where balance between 10000 and 40000;

select * from customer where cus_name like '%i';

select * from accounts where balance = 50000;

select * from customer where city in ('chennai','salem');

select * from accounts where balance > 10000 and balance < 40000;

select * from accounts where acc_type not in ('current');

select * from accounts order by balance desc;

select * from customer order by cus_name asc;

select * from accounts order by acc_type asc, balance desc;

select sum(balance) as total_balance from accounts;

select avg(balance) as average_balance from accounts;

select max(balance) as maximum_balance from accounts;

select min(balance) as minimum_balance from accounts;

select count(*) as total_customers from customer;

select acc_type,
       sum(balance) as total_balance from accounts group by acc_type;

SELECT
    acc_type,
    AVG(balance) AS average_balance
FROM accounts
GROUP BY acc_type;
       
SELECT
    acc_type,
    AVG(balance) AS average_balance
FROM accounts
GROUP BY acc_type
HAVING AVG(balance) > 20000;

SELECT
    c.cus_id,
    c.cus_name,
    COUNT(a.acc_id) AS total_accounts
FROM customer c
LEFT JOIN accounts a
    ON c.cus_id = a.cus_id
GROUP BY c.cus_id, c.cus_name;

SELECT
    c.cus_id,
    c.cus_name,
    c.city,
    COUNT(a.acc_id) AS total_accounts
FROM customer c
INNER JOIN accounts a
    ON c.cus_id = a.cus_id
GROUP BY c.cus_id, c.cus_name, c.city
HAVING COUNT(a.acc_id) > 1;


SELECT
    c.cus_name,
    a.balance
FROM customer c
INNER JOIN accounts a
    ON c.cus_id = a.cus_id;


SELECT
    c.cus_id,
    c.cus_name,
    c.city,
    a.acc_type,
    a.balance
FROM customer c
LEFT JOIN accounts a
    ON c.cus_id = a.cus_id;


SELECT
    c.cus_id,
    c.cus_name,
    c.city,
    a.acc_type,
    a.balance
FROM customer c
LEFT JOIN accounts a
    ON c.cus_id = a.cus_id;


SELECT
    a.acc_id,
    a.acc_type,
    a.balance,
    c.cus_name,
    c.city
FROM accounts a
INNER JOIN customer c
    ON a.cus_id = c.cus_id;


SELECT
    c.cus_name,
    a.acc_type,
    a.balance
FROM customer c
INNER JOIN accounts a
    ON c.cus_id = a.cus_id
WHERE a.balance > 20000;



SELECT
    c.cus_id,
    c.cus_name,
    SUM(a.balance) AS total_balance
FROM customer c
INNER JOIN accounts a
    ON c.cus_id = a.cus_id
GROUP BY c.cus_id, c.cus_name;


SELECT
    c.cus_name,
    a.balance
FROM customer c
INNER JOIN accounts a
    ON c.cus_id = a.cus_id
ORDER BY a.balance ASC;


SELECT
    c.city,
    COUNT(a.acc_id) AS total_accounts
FROM customer c
INNER JOIN accounts a
    ON c.cus_id = a.cus_id
GROUP BY c.city;



SELECT *
FROM accounts
WHERE balance > (
    SELECT AVG(balance)
    FROM accounts
);


SELECT DISTINCT
    c.cus_id,
    c.cus_name,
    c.city
FROM customer c
INNER JOIN accounts a
    ON c.cus_id = a.cus_id;


SELECT
    c.cus_id,
    c.cus_name,
    c.city
FROM customer c
LEFT JOIN accounts a
    ON c.cus_id = a.cus_id
WHERE a.acc_id IS NULL;


SELECT *
FROM accounts
WHERE balance = (
    SELECT MAX(balance)
    FROM accounts
);


SELECT
    c.cus_id,
    c.cus_name,
    SUM(a.balance) AS total_balance
FROM customer c
INNER JOIN accounts a
    ON c.cus_id = a.cus_id
GROUP BY c.cus_id, c.cus_name
HAVING SUM(a.balance) > 40000;



