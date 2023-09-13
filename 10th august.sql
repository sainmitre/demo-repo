create table department(
	id int,
	salary money,
	department_name varchar(50)
)

insert into department values(1, 10000,'science')

insert into department values(2, 20000,'art')

insert into department values(3, 15000,'science')
insert into department values(4, 31000,'science')
insert into department values(5, 10000,'art')

select department_name,sex, COUNT(salary) from department
Group by department_name, sex
alter table department
add sex varchar(1)

create table popular(id int)
insert into popular values(2)
insert into popular values(3)
insert into popular values(4)

select * from department
left join popular
On department.id = popular.id
where popular.id is NULL
update department
set sex = 'F'
where id = 3

select * from department
where salary = max

SELECT id, Salary FROM department
WHERE Salary = (SELECT Max(Salary) FROM department)

--Between filter
like  % _
select * from department
where department_name like 'Sc%'

select COUNT(firstname), FirstName from Person.Person
where FirstName like '%eth'
Group by firstname