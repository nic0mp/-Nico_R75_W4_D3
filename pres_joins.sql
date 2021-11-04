SELECT *
FROM order_;

select *
FROM customer;

--Inner Join
SELECT first_name, last_name, order_date, amount
FROM customer
INNER JOIN order_
ON customer.customer_id = order_.customer_id;

-- Left Join
SELECT first_name,last_name,order_date,amount
FROM customer
LEFT JOIN order_
ON customer.customer_id = order_.customer_id
WHERE order_date IS NOT NULL;

-- Right Join
SELECT first_name,last_name,order_date, amount
FROM customer
RIGHT JOIN order_
ON customer.customer_id = order_.customer_id;

--Full join
SELECT first_name,last_name,order_date,amount
FROM customer
FULL JOIN order_
ON customer.customer_id = order_.customer_id;