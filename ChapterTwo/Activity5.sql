use mdc_ch02;

-- A. Show all data in each of the tables.
select *
from CUSTOMER;
select *
from INVOICE;
select *
from INVOICE_ITEM;

-- B. List the LastName, FirstName, and Phone of all customers.
select LastName, FirstName, Phone
from CUSTOMER;

-- C. List the LastName, FirstName, and Phone for all customers with a FirstName of ‘Nikki’.
select LastName, FirstName, Phone
from CUSTOMER
where FirstName = "Nikki";

-- D. List the LastName, FirstName, Phone, DateIn, and DateOut of all orders in excess of $100.00.
select c.LastName, c.FirstName, c.Phone, i.DateIn, i.DateOut
from CUSTOMER c join INVOICE i
on c.CustomerID = i.CustomerID
where i.TotalAmount > "$100.00";

-- E. List the LastName, FirstName, and Phone of all customers whose first name starts with ‘B’.
select LastName, FirstName, phone
from CUSTOMER
where FirstName like 'b%';

-- F. List the LastName, FirstName, and Phone of all customers whose last name includes the characters ‘cat’.
select LastName, FirstName, phone
from CUSTOMER
where LastName like '%cat%';

-- G. List the LastName, FirstName, and Phone for all customers whose second and third
	-- digits (from the left) of their phone number are 23. For example, any phone number
	-- with an area code of “723” would meet the criteria.
select LastName, FirstName, phone
from CUSTOMER
where phone like "_23%";

-- H. Determine the maximum and minimum TotalAmount.
select max(TotalAmount), min(TotalAmount)
from INVOICE;

-- I. Determine the average TotalAmount.
select avg(TotalAmount)
from INVOICE;

-- J. Count the number of customers.
select count(CustomerID)
from CUSTOMER;

-- K. Group customers by LastName and then by FirstName.
select LastName, FirstName
from CUSTOMER
group by LastName, FirstName;

-- L. Count the number of customers having each combination of LastName and FirstName.
select LastName, FirstName,COUNT(*) AS CustomerCount
from CUSTOMER
group by LastName, FirstName;

-- M. Show the LastName, FirstName, and Phone of all customers who have had an order
	-- with TotalAmount greater than $100.00. Use a subquery. Present the results sorted by
	-- LastName in ascending order and then FirstName in descending order.
select LastName, FirstName, Phone
from CUSTOMER
where CustomerID in (
        select CustomerID
        from INVOICE
        where TotalAmount > 100.00
    )
order by LastName asc, FirstName desc;

-- N. Show the LastName, FirstName, and Phone of all customers who have had an order
	-- with TotalAmount greater than $100.00. Use a join, but do not use JOIN ON syntax.
	-- Present results sorted by LastName in ascending order and then FirstName in descend-
	-- ing order.
select c.LastName, c.FirstName, c.Phone
from CUSTOMER c, INVOICE i
where c.CustomerID = i.CustomerID and i.Totalamount > 100.00
order by c.LastName asc, c.FirstName desc;


