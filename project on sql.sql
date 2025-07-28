select * from books;

select count(genre) from books;
select * from customers;
select * from orders;

select genre,Title from books
where genre= 'Fiction'
;

select Title,Published_Year from books 
where Published_Year >1950
order by Published_Year  asc ;

select * from customers;
select * from customers
where Country = 'Canada';

select * from orders;
select * from orders
where Order_Date between '2023-11-01' and '2023-11-30';

select sum(Stock) as availability from books;

select * from books order by price desc limit 1 ;

select * from orders
where Quantity >1 order by Quantity ;

select * from orders 
where Total_Amount>20 order by Total_Amount ;

select distinct genre  from books;

select * from books order by Stock limit 1;

select sum(Total_Amount) from orders;

select distinct b.Genre,sum(o.Quantity) as totalsold
from Orders o 
join Books b on o.book_id= b.book_id
group by b.Genre;

select avg(price) as average_price  from books
where genre='Fantasy';

select o.customer_id,c.name, count(o.order_id) as order_count
from orders o
join customers c on o.customer_id = c.customer_id
group by o.customer_id , c.name
having count(Order_ID)>=2;

select* from orders;
select o.book_id,b.title, count(o.Order_ID) as cm
from orders o
join books b on  o.Book_ID=b.Book_ID
group by o.Book_id, b.title 
order by cm desc limit 1;

select * from books 
where genre = 'Fantasy'
order by price desc limit 3;

select b.author, sum(o.quantity) as total_sales 
from orders o
join books b on o.Book_ID= b.Book_ID
group by b.Author
order by total_sales ;

select * from customers;
select * from orders;

select distinct c.city,sum(o.total_amount) as spend 
from orders o
join customers c on o.Customer_ID= c.Customer_ID
where o.Total_Amount>30
group by c.city
;

select c.name,c.Customer_ID, sum(o.total_amount) as total 
from orders o 
join customers c on c.Customer_ID= o.customer_id
group by c.name, c.Customer_ID
order by total desc limit 1; 

select * from orders;
select * from books;

select b.book_id , b.title ,b.stock,
coalesce(sum(o.quantity),0) as order_quant,
 b.stock- coalesce(sum(o.quantity),0) as remain
from books b
left join orders o on b.Book_ID=o.Book_ID
group by b.Book_ID, b.title,b.stock;

