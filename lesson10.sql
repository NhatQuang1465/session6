CREATE TABLE lesson10.Oldcustomers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE lesson10.NewCustomers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50)
);

INSERT INTO lesson10.Oldcustomers (name, city) VALUES
('Nguyen Van An', 'Ha Noi'),
('Tran Thi Binh', 'Da Nang'),
('Le Hoang Anh', 'Ho Chi Minh'),
('Pham Thu Ha', 'Ha Noi'),
('Do Quang Huy', 'Hai Phong');

INSERT INTO lesson10.NewCustomers (name, city) VALUES
('Nguyen Van An', 'Ha Noi'),
('Tran Thi Binh', 'Da Nang'),
('Bui Lan Anh', 'Ha Noi'),
('Nguyen Minh Duc', 'Can Tho'),
('Do Quang Huy', 'Hai Phong');

SELECT name, city FROM lesson10.Oldcustomers
UNION
SELECT name, city FROM lesson10.NewCustomers;

SELECT name, city FROM lesson10.Oldcustomers
INTERSECT
SELECT name, city FROM lesson10.NewCustomers;

SELECT 
    city,
    COUNT(*) AS total_customers
FROM (
    SELECT name, city FROM lesson10.Oldcustomers
    UNION ALL
    SELECT name, city FROM lesson10.NewCustomers
) 
GROUP BY city;

SELECT city, total_customers
FROM (
    SELECT 
        city,
        COUNT(*) AS total_customers
    FROM (
        SELECT name, city FROM lesson10.Oldcustomers
        UNION ALL
        SELECT name, city FROM lesson10.NewCustomers
    ) 
    GROUP BY city
) 
WHERE total_customers = (
    SELECT MAX(total_customers)
    FROM (
        SELECT 
            city,
            COUNT(*) AS total_customers
        FROM (
            SELECT name, city FROM lesson10.Oldcustomers
            UNION ALL
            SELECT name, city FROM lesson10.NewCustomers
        ) 
        GROUP BY city
    ) 
);