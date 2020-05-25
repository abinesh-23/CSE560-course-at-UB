select e1 as h_empno, s1 as h_salary, h1 as h_date, e2 as l_empno, s2 as l_salary, h2 as l_date from 
(select e1, h1, s1 from (select emp_no e1, hire_date h1 from employees where year(birth_date) = 1965) t1
inner join (select emp_no, salary as s1 from salaries where year(salaries.to_date) = 9999) t2
on t1.e1 = t2.emp_no) tab 
join
(select e1 as e2, h1 as h2, s1 as s2 from (select emp_no e1, hire_date h1 from employees where year(birth_date) = 1965) t1
inner join (select emp_no, salary as s1 from salaries where year(salaries.to_date) = 9999) t2
on t1.e1 = t2.emp_no) tab1

where h1 > h2 and s1 > s2
order by e1,e2






