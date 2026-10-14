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

-- 1.	Retrieve all accounts with balance greater than 20,000. 
select * from accounts where balance > 20000;

-- 2.	Find customers who live in Chennai. 
select * from customer where city = 'Chennai';

-- 3.	Display accounts with balance between 20,000 and 50,000. 
select * from accounts where balance between 20000 and 50000;

-- 4.	Find customers whose names start with 'J'. 
select * from customer where cus_name like 'j%';

-- 5.	Retrieve accounts of type 'Savings' or 'Current'
select * from accounts where acc_type in('savings','current');

-- 6.	Display accounts that are not 'Savings'. 
select * from accounts where acc_type <> 'savings';

-- 7.	Find customers whose names contain the letter 'a'. 
select * from customer where cus_name like '%a%';

-- 8.	Retrieve accounts with balance less than or equal to 30,000. 
select * from accounts where balance <=30000;

-- 9.	Find customers who are not from Madurai. 
select * from customer where city <> 'madurai';

-- 10.	Display accounts where balance is not between 10,000 and 40,000. 
select * from accounts where balance between 10000 and 40000;

-- 11.	Retrieve customers whose names end with 'i'
select * from customer where cus_name like '%i';

-- 12.	Find accounts with balance equal to 50,000. 
select * from accounts where balance = 50000;

-- 13.	Display customers whose city is either Chennai or Salem. 
select * from customer where city in ('chennai','salem');

-- 14.	Find accounts with balance greater than 10,000 and less than 40,000. 
select * from accounts where balance > 10000 and balance < 40000;

-- 15.	Retrieve accounts where account type is not in ('Current'). 
select * from accounts where acc_type not in ('current');

-- 16.	Display all accounts sorted by balance in descending order
select * from accounts order by balance desc;

-- 17.	List customers sorted alphabetically by name. 
select * from customer order by cus_name asc;

-- 18.	Display accounts sorted by account type and then by balance (descending). 
select * from accounts order by acc_type asc, balance desc;

-- 19.	Find the total balance of all accounts
select sum(balance) as total_balance from accounts;

-- 20.	Calculate the average balance of accounts. 
select avg(balance) as average_balance from accounts;

-- 21.	Find the maximum account balance. 
select max(balance) as maximum_balance from accounts;

-- 22.	Find the minimum account balance. 
select min(balance) as minimum_balance from accounts;

-- 23.	Count the total number of customers. 
select count(*) as total_customers from customer;

-- 24.	Find total balance grouped by account type. 
select acc_type,
       sum(balance) as total_balance from accounts group by acc_type;

-- 25.	Find average balance for each account type. 
SELECT
    acc_type,
    AVG(balance) AS average_balance
FROM accounts
GROUP BY acc_type;
    
--  26.	Display account types having average balance greater than 20,000.    
SELECT
    acc_type,
    AVG(balance) AS average_balance
FROM accounts
GROUP BY acc_type
HAVING AVG(balance) > 20000;

-- 27.	Count number of accounts for each customer. 
SELECT
    c.cus_id,
    c.cus_name,
    COUNT(a.acc_id) AS total_accounts
FROM customer c
LEFT JOIN accounts a
    ON c.cus_id = a.cus_id
GROUP BY c.cus_id, c.cus_name;


-- 28.	Display customers having more than one account. 
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

-- 29.	Retrieve customer names along with their account balances
SELECT
    c.cus_name,
    a.balance
FROM customer c
INNER JOIN accounts a
    ON c.cus_id = a.cus_id;


-- 30.	Display all customers and their accounts (including customers without accounts). 
SELECT
    c.cus_id,
    c.cus_name,
    c.city,
    a.acc_type,
    a.balance
FROM customer c
LEFT JOIN accounts a
    ON c.cus_id = a.cus_id;

-- 31.	Display all accounts and corresponding customer details. 

SELECT
    a.acc_id,
    a.acc_type,
    a.balance,
    c.cus_name,
    c.city
FROM accounts a
INNER JOIN customer c
    ON a.cus_id = c.cus_id;


 -- 32.	Retrieve customer names and account types where balance is greater than 20,000. 

SELECT
    c.cus_name,
    a.acc_type,
    a.balance
FROM customer c
INNER JOIN accounts a
    ON c.cus_id = a.cus_id
WHERE a.balance > 20000;


-- 33.	List customers with their total balance using JOIN. 

SELECT
    c.cus_id,
    c.cus_name,
    SUM(a.balance) AS total_balance
FROM customer c
INNER JOIN accounts a
    ON c.cus_id = a.cus_id
GROUP BY c.cus_id, c.cus_name;



-- 34.	Display customer names and balances sorted by balance. 

SELECT
    c.cus_name,
    a.balance
FROM customer c
INNER JOIN accounts a
    ON c.cus_id = a.cus_id
ORDER BY a.balance ASC;


-- 35.	Count number of accounts for each city using JOIN. 

SELECT
    c.city,
    COUNT(a.acc_id) AS total_accounts
FROM customer c
INNER JOIN accounts a
    ON c.cus_id = a.cus_id
GROUP BY c.city;

-- 36.	Find accounts with balance greater than average balance. 

SELECT *
FROM accounts
WHERE balance > (
    SELECT AVG(balance)
    FROM accounts
);


-- 37.	Retrieve customers who have accounts 
SELECT DISTINCT
    c.cus_id,
    c.cus_name,
    c.city
FROM customer c
INNER JOIN accounts a
    ON c.cus_id = a.cus_id;

-- 38.	Find customers who do not have any accounts. 
SELECT
    c.cus_id,
    c.cus_name,
    c.city
FROM customer c
LEFT JOIN accounts a
    ON c.cus_id = a.cus_id
WHERE a.acc_id IS NULL;

-- 39.	Display account(s) with the maximum balance. 
SELECT *
FROM accounts
WHERE balance = (
    SELECT MAX(balance)
    FROM accounts
);

-- 40.	Find customers whose total balance is greater than 40,000.
SELECT
    c.cus_id,
    c.cus_name,
    SUM(a.balance) AS total_balance
FROM customer c
INNER JOIN accounts a
    ON c.cus_id = a.cus_id
GROUP BY c.cus_id, c.cus_name
HAVING SUM(a.balance) > 40000;



