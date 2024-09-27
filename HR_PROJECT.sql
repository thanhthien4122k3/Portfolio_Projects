use national_score;

select * from hr;

alter table hr
change column ï»¿id emp_id varchar(20) null;

describe hr;

select birthdate from hr;

set sql_safe_updates = 0;

update hr
set birthdate = case
	when birthdate like '%/%' then date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
	when birthdate like '%-%' then date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
	else null 
end;

alter table hr
modify column birthdate DATE;

select birthdate from hr;

update hr
set hire_date = case
	when hire_date like '%/%' then date_format(STR_TO_DATE(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
	when hire_date like '%-%' then date_format(STR_TO_DATE(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
	else null 
end;

alter table hr 
modify column hire_date DATE;

select hire_date from hr;

UPDATE hr
SET termdate = CASE
    WHEN termdate IS NULL OR termdate = '' THEN '0000-00-00'
    ELSE DATE(STR_TO_DATE(termdate, '%Y-%m-%d %H:%i:%s UTC'))
END;

alter table hr 
modify column termdate DATE;

select  termdate from hr;

alter table hr add column age int;

update hr 
set age = timestampdiff(year, birthdate, CURDATE());

SELECT 
    MIN(age) AS youngest, MAX(age) AS oldest
FROM
    hr;

select count(*) from hr where age < 18;
