select e.emp_no, dept_name, d.from_date from employees e 
inner join dept_emp d on e.emp_no = d.emp_no 
inner join departments dd on d.dept_no = dd.dept_no
WHERE year(d.to_date) = 9999
order by e.emp_no


