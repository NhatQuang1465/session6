CREATE TABLE lesson9.Product (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    price NUMERIC(16,2)
);

CREATE TABLE lesson9.OrderDetail (
    id SERIAL PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT
);

-- Dữ liệu Product
INSERT INTO lesson9.Product (name, category, price) VALUES
('Laptop Dell', 'Điện tử', 15000000),
('Tai nghe Sony', 'Điện tử', 2000000),
('Bàn phím cơ', 'Phụ kiện', 1200000),
('Chuột Logitech', 'Phụ kiện', 800000),
('Điện thoại Samsung', 'Điện tử', 18000000);

-- Dữ liệu OrderDetail
INSERT INTO lesson9.OrderDetail (order_id, product_id, quantity) VALUES
(1, 1, 2),
(1, 2, 5),
(2, 1, 1),
(2, 3, 10),
(3, 5, 3),
(4, 2, 7);

-- 1. Doanh thu từng sản phẩm
SELECT
    p.name AS product_name,
    SUM(p.price * od.quantity) AS total_sales
FROM lesson9.Product p
JOIN lesson9.OrderDetail od
ON p.id = od.product_id
GROUP BY p.name
ORDER BY total_sales DESC;

-- 2. Doanh thu trung bình theo từng loại sản phẩm
SELECT 
    p.category,
    AVG(p.price * od.quantity) AS avg_sales
FROM lesson9.Product p
JOIN lesson9.OrderDetail od
ON p.id = od.product_id
GROUP BY p.category;

-- 3. Loại sản phẩm có doanh thu trung bình > 20 triệu
SELECT 
    p.category,
    AVG(p.price * od.quantity) AS avg_sales
FROM lesson9.Product p
JOIN lesson9.OrderDetail od
ON p.id = od.product_id
GROUP BY p.category
HAVING AVG(p.price * od.quantity) > 20000000;

-- 4. Sản phẩm có doanh thu > trung bình toàn bộ sản phẩm
SELECT 
    p.name,
    SUM(p.price * od.quantity) AS total_sales
FROM lesson9.Product p
JOIN lesson9.OrderDetail od
ON p.id = od.product_id
GROUP BY p.name
HAVING SUM(p.price * od.quantity) > (
    SELECT AVG(total_sales)
    FROM (
        SELECT SUM(p2.price * od2.quantity) AS total_sales
        FROM lesson9.Product p2
        JOIN lesson9.OrderDetail od2
        ON p2.id = od2.product_id
        GROUP BY p2.id
    ) 
);

-- 5. Tất cả sản phẩm + số lượng bán (kể cả chưa bán)
SELECT 
    p.name AS product_name,
    COALESCE(SUM(od.quantity), 0) AS total_quantity_sold
FROM lesson9.Product p
LEFT JOIN lesson9.OrderDetail od
ON p.id = od.product_id
GROUP BY p.name;