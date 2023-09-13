begin transaction
	delete from employee with (rowlock) where eid=1

commit or rollback

select * from employee
sp_who2



create table lock(
	id int,
	ch varchar(10)
)

insert into lock values
(1,'a'),
(2,'b')

select * from lock
commit
begin transaction

update lock
set ch='1'
where id=1

update lock
set ch='1'
where id=2

rollback



select * from emp


select ename,

select e.ename as employee, m.ename as manager from emp e
Join emp m
on e.mgr = m.empno
order by e.empno

select * from emp
where sal < (select avg(sal) from emp)