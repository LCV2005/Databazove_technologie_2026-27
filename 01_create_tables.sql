SELECT 
    o.order_id,
    c.customer_name,
    o.sales
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
WHERE o.sales > 500
ORDER BY o.sales DESC;

SELECT 
    o.order_id,
    c.customer_name,
    p.category,
    o.sales
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN products p ON o.product_id = p.product_id;

SELECT 
    c.region,
    SUM(o.sales) AS total_sales
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.region

SELECT 
    p.product_name,
    SUM(o.sales) AS total_sales
FROM products p
INNER JOIN orders o ON p.product_id = o.product_id
GROUP BY p.product_name;

