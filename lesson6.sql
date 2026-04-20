CREATE TABLE lesson6.Orders (
    id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount NUMERIC(10,2)
);

INSERT INTO lesson6.Orders (customer_id, order_date, total_amount) VALUES
(1, '2023-01-10', 12000000),
(2, '2023-05-15', 8000000),
(3, '2024-02-20', 15000000),
(4, '2024-10-05', 6000000),
(5, '2025-03-12', 20000000),
(6, '2025-06-18', 5000000),
(7, '2025-08-25', 18000000),
(8, '2024-11-30', 7000000);

-- 1. Tổng doanh thu, số đơn hàng, giá trị trung bình
SELECT 
    SUM(total_amount) AS total_revenue,
    COUNT(*) AS total_orders,
    AVG(total_amount) AS average_order_value
FROM lesson6.Orders;

-- 2. Doanh thu theo năm
SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    SUM(total_amount) AS yearly_revenue
FROM lesson6.Orders
GROUP BY EXTRACT(YEAR FROM order_date)
ORDER BY year;

-- 3. Chỉ hiển thị năm có doanh thu > 50 triệu
SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    SUM(total_amount) AS yearly_revenue
FROM lesson6.Orders
GROUP BY EXTRACT(YEAR FROM order_date)
HAVING SUM(total_amount) > 50000000
ORDER BY year;

-- 4. 5 đơn hàng có giá trị cao nhất
SELECT *
FROM lesson6.Orders
ORDER BY total_amount DESC
LIMIT 5;