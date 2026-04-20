CREATE TABLE lesson7.Department (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE lesson7.Employee (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(100),
    department_id INT,
    salary NUMERIC(10,2)
);

-- Dữ liệu mẫu Department
INSERT INTO lesson7.Department (name) VALUES
('IT'),
('HR'),
('Sales'),
('Marketing');

-- Dữ liệu mẫu Employee
INSERT INTO lesson7.Employee (full_name, department_id, salary) VALUES
('Nguyen Van An', 1, 15000000),
('Tran Thi Binh', 1, 12000000),
('Le Hoang Anh', 2, 8000000),
('Pham Thu Ha', 3, 20000000),
('Do Quang Huy', 3, 9000000);

-- 1. Danh sách nhân viên + tên phòng ban (INNER JOIN)
SELECT 
    e.full_name,
    d.name AS department_name,
    e.salary
FROM lesson7.Employee e
INNER JOIN lesson7.Department d
ON e.department_id = d.id;

-- 2. Lương trung bình từng phòng ban
SELECT 
    d.name AS department_name,
    AVG(e.salary) AS avg_salary
FROM lesson7.Employee e
INNER JOIN lesson7.Department d
ON e.department_id = d.id
GROUP BY d.name;

-- 3. Phòng ban có lương trung bình > 10 triệu
SELECT 
    d.name AS department_name,
    AVG(e.salary) AS avg_salary
FROM lesson7.Employee e
INNER JOIN lesson7.Department d
ON e.department_id = d.id
GROUP BY d.name
HAVING AVG(e.salary) > 10000000;

-- 4. Phòng ban không có nhân viên (LEFT JOIN)
SELECT 
    d.id,
    d.name
FROM lesson7.Department d
LEFT JOIN lesson7.Employee e
ON d.id = e.department_id
WHERE e.id IS NULL;