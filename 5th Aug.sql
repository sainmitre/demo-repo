create database FORMONEY
use FORMONEY

create table monies(
	id int identity(1,1),
	sal money
)

insert into monies values(20000.32)
insert into monies values(10000.32)
insert into monies values(30000.32)
insert into monies values(40000.32)
select SUM(sal) as TOTAL_SALARY from monies 

select @@VERSION