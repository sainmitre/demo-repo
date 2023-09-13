Create database test
CREATE TABLE emp
  (
      id INT primary key ,
      name VARCHAR(50) not null,
      gender VARCHAR(50),
      salary INT  check (salary>4000),
      department VARCHAR(50) 
   )
CREATE TABLE test2
  (
      id INT primary key ,
      name VARCHAR not null,
      gender VARCHAR,
      salary INT  check (salary>4000),
      department VARCHAR
   )
       INSERT INTO emp
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
  (15, 'Wayne', 'Male', 6800, 'Finance')
delete from emp
update emp
set name =REPLACE(name, 'I', 'J') 

update emp
set gender =NULL 
where id=1


select CONCAT(name, ' ', gender) from emp
select name+' '+ gender  from emp 

select CONCAT(gender, ' ', name) from emp
select gender+' '+ name from emp 
select STUFF('abcdefghij', 3, 0, '123456')
select STUFF('hello', 1, 0, '123456')
delete from emp
where id = 
order by id 
limit 1

select STUFF(emp.name, 1, 0, 'Big')
select STUFF(concat('Hello', ' '), LEN('hello')+1, 0,' world')

select CONCAT('hello', ' world')

select parsename('hello.world',1) work with . instead of ,

select stuff(Person.Person.FirstName + ' '+ Person.Person.LastName, CHARINDEX(' ',Person.Person.FirstName + ' '+ Person.Person.LastName)+1,0,'Jr ') from Person.Person
select STUFF(concat(Person.Person.FirstName,' ',Person.Person.LastName), CHARINDEX(' ',concat(Person.Person.FirstName, ' ', Person.Person.LastName))+1,0,'Jr ') from Person.Person

select CONCAT(12, 'ab')
select CONCAT(12, 'ab', NULL)
select CONCAT(NULL, 'ab')
select NULL + 'ab'

select getUTCdate()
select SYSDATETIME()
select GETDATE()
select DATEDIFF(Year, '16-02-1994','12-04-1996')
select DATEDIFF(Year, '1994-02-16','1996-04-12')

select ASCII('a')
select CAST('A' as int)
select CAST(313234 as varchar)