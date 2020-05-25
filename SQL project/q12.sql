with avgsal as(
select avg(salary) as avg_sal, dept_no from salaries s inner join (
select emp_no, dept_no, to_date from dept_emp where year(to_date) = 9999 ) curemp
on s.emp_no = curemp.emp_no and (s.to_date = curemp.to_date)
group by dept_no),

avgincluded as(select emp_no, salary, avgsal.dept_no, avg_sal from(
select curemp.emp_no, salary, dept_no from salaries s inner join (
select emp_no, dept_no, to_date from dept_emp where year(to_date) = 9999 ) curemp
on s.emp_no = curemp.emp_no and (s.to_date = curemp.to_date) ) asd inner join avgsal on asd.dept_no = avgsal.dept_no
where salary > avg_sal),

countsdept as (select count(emp_no) as avgemp, dept_no from avgincluded
group by dept_no
),

countscur as (select count(emp_no) as curemp, dept_no from dept_emp where year(to_date) = 9999
GROUP BY dept_no),

avgdeptno as (select t1.dept_no, (t1.avgemp)/(t2.curemp)*100 as above_avg_pect from countsdept t1 inner join countscur t2 on t1.dept_no = t2.dept_no)

select dept_name, above_avg_pect from avgdeptno a inner join departments d on a.dept_no = d.dept_no
order by dept_name




