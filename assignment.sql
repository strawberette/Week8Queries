
-- Exercises page 47
use master32;
SHOW tables;


SELECT * FROM master32.current_job_detail
WHERE job_title = "Tech Lead";

SELECT * FROM master32.employee_detail
WHERE LEft(Name, 1) = "S";

#second way:

SELECT * FROM master32.employee-employee_detail WHERE Name LIKE "S%"

SELECT * FROM master32.jobs_history 
WHERE job_title LIKE '%Developer%';

SELECT laptop_id FROM master32.laptop_detail
WHERE os = "Ubuntu"

SELECT * FROM master32.employee_detail WHERE Name LIKE "S%" OR Name LIKE "F%";


-- Exercises page 52

CREATE TABLE master32.great_names (
employee_id  INT PRIMARY KEY,
name VARCHAR (100)
);

INSERT into master32.great_names (employee_id, name) 
VALUES (1,"Noemi"), (2,"Emmanuele"), (3,"Federico"), (4,"Marta"),(5,"Adele");

DELETE FROM master32.great_names
WHERE employee_id = 5;

CREATE TABLE master32.great_names (
employee_id  INT PRIMARY KEY,
name VARCHAR (100),
great_name_ind VARCHAR (200)
);
INSERT into master32.great_names (employee_id, name, great_name_ind) 
VALUES (1, "Noemi","Y"), (2,"Emmanuele", "Y"), (3,"Federico", "Y"), (4,"Marta","Y"),(5,"Adele", "Y");

SELECT name, great_name_ind 
FROM master32.great_names 
WHERE employee_id = 5;
UPDATE master32.great_names 
SET great_name_ind = "N"
WHERE employee_id = 5;

-- Exercises page 77:

SELECT cjd.laptop_id
FROM current_job_detail  cjd
INNER JOIN `laptop_detail` ed
ON cjd.laptop_id = ed.laptop_id;


SELECT employee_detail.*, ld.os
FROM `laptop_detail` ld
INNER JOIN current_job_detail cjd
ON cjd.laptop_id = ld.laptop_id
INNER JOIN employee_detail
ON employee_detail.employee_id = cjd.`employee_id`
WHERE ld.os = "Mac";



SELECT  ed.Employee_ID, ed.Name, jh.job_title, cjd.job_title
FROM `jobs_history`jh
INNER JOIN current_job_detail cjd
ON jh.`employee_id` = cjd.`employee_id`
INNER JOIN employee_detail ed
ON ed.employee_id = cjd.`employee_id`
WHERE jh.job_title = "Apprentice Developer" ;


SELECT  ed.Employee_ID, ed.Name, jh.job_title, cjd.job_title
FROM `jobs_history`jh
INNER JOIN current_job_detail cjd
ON jh.`employee_id` = cjd.`employee_id`
INNER JOIN employee_detail ed
ON ed.employee_id = cjd.`employee_id`
WHERE jh.job_title NOT LIKE "%Developer%" && cjd.job_title LIKE "%Developer%";



SELECT  ed.Employee_ID, ed.Name, jh.job_title, cjd.job_title
FROM `jobs_history`jh
INNER JOIN current_job_detail cjd
ON jh.`employee_id` = cjd.`employee_id`
INNER JOIN employee_detail ed
ON ed.employee_id = cjd.`employee_id`
WHERE jh.job_title != cjd.job_title;

SELECT DISTINCT ed.Employee_ID, ed.Name
FROM `jobs_history`jh
INNER JOIN current_job_detail cjd
ON jh.`employee_id` = cjd.`employee_id`
INNER JOIN employee_detail ed
ON ed.employee_id = cjd.`employee_id`
WHERE jh.job_title != cjd.job_title;

-- Exercises page 91:
SELECT job_title, MAX(salary)
FROM current_job_detail
GROUP BY job_title;

SELECT ld.os, COUNT(*)
FROM `laptop_detail` ld
INNER JOIN current_job_detail cjd
ON cjd.laptop_id = ld.laptop_id
WHERE ld.os = "Mac"
GROUP BY ld.os;


SELECT  AVG(cjd.salary)
FROM  current_job_detail cjd 
INNER JOIN `jobs_history`jh
ON jh.`employee_id` = cjd.`employee_id`
WHERE jh.job_title = "Apprentice Developer" ;


SELECT ed.employee_ID, ed.Name, cjd.salary
FROM `employee_detail` ed
INNER JOIN current_job_detail cjd
ON ed.`employee_id` = cjd.`employee_id`
GROUP BY cjd.salary, ed.Name, ed.employee_ID
ORDER BY cjd.salary DESC
LIMIT 1

SELECT job_title, max(salary) 
FROM current_job_detail
GROUP BY job_title
