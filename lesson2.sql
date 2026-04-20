CREATE TABLE lesson2.Employee (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(100),
    department VARCHAR(50),
    salary NUMERIC(10,2),
    hire_date DATE
);

INSERT INTO lesson2.Employee (full_name, department, salary, hire_date) VALUES
('Nguyen Van An', 'IT', 12000000, '2023-02-15'),
('Tran Thi Binh', 'HR', 7500000, '2022-08-10'),
('Le Hoang Anh', 'IT', 15000000, '2023-06-20'),
('Pham Minh An', 'Sales', 5800000, '2023-09-05'),
('Do Thu Ha', 'Marketing', 9000000, '2024-01-12'),
('Vu Tuan Kiet', 'IT', 5500000, '2023-11-18');

UPDATE lesson2.Employee
SET salary = salary * 1.10
WHERE department = 'IT';

DELETE FROM lesson2.Employee
WHERE salary < 6000000;

SELECT *
FROM lesson2.Employee
WHERE full_name ILIKE '%An%';

SELECT *
FROM lesson2.Employee
WHERE hire_date BETWEEN '2023-01-01' AND '2023-12-31';