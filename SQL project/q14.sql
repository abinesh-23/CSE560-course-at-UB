with recursive multiprom as (
select * from titles where emp_no in (select emp_no from titles group by emp_no having count(*) >= 1)),

multiprom_dates as (select a.emp_no, a.title src,b.title dst, a.from_date, a.to_date from
multiprom a, multiprom b where a.emp_no = b.emp_no  and a.to_date = b.from_date ),

rawdataroles as
(select emp_no, src, dst, (year(to_date)-year(from_date)+1) yrs from multiprom_dates where src!=dst),

rawdataavg as (select src, dst, avg(yrs) yrs from rawdataroles group by src,dst),
#select * from rawdataavg
finans (src,dst,yrs,levels) as (
select src, dst, yrs, 0 from rawdataavg
union all
select p.src, a.dst, p.yrs + a.yrs, a.levels+1
from rawdataavg p, finans a
where p.dst = a.src and levels < 3)



select src, dst, min(yrs) years from finans
where src != dst
group by src,dst
order by src,dst





