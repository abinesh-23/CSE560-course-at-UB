with recursive anc (src,dst) as (  
select * from (select distinct d.src , c.dst from (select a.title src , b.title dst, a.emp_no from titles a 
inner join titles b on a.emp_no = b.emp_no
where  a.title != b.title and a.from_date < b.from_date) d, (select a.title src , b.title dst, a.emp_no from titles a 
inner join titles b on a.emp_no = b.emp_no
where  a.title != b.title and a.from_date < b.from_date) c where d.emp_no = c.emp_no and d.src != c.dst
order by src,dst) asdf 

union 

select p.src, a.dst from (select distinct d.src , c.dst from (select a.title src , b.title dst, a.emp_no from titles a 
inner join titles b on a.emp_no = b.emp_no
where  a.title != b.title and a.from_date < b.from_date) d, (select a.title src , b.title dst, a.emp_no from titles a 
inner join titles b on a.emp_no = b.emp_no
where  a.title != b.title and a.from_date < b.from_date) c where d.emp_no = c.emp_no and d.src != c.dst
order by src,dst) p, anc a where p.dst = a.src),

srctab as (select anc.src, dst from anc),

tottit as (select a.title src, b.title dst from (select title from (select title from titles) a group by title) a, (select title from (select title from titles) a group by title) b)

select s.src, s.dst from tottit s left join srctab d on s.src = d.src and s.dst = d.dst
where d.src is null and d.dst is null
order by s.src, s.dst


