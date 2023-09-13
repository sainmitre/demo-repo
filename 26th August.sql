drop table employee
CREATE TABLE employee
  (
      eid INT  ,
      ename VARCHAR(50)  ,
      gender VARCHAR(50) ,
      salary INT  ,
      department VARCHAR(50)  
   )
Go

    INSERT INTO employee
  VALUES
  (1, 'David', 'Male', 5000, 'Sales'),
  (2, 'Jim', 'Female', 6000, 'HR'),
  (3, 'Kate', 'Female', 7500, 'IT'),
  (4, 'Will', 'Male', 6500, 'Marketing'),
  (5, 'Shane', 'Female', 5500, 'Finance'),
  (6, 'Shed', 'Male', 8000, 'Sales'),
  (7, 'Vik', 'Male', 7200, 'HR'),
  (8, 'Vince', 'Female', 6600, 'IT'),
  (9, 'Jane', 'Female', 5400, 'Marketing'),
  (10, 'Laura', 'Female', 6300, 'Finance'),
  (11, 'Mac', 'Male', 5700, 'Sales'),
  (12, 'Pat', 'Male', 7000, 'HR'),
  (13, 'Julie', 'Female', 7100, 'IT'),
  (14, 'Elice', 'Female', 6800,'Marketing'),
  (15, 'Wayne', 'Male', 6800, 'Finance')

Go

create function subtract()
returns int
as 
begin
	declare @n1 int, @n2 int, @n3 int
	set @n1 = 10
	set @n2 = 5
	set @n3 = @n1- @n2
	return @n3
end
Go


select dbo.subtract()

Go


create function totalsal( @dept varchar(20))
returns int
as
begin 
	declare @totalsal int
	select @totalsal= Sum(salary) from employee 
	where department = @dept
	return @totalsal 
end
Go


select dbo.totalsal('IT') AS TOTALSALRY 


Go



create view viewdata
as
select eid, ename from employee
Go;
--DROP FUNCTION DBO.TOTALSAL


CREATE PROCEDURE getdept  @dept varchar(10)
as
select * from employee
where department =@dept


exec getdept 'IT'
exec getdept IT
exec getdept @dept = 'IT'
Go


create trigger monitor 
on Employee
for insert, update, delete
as
begin
	print 'Actions are monitor'
end
Go

update employee
set salary =0

delete from employee


select getdate() from inserted

create trigger deletemonitor
on employee

select avg(salary) as avg_sal into avg_sal from employee

select * from avg_sal
insert into avg_sal values(23)


 select e.*, avg_sal, e.salary-avg_sal sal_diff_with_avg, cast((100*(e.salary-avg_sal)/avg_sal) as float) sal_diff_with_per 
  from employee e, avg_sal

  Go
  -- stored procedure
  create procedure returntoprow
  as
  select top 1 * from employee

  exec returntoprow
  Go
  -- create trigger

  create trigger monitor 
  on employee
  for insert, update, delete
  as
  begin
	Print'Actions are monitored'
  end
  select * from employee
  insert into employee(ename) values('Check')

  drop table dmllogs
 create Table DMLLOGS 
(
	Logid int identity(1,1)  not null,
	empid varchar(100) not null,
	Operation varchar(100) not null,
	Updatedate datetime not null,
	checkdate datetime not null
)
drop trigger monitor
drop trigger insertmonitor

Create trigger INsertmonitor
 on employee
 For insert 
 as 
 insert into dbo.DMLLOGS (empid,operation,updatedate, checkdate)
 select SUSER_SNAME(),'Insert', getdate() from inserted, getdate()

     INSERT INTO employee
  VALUES
  (1, 'David', 'Male', 5000, 'Sales'),
  (2, 'Jim', 'Female', 6000, 'HR')

  select * from dmllogs


  Create trigger INsertmonitor
 on employee
 For insert 
 as 
 insert into dbo.DMLLOGS (empid,operation,updatedate)
 select SUSER_SNAME(),'INsert', getdate() from inserted
 
 Create trigger INsertmonitor
 on employee
 For insert 
 as 
 select * insert into checkdate from inserted 