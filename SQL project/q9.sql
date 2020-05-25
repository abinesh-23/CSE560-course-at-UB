select e as emp_no, count(e) as cnt from (
select e, t.from_date, salary from (
select e, from_date from (select count(title), emp_no as e from titles
group by emp_no
having count(title) > 1) t1 inner join titles t2 on t1.e = t2.emp_no) t
left join
salaries s on s.from_date = t.from_date and (s.emp_no = t.e)
where salary is NULL) aa
group by e
