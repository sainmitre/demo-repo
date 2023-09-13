CREATE database CASESTUDY3
USE CASESTUDY3

SELECT TOP 3 * FROM Continent
SELECT TOP 3 * FROM Customers
SELECT Top 3 * FROM Transaction_table


--1. Display the count of customers in each region who have done the
--transaction in the year 2020.
	SELECT region_id,COUNT(customer_id) AS [Count]
	FROM Customers
	WHERE YEAR(start_date) = 2020
	GROUP BY region_id
	ORDER BY region_id
	
--2. Display the maximum and minimum transaction amount of each
--transaction type.
	SELECT txn_type, MAX(txn_amount) AS [max],MIN(txn_amount) AS [min]
	FROM Transaction_table
	GROUP BY txn_type
--3. Display the customer id, region name and transaction amount where transaction type is deposit and transaction amount > 2000.
	SELECT c.customer_id, con.region_name, t.customer_id
	FROM Customers c
	JOIN Transaction_table t ON c.customer_id = t.customer_id
	JOIN Continent con ON c.region_id = con.region_id
	WHERE t.txn_type = 'deposit' AND t.txn_amount > 2000

--4. Find duplicate records in the Customer table.
		SELECT customer_id, region_id, start_date, end_date ,COUNT(*) FROM Customers
		GROUP BY customer_id, region_id, start_date, end_date
		HAVING COUNT(*) > 1
--5. Display the customer id, region name, transaction type and transaction
--amount for the minimum transaction amount in deposit.
		SELECT *
		FROM Transaction_table
		WHERE txn_amount = (
			SELECT MIN(txn_amount) FROM Transaction_table WHERE txn_type = 'deposit'
		) 
		AND  txn_type = 'deposit'
--6. Create a stored procedure to display details of customers in the Transaction table where the transaction date is greater than Jun 2020.
 Go
 CREATE PROCEDURE getcustomer
 AS 
 SELECT * FROM Customers 
 WHERE customer_id = (SELECT customer_id FROM Transaction_table WHERE txn_date > '2020-06-30')

 EXEC getcustomer
 
--7. Create a stored procedure to insert a record in the Continent table.
	Go
	CREATE PROCEDURE insertrecord @region_id int, @region_name varchar(30)
	AS
	INSERT INTO Continent VALUES(@region_id, @region_name)

	EXEC insertrecord 5, 'Europe'

--8. Create a stored procedure to display the details of transactions that
--happened on a specific day.
Go
    CREATE PROCEDURE displaydetails @date date
	AS
	SELECT * FROM Transaction_table
	WHERE txn_date = @date
	ORDER BY customer_id

	EXEC displaydetails '2020-03-20'
--9. Create a user defined function to add 10% of the transaction amount in a table
	Go
	CREATE FUNCTION add10()
	returns int
	as
	begin
		update Transaction_table set txn_amount = txn_amount*1.1
		return 1
	end
	Go

	CREATE FUNCTION add10()
	returns table
	as	
		update Transaction_table 
		set txn_amount = txn_amount*1.1
		return( select * from Transaction_table)
	Go
	select * from Transaction_table
	select dbo.add10
--10. Create a user defined function to find the total transaction amount for a
--given transaction type.
Go
	create function findamount (@type varchar(50))
	returns int
	as
	begin
		return (select SUM(txn_amount)  from Transaction_table where txn_type = @type)
	end
Go
	select dbo.findamount('deposit') as Total
	
--11. Create a table value function which comprises the columns customer_id, region_id ,txn_date , txn_type , txn_amount which will retrieve data 
--from the above table.
	create function getdata()
	returns table
	as
	return(
		select 
		from Customers c
		join location l
		join Transaction_table

--12. Create a TRY...CATCH block to print a region id and region name in a
--single column.
begin try
end try

begin catch
end catch
--13. Create a TRY...CATCH block to insert a value in the Continent table.
begin try
end try

begin catch
end catch
--14. Create a trigger to prevent deleting a table in a database.
create trigger pdel
on database
for Create_Table , alter_Table, drop_Table
as
	print('Deleting a table is not allowed!')
	rollback
go
disable trigger 
drop table Customers

--15. Create a trigger to audit the data in a table.
create trigger adata
--16. Create a trigger to prevent login of the same user id in multiple pages.
create trigger plogin
--17. Display top n customers on the basis of transaction type.
select top
--18. Create a pivot table to display the total purchase, withdrawal and
--deposit for all the customers.
	SELECT customer_id, purchase , deposit, withdrawal FROM (SELECT * FROM Transaction_table) AS T1
	PIVOT
	(SUM(Txn_amount) FOR txn_type IN (purchase, deposit, withdrawal)) as T2


