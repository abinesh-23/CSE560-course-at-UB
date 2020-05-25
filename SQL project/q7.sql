with table1 as (select aa.emp_no as e1, dept_no, diff from (
select emp_no, datediff(to_date, from_date) as diff from titles where year(to_date) != 9999 and title = 'Manager') aa inner join dept_emp d on aa.emp_no = d.emp_no)

select e1 as emp_no, dept_name from (
select e1, asdfg.diff, dept_no from (
select  MIN(-1 * diff)*-1 as diff from table1
group by dept_no) asdfg inner join table1 vdf on vdf.diff = asdfg.diff
) ans inner join departments dd on ans.dept_no = dd.dept_no
order by e1

