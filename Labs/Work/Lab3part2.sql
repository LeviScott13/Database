/*************************/
/*Name: Levi Sutton      */
/*Term: Spring 2019      */
/*Lab 3 Part 2		 */
/*************************/

/* List the name of all products for which an order was placed */ 

SELECT Pname
FROM products, orders
WHERE products.Pid = orders.Pid;

/* List the name of customersthat ordered product ‘p07 */ 

SELECT Cname 
FROM customers 
WHERE Cid IN (SELECT Cid FROM orders WHERE Pid = 'p07');


/* List name of agents that placed an order for customer c003 or customer c006 */ 

SELECT agents.Aname 
FROM agents, orders
WHERE orders.Cid = 'c003' OR 'c006';  


/*List name of customers that ordered product ‘p01’ through agent 'a01' */ 

SELECT customers.Cname 
FROM customers 
WHERE EXISTS (SELECT 1 FROM orders WHERE orders.Cid = customers.Cid and orders.Pid = 'p01' AND orders.Aid = 'a01');

/* List the name of each customer that placed an order, the pid of what they ordered.*/ 

SELECT Cname, Pid
FROM customers, orders
WHERE customers.Cname = Orders.Pid;

/* List the name of each customer that placed an order and the product name for each product they ordered */

SELECT Cname, Pname
FROM customers, orders, products
WHERE customers.Cid = Orders.Cid AND products.Pid = orders.Pid;

/* List the name of each customer and the total amount ordered by the customers and also list the
customers that did not place an order */

SELECT Cname, COUNT(customers) AS CustomerCount, SUM(dollars) AS OrderAmount
FROM customers, orders
GROUP BY customers.Cid;

/* List the name and the sum of dollars for each customer that ordered more than $1,000 */

SELECT Cname, SUM(dollars) AS OrderAmount
FROM customers, orders
WHERE customers.Cid = orders.Cid AND dollars > 1000
GROUP BY Cname;

/* List the agent name, product name and customer name for each product ordered */

SELECT Cname, Pname, Aname
FROM customers, orders, products, agents
WHERE customers.Cid = orders.Cid AND products.Pid = orders.Pid AND agents.Aid = orders.Aid;
 
What would be the result of the following SQL Statement:

SELECT * from CUSTOMERS, PRODUCTS

//This lists all of the data from the customers and products tables