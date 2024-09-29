/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
select P.Name as ProductName, C.Name as CategoryName
from Products as P
inner join Categories as C
on C.Categoryid = P.Categoryid
where C.Name = 'Computers';

 /* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 select products.name, products.price, reviews.rating
 from products 
 inner join reviews on reviews.ProductID = products.Productid
 where reviews.rating = 5;
 
 /* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
select e.firstname, e.lastname, sum(s.quantity) as total
from sales as s
inner join employees as e on e.employeeid = s.employeeid
group by e.employeeid
order by total desc;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
select d.name as 'department name', c.name as 'category name' from departments as d
inner join categories as c on c.departmentid = d.departmentid
where c.name = 'appliances' or c.name = 'games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 select p.name, sum(s.quantity) as 'total sold', sum(s.quantity * s.priceperunit) as 'total price'
 from products as p
 inner join sales as s on s.ProductID = p.ProductID
 where p.productid = 97;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. 
/* (only return for the lowest rating!) */
select p.name, r.reviewer, r.rating, r.comment from products as p
inner join reviews as r on r.ProductID = p.ProductID
where p.ProductID = 857 and r.rating = 1;


-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */

select e.employeeid, e.firstname, e.lastname, p.name, sum(s.quantity) as totalsold
from sales as s 
inner join employees as e on e.employeeid = s.employeeid
inner join products as p on p.ProductID = s.ProductID
group by e.EmployeeID, p.ProductID
order by totalsold desc;

