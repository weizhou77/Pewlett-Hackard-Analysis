-- Deliverable 1:

select * from titles;
select * from employees;

-- Retrieve the emp_no, first_name and last_name from employee table
--reyrieve title, from_date,to_date from title table
-- into retirement_titles table
--filter data with birth_date between 1952 and 1955
drop table retirement_titles;
select e.emp_no, e.first_name, e.last_name, t.title, t.from_date,t.to_date
into retirement_titles
from employees as e
inner join titles as t
on e.emp_no = t.emp_no
where (e.birth_date between '1952-01-01' and '1955-12-31')
order by emp_no;

select * from retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
-- retrieve the employee number, first and last name and title columns
-- use DISTINCT ON to retrieve the first occurence of the employee number for each set of rows 
-- into a new table
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no, rt.to_date DESC;

select * from unique_titles;

-- retrive the number of titles from the unique titles table
-- create retiring titles table 
-- group the table by title, then sort the count column in desc
select count(ut.title), ut.title
into retiring_titles
from unique_titles as ut
group by ut.title
order by count(ut.title) DESC;

select * from retiring_titles;

-- Deliverable 2:

-- retrieve emp_no, first and last name and birthdate from employees table
-- retrieve from_date and to_date from Department Employee table
-- retrieve title from titles table
-- distinct on first occurrence of the employee number
-- into mentorship_eligibility
-- join employees and department employee tables on the primary key
-- join employees and titles tables on primary key
-- filter to_date to all current employees
-- then filter birth_date between 01-01-1965 and 12-31-1965
-- order table by the employee number
drop table mentorship_eligibilty;
select * from employees;
select * from dept_emp;
select * from titles;
select distinct on (e.emp_no) 
	e.emp_no, e.first_name, e.last_name,e.birth_date,
	de.from_date, de.to_date,
	t.title
into mentorship_eligibilty
from employees as e
inner join dept_emp as de 
on e.emp_no = de.emp_no
inner join titles as t
on e.emp_no = t.emp_no
where (de.to_date = '9999-01-01') and (e.birth_date between '1965-01-01' and '1965-12-31')
order by e.emp_no;

select * from mentorship_eligibilty;
