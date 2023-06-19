Create Database project;

USE project;

SELECT* From hr;


ALTER TABLE hr
CHANGE COLUMN ï»؟id emp_id VARCHAR(20)  null; /*change name*/

DESCRIBE hr;

SELECT birthdate From hr;

UPDATE hr
SET birthdate=CASE
	WHEN birthdate like '%/%' THEN date_format(str_to_date(birthdate,'%m/%d/%Y'),'%Y-%m-%d')
    WHEN birthdate like '%-%' THEN date_format(str_to_date(birthdate,'%m-%d-%Y'),'%Y-%m-%d')
    ELSE NULL
END; /*change format*/

ALTER TABLE hr
MODIFY COLUMN birthdate DATE; /*change type*/

UPDATE hr
SET hire_date =CASE
	WHEN hire_date like '%/%' THEN date_format(str_to_date(hire_date,'%m/%d/%Y'),'%Y-%m-%d')
    WHEN hire_date like '%-%' THEN date_format(str_to_date(hire_date,'%m-%d-%Y'),'%Y-%m-%d')
    ELSE NULL
END; /*change format*/

ALTER TABLE hr
MODIFY COLUMN hire_date DATE;

UPDATE hr
SET termdate = date(str_to_date(termdate,'%Y-%m-%d%H:%i:%s UTC'))
WHERE termdate IS NOT null AND termdate !='';

SELECT termdate From hr;

ALTER TABLE hr ADD COLUMN age INT;

SELECT* From hr;

UPDATE hr
SET age = timestampdiff(YEAR, birthdate, CURDATE());  #accepts two datetime or date expressions as parameters, calculates the difference between them

SELECT min(age) AS youngest, max(age) AS oldest FROM hr;

SELECT count(*) FROM hr WHERE age < 18; #returns the number of rows in a specified table

SELECT COUNT(*) FROM hr WHERE termdate > CURDATE(); #CURDATE(returns the current date)

SELECT COUNT(*) FROM hr
WHERE termdate = '0000-00-00';

SELECT location FROM hr;