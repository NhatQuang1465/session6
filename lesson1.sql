CREATE TABLE lesson1.Product (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    price NUMERIC(10,2),
    stock INT
);

INSERT INTO lesson1.Product (name, category, price, stock) VALUES
('Laptop Dell', 'Điện tử', 18500000, 12),
('Tai nghe Sony', 'Điện tử', 2500000, 30),
('Bàn phím cơ', 'Phụ kiện', 1500000, 18),
('Điện thoại Samsung', 'Điện tử', 9200000, 8),
('Chuột Logitech', 'Phụ kiện', 850000, 25);

SELECT * 
FROM lesson1.Product;

SELECT * 
FROM lesson1.Product
ORDER BY price DESC
LIMIT 3;

SELECT *
FROM lesson1.Product
WHERE category = 'Điện tử'
AND price < 10000000;

SELECT *
FROM lesson1.Product
ORDER BY stock ASC;