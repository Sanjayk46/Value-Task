-- create customer table
CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    address VARCHAR(255)
);
-- Create the products table
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    description VARCHAR(255)
);

-- Create the orders table
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);
-- Insert sample data into customers
INSERT INTO customers (name, email, address) VALUES
('sanjay', 'sanjay@example.com', 'chennai'),
('kumar', 'kumar@example.com', 'mumbai'),
('Deepika', 'deepika@example.com', 'kerala');

-- Insert sample data into products
INSERT INTO products (name, price, description) VALUES
('Pen', 20.00, 'pen is using for wiriting purpose'),
('Pencil', 35.00, 'extra mark for good hand wiriting'),
('Maker', 50.00,'Marker is good for styling'),
('Note', 50.00, 'Notes'),
('Scale', 50.00, 'scale price is very less');

INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(1, '2024-11-01 10:00:00', 55.00),
(2, '2024-11-20 15:30:00', 70.00),
(3, '2024-12-01 12:45:00', 150.00);

--queries
1.Retrieve all customers who have placed an order in the last 30 days.
SELECT DISTINCT c.name
FROM customers c
JOIN orders o ON c.id = o.customer_id
WHERE o.order_date >= NOW() - INTERVAL 30 DAY;

ans:
name
kumar
Deepika
2.Get the total amount of all orders placed by each customer.

SELECT c.name, SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.id = o.customer_id
GROUP BY c.id, c.name;
ans:
name	total_spent
sanjay	55.00
kumar	70.00
Deepika	150.00

3. Update the price of Product C to 45.00
UPDATE products
SET price = 45.00
WHERE name = 'Pen';

SELECT * FROM products

ans:
id	name	price	 description
1	Pen	    45.00	 pen is using for wiriting purpose
2	Pencil	35.00	 extra mark for good hand wiriting
3	Maker	  50.00	 Marker is good for styling
4	Note	  50.00	 Notes
5	Scale	  50.00	 scale price is very less

4.Add a new column discount to the products table.
  ALTER TABLE products
ADD COLUMN discount DECIMAL(10, 2) DEFAULT 0;

SELECT * FROM products
ans:
id	name	price	 description	                      discount
1	Pen	    20.00	 pen is using for wiriting purpose	0.00
2	Pencil	35.00	 extra mark for good hand wiriting	0.00
3	Maker	  50.00	 Marker is good for styling	        0.00
4	Note	  50.00	 Notes	                            0.00
5	Scale	  50.00	 scale price is very less	          0.00

5. Retrieve the top 3 products with the highest price
SELECT name, price
FROM products
ORDER BY price DESC
LIMIT 3;
ans:
name	price
Maker	50.00
Note	50.00
Scale	50.00

6. Get the names of customers who have ordered Product A.
SELECT DISTINCT c.name
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN products p ON p.name = 'Pencil';
ans:
name
sanjay
kumar
Deepika

7. Join the orders and customers tables to retrieve the customer's name and order date for each order.
SELECT c.name, o.order_date
FROM customers c
JOIN orders o ON c.id = o.customer_id;

ans:
name	   order_date
sanjay	 2024-11-01 10:00:00
kumar	   2024-11-20 15:30:00
Deepika	 2024-12-01 12:45:00

8.Retrieve the orders with a total amount greater than 150.00
  SELECT *
FROM orders
WHERE total_amount > 150.00;
  ans:

9.Normalize the database by creating a separate table for order items

  CREATE TABLE order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

10.Retrieve the average total of all orders.
  SELECT AVG(total_amount) AS average_order_total
FROM orders;
 ans: 
  average_order_total
  125.000000


