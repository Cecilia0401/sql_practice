CREATE TABLE customers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);
CREATE TABLE orders(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(id)
);

INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);
	   
	   

select first_name, last_name, order_date, amount from customers, orders where customers.id = orders.customer_id;

-- Explicit inner join
select first_name, last_name, order_date, amount from customers
join orders
	on customers.id = orders.customer_id;
	

select first_name, last_name, order_date, amount from customers
join orders
	on customers.id = orders.customer_id
order by order_date;

select first_name, last_name,sum(amount) as total_spent from customers
join orders
	on customers.id = orders.customer_id
group by orders.customer_id
order by total_spent desc;


-- Left Join - it will include all the info on the left table even it doesn't have any info on the right table
select * from customers
left join orders
 	on customers.id = orders.customer_id;


select first_name, last_name,  sum(amount) from customers
left join orders
 	on customers.id = orders.customer_id
group by customers.id;

select first_name, last_name,  ifnull(sum(amount),0) as total_spent from customers
left join orders
 	on customers.id = orders.customer_id
group by customers.id
order by total_spent;

-- Right Join 

select * from customers
right join orders 
	on customers.id = orders.customer_id;
	
-- On Delete CASCADE
REATE TABLE customers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);
 
CREATE TABLE orders(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY(customer_id) 
        REFERENCES customers(id)
        ON DELETE CASCADE
);
 
 
INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);