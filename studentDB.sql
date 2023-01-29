DROP DATABASE IF EXISTS srh_02;
CREATE DATABASE srh_02;
USE srh_02;

-- STUDENTS TABLE
-- create Table
CREATE TABLE students(
student_id INT(10) AUTO_INCREMENT,
last_name VARCHAR(30) NOT NULL,
first_name VARCHAR(30) NOT NULL,
gender VARCHAR(10) NOT NULL,
email_id VARCHAR(45) NOT NULL,
course VARCHAR(40) NOT NULL,
batch VARCHAR(40) NOT NULL,
PRIMARY KEY(student_id)
);
ALTER TABLE students AUTO_INCREMENT=10000;

-- alter table structure
ALTER TABLE students ADD COLUMN current_status VARCHAR(15) DEFAULT 'Active' AFTER batch;
ALTER TABLE students ADD UNIQUE(email_id);

-- edit table data
INSERT INTO students(last_name, first_name, gender, email_id, course, batch) VALUES('Green','Rachel','Female','rachel@gmail.com','IT','S-2022');
UPDATE students SET current_status = 'InActive' WHERE student_id = '10017';

-- display data
SELECT * from students;
SELECT student_id, last_name, first_name, gender, email_id, course, batch FROM students WHERE current_status = 'InActive';
-- -------------------------------------------------------------


-- STUDENT ADDRESS TABLE
CREATE TABLE student_address(
student_id INT(10) NOT NULL UNIQUE,
phone VARCHAR(20),
street VARCHAR(50),
pincode DECIMAL(5,0) zerofill, -- restricted to 5 digits
city VARCHAR(50),
country VARCHAR(50),
INDEX `idx_student_id_address` (student_id),
CONSTRAINT `fk_student_id_address` FOREIGN KEY(student_id) REFERENCES students(student_id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- display data
SELECT * FROM student_address;

-- edit table data
INSERT INTO student_address VALUES(10001, 02356, 'BS23', 69123, 'Heidelberg', 'DE'); 
-- -------------------------------------------------------------



-- STUDENT MARKSHEET TABLE
CREATE TABLE student_scorecard(
student_id INT(10) NOT NULL,
semester varchar(10),
subject_name VARCHAR(40),
score VARCHAR(10),
credits_earned VARCHAR(10),
INDEX `idx_student_id_scorecard` (student_id),
CONSTRAINT `fk_student_id_scorecard` FOREIGN KEY(student_id) REFERENCES students(student_id) ON UPDATE CASCADE ON DELETE CASCADE
);

SELECT * FROM student_scorecard;
INSERT INTO student_scorecard VALUES(10001, 'one', 'CTCS', 1.2, 8);

-- -------------------------------------------------------------



















