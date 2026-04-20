CREATE TABLE lesson8.Customer (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE lesson8.Orders (
    id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount NUMERIC(10,2)
);

-- Dữ liệu Customer
INSERT INTO lesson8.Customer (name) VALUES
('Nguyen Van An'),
('Tran Thi Binh'),
('Le Hoang Anh'),
('Pham Thu Ha'),
('Do Quang Huy');

-- Dữ liệu Orders
INSERT INTO lesson8.Orders (customer_id, order_date, total_amount) VALUES
(1, '2024-10-10', 5000000),
(1, '2024-10-15', 7000000),
(2, '2024-09-12', 3000000),
(3, '2024-10-20', 12000000),
(3, '2024-11-05', 8000000),
(4, '2024-08-01', 2000000);

-- 1. Tổng tiền mỗi khách hàng + sắp xếp giảm dần
SELECT 
    c.name AS customer_name,
    SUM(o.total_amount) AS total_spent
FROM lesson8.Customer c
JOIN lesson8.Orders o
ON c.id = o.customer_id
GROUP BY c.name
ORDER BY total_spent DESC;

-- 2. Khách hàng có tổng chi tiêu cao nhất (Subquery MAX)
SELECT 
    c.name,
    SUM(o.total_amount) AS total_spent
FROM lesson8.Customer c
JOIN lesson8.Orders o
ON c.id = o.customer_id
GROUP BY c.name
HAVING SUM(o.total_amount) = (
    SELECT MAX(total_sum)
    FROM (
        SELECT SUM(total_amount) AS total_sum
        FROM lesson8.Orders
        GROUP BY customer_id
    ) 
);

-- 3. Khách hàng chưa từng mua hàng
SELECT 
    c.id,
    c.name
FROM lesson8.Customer c
LEFT JOIN lesson8.Orders o
ON c.id = o.customer_id
WHERE o.id IS NULL;

-- 4. Khách hàng có tổng chi tiêu > trung bình toàn bộ khách
SELECT 
    c.name,
    SUM(o.total_amount) AS total_spent
FROM lesson8.Customer c
JOIN lesson8.Orders o
ON c.id = o.customer_id
GROUP BY c.name
HAVING SUM(o.total_amount) > (
    SELECT AVG(total_sum)
    FROM (
        SELECT SUM(total_amount) AS total_sum
        FROM lesson8.Orders
        GROUP BY customer_id
    ) 
);