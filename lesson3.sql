CREATE TABLE lesson3.Customer (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    points INT
);

INSERT INTO lesson3.Customer (name, email, phone, points) VALUES
('Nguyen Van An', 'an@gmail.com', '0901111111', 120),
('Tran Thi Hoa', 'hoa@gmail.com', '0902222222', 250),
('Le Minh Tuan', NULL, '0903333333', 180),
('Pham Thu Ha', 'ha@gmail.com', '0904444444', 300),
('Do Quang Huy', 'huy@gmail.com', '0905555555', 90),
('Nguyen Van An', 'an2@gmail.com', '0906666666', 210),
('Bui Lan Anh', 'lananh@gmail.com', '0907777777', 150);

SELECT DISTINCT name
FROM lesson3.Customer;

SELECT *
FROM lesson3.Customer
WHERE email IS NULL;

SELECT *
FROM lesson3.Customer
ORDER BY points DESC
LIMIT 3 OFFSET 1;

SELECT *
FROM lesson3.Customer
ORDER BY name DESC;