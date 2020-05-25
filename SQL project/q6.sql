select t1.e1, t2.e2 from (select e.emp_no as e1 from employees e inner join dept_emp d on e.emp_no = d.emp_no
where dept_no = 'd001' and year(birth_date) = 1955 and  year(to_date) = 9999) t1 join (select e.emp_no as e2 from employees e inner join dept_emp d on e.emp_no = d.emp_no
where dept_no = 'd001' and year(birth_date) = 1955 and  year(to_date) = 9999) t2
where e1 < e2
order by e1,e2
