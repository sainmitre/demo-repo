-- 30th  July 2023 Data types

-- int
Declare @s varchar(10)
set @s = ''
Select @s , len(@s) as lengths, DATALENGTH(@s) as Bytes


Declare @num int
set @num =12345
Select @num , len(@num) as lengths, DATALENGTH(@num) as Bytes


Declare @num float
set @num =12.123
print @num
Select @num , len(@num) as lengths, DATALENGTH(@num) as Bytes


Declare @num decimal(8,3)
set @num =12345.12345
Select @num , len(@num) as lengths, 

help datalength

SELECT DATALENGTH('W3Schools.com'); 

Declare @a float(24)
set @a =12.1234567
SELECT @a, DATALENGTH(@a) as Bytes, len(@a) as lengths

Declare @a float(24)
set @a =1.123456789012345
SELECT @a, DATALENGTH(@a) as Bytes, len(@a) as lengths

Create database sqldemo
create database batch
create database test