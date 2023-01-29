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
INSERT INTO student_address VALUES(10002, 034562, 'MPS3', 69123, 'Heidelberg', 'DE'),
									(10003, 098124, 'Bismark', 69115, 'Heidelberg', 'DE'),
                                    (10004, 012873, 'MPS3', 69123, 'Heidelberg', 'DE'),
                                    (10005, 012312, 'Atlas1', 68534, 'Heidelberg', 'DE'),
                                    (10006, 038722, 'MPS3', 69123, 'Heidelberg', 'DE'),
                                    (10007, 045612, 'BS9', 69123, 'Heidelberg', 'DE'),
                                    (10008, 021981, 'BS13', 69123, 'Heidelberg', 'DE'),
                                    (10015, 098765, 'BS9', 69123, 'Heidelberg', 'DE'),
                                    (10017, 091234, 'BS11', 69123, 'Heidelberg', 'DE'),
                                    (10018, 090324, 'Abendacadmie', 79123, 'Mannheim', 'DE'),
                                    (10019, 087654, 'Neue1', 66234, 'Heidelberg', 'DE');
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

SELECT * from students;
SELECT * FROM student_address;
SELECT * FROM student_scorecard;
INSERT INTO student_scorecard VALUES(10019, 'one', 'IPM', 2, 8),
									(10019, 'one', 'SDP', 2, 8),
                                    (10019, 'one', 'AAI', 2, 8),
                                    (10019, 'one', 'CTCS', 1.3, 8),
                                    (10019, 'two', 'ITS', 3.5, 8),
                                    (10019, 'two', 'UI_UX', 1.7, 8);
-- -------------------------------------------------------------


SELECT s.last_name, s.first_name, sa.phone, sa.street, sa.pincode, sa.city, sa.country, ss.semester, ss.subject_name, ss.score,
ss.credits_earned FROM students s 
join student_address sa ON s.student_id = sa.student_id 
join student_scorecard ss on sa.student_id = ss.student_id
WHERE s.student_id = 10001;
















