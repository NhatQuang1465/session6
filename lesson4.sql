CREATE TABLE lesson4.OrderInfo (
    id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total NUMERIC(10,2),
    status VARCHAR(20)
);

INSERT INTO lesson4.OrderInfo (customer_id, order_date, total, status) VALUES
(1, '2024-10-05', 450000, 'Pending'),
(2, '2024-10-10', 750000, 'Completed'),
(3, '2024-10-15', 1200000, 'Shipping'),
(4, '2024-09-28', 300000, 'Cancelled'),
(5, '2024-10-20', 900000, 'Processing');

SELECT *
FROM lesson4.OrderInfo
WHERE total > 500000;

SELECT *
FROM lesson4.OrderInfo
WHERE order_date BETWEEN '2024-10-01' AND '2024-10-31';

SELECT *
FROM lesson4.OrderInfo
WHERE status <> 'Completed';

SELECT *
FROM lesson4.OrderInfo
ORDER BY order_date DESC
LIMIT 2;