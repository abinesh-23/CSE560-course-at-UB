select d.dept_name, count(d.dept_name) as noe from dept_emp dd inner join departments d on dd.dept_no = d.dept_no
group by d.dept_name
order by d.dept_name