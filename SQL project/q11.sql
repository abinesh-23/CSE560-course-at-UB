select dept_name, emp_no, salary from (
select emp as emp_no, saly as salary, dept from
(select d.emp_no as emp, d.dept_no as dept, salary as saly from dept_emp d 
inner join salaries s on d.emp_no = s.emp_no ) dd 
inner join
(select MIN(-1 * salary)*-1 sal , d.dept_no from (select salary, emp_no from salaries where year(to_date) = 9999) s
inner join dept_emp d on s.emp_no = d.emp_no
group by dept_no) a on dd.dept = a.dept_no and (dd.saly = a.sal)) ab
inner join departments ddd on ab.dept = ddd.dept_no
order by dept_name
