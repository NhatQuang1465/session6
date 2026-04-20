CREATE TABLE lesson5.course (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100),
    instructor VARCHAR(50),
    price NUMERIC(10,2),
    duration INT
);

INSERT INTO lesson5.course (title, instructor, price, duration) VALUES
('SQL Basic', 'Nguyen A', 500000, 20),
('Advanced SQL', 'Tran B', 1200000, 35),
('Python for Data', 'Le C', 1500000, 40),
('SQL Demo Course', 'Pham D', 300000, 10),
('Web Development', 'Hoang E', 2000000, 45),
('SQL Optimization', 'Vu F', 1800000, 32);

-- Cập nhật giá tăng 15% cho khóa học > 30 giờ
UPDATE lesson5.course
SET price = price * 1.15
WHERE duration > 30;

-- Xóa khóa học có "Demo" trong tên
DELETE FROM lesson5.course
WHERE title ILIKE '%Demo%';

-- Khóa học có chứa "SQL" (không phân biệt hoa thường)
SELECT *
FROM lesson5.course
WHERE title ILIKE '%SQL%';

-- Lấy 3 khóa học giá từ 500k đến 2 triệu, sắp xếp giảm dần
SELECT *
FROM lesson5.course
WHERE price BETWEEN 500000 AND 2000000
ORDER BY price DESC
LIMIT 3;