CREATE VIEW high_value_sales AS
SELECT c.customer_id,
       c.customer_name,
       o.total_sales
FROM customers c
INNER JOIN orders o ON o.customer_id = c.customer_id
WHERE total_sales > 2000;