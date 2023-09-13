create database demo 
use demo

create table employee(
	eid int,
	fname varchar(100),
	age int,
	salary int
)
create table emplog(
	id int identity (1,1),
	eid int,
	oldsalary int,
	newsalary int,
	changedate datetime
)
drop trigger salcheck
create trigger salcheck
on employee
after update
as
Begin
	insert into emplog(eid, oldsalary, newsalary, changedate)
	select d.eid,d.salary, i.salary, getdate() from inserted i, deleted d
End

delete employee
insert into employee values
(10,'Alpha',21,2345)

update employee
set salary = 3000
where eid = 1
drop table tempdata
select * from employee
select * from emplog

alter trigger salcheckinsert
on employee 
after insert
as
begin
	select * into tempdata from inserted
	select * into tempdata2 from deleted
	--select * into tempdata3 from updated
end

select * from tempdata
select * from tempdata2
select * from tempdata3
insert 
--create table a(
--	c1 int
--)

--create table b(
--	c2 int
--)

--insert into a values(1),(2),(3)
--insert into b values(4),(5),(6)

--select a.c1, b.c2, a.c1 * b.c2 from a,b
----select a.c1, b.c1 from a,b

--with cte1 as
--( select *, row_number() over() from a)
--cte 2 as
--( select *, row_number() over() from b)
--select cte1.c1, cte2.c2 from cte1, cte2

ALTER TABLE a
ADD slno int identity(1,1); 
select * from b

ALTER TABLE b
ADD slno int identity(1,1); 

select a.c1, b.c2, a.c1*b.c2 from a,b
where a.slno = b.slno


DDL trigger
drop table ddllog
create table ddllog(
	id int identity (1,1),
	eventdate datetime,
	eventtype varchar(100),
	objectname varchar(100),
	Sqltext nvarchar(max),
	sqlcomonly xml
)

alter trigger monitorDB
on database
for create_table,alter_table, drop_table
as	
	declare @event xml
	set @event = EVENTDATA()
	insert into ddllog(eventdate, eventtype, objectname, sqltext, sqlcomonly) 
	values (getdate(), @event.value('(/EVENT_INSTANCE/EventType)[1]','varchar(100)'), 
	@event.value('(/EVENT_INSTANCE/ObjectName)[1]','nvarchar(100)'),
	@event.value('(/EVENT_INSTANCE/TSQLCommand/CommandText)[1]','nvarchar(100)'),
	@event)


create table test11
( a int)

select * from ddllog

create table xmldata(
id int,
book xml
)
delete xmldata
insert into xmldata values
(1, 
'<check> 
	<title> dfds </title>
	<genre> dsfds </genre>
	<author> 
		<authorfname> jim </authorfname>
	</author>
	<author> 
		<authorfname> carry </authorfname>
	</author>
</check>')

select id, book.value('(check/author/authorfname)[1]','nvarchar(100)') from xmldata
select id, book.value('(check/author/authorfname)[2]','nvarchar(100)') from xmldata
select id, book.value('(title)[2]','nvarchar(100)') from xmldata



--*************************************

--create a dml trigger

create table t_trigger(
	eid int,
	ename varchar(30),
	sex varchar(1)
)
Go

create table dml_logs(
	logid int identity(1,1),
	empid int,
	operation varchar(50),
	updatedate datetime
)
create trigger trig on t_trigger
for insert, update, delete
as
insert into dml_logs
insert into t_trigger values
(1, 'James','M')

--create a ddl trigger
