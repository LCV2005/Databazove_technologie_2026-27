CREATE VIEW high_value_customers AS
SELECT c.customer_id, c.customer_name, o.sales
FROM customers c
INNER JOIN orders o ON o.customer_id = c.customer_id
WHERE o.sales > 2000;