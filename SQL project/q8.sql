select dd.dept_name, cntt-1 as cnt from (
select count(d.dept_no) as cntt, dept_no from dept_emp d inner join (
select emp_no from titles where title = 'Manager'
) aa
on d.emp_no = aa.emp_no
group by d.dept_no) dept inner join departments dd on dept.dept_no = dd.dept_no
where cntt > 2
order by dept_name
