1)
SELECT 
    o.order_id,
    c.customer_name,
    o.sales
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
WHERE o.sales > 500
ORDER BY o.sales DESC;

2)
SELECT 
    o.order_id,
    c.customer_name,
    p.category,
    o.sales
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN products p ON o.product_id = p.product_id;

3)
SELECT 
    c.region,
    SUM(o.sales) AS total_sales
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.region

4)
SELECT 
    p.product_name,
    SUM(o.sales) AS total_sales
FROM products p
INNER JOIN orders o ON p.product_id = o.product_id
GROUP BY p.product_name;

6)
SELECT 
c.customer_name,
o.order_id,
o.sales
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id;

7)
SELECT 
    c.region,
    SUM(o.sales) AS total_sales
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.region;

8)
SELECT 
    c.customer_name,
    COUNT(o.order_id) AS order_count
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

9)
SELECT 
    p.category,
    AVG(o.discount) AS avg_discount
FROM products p
INNER JOIN orders o ON p.product_id = o.product_id
GROUP BY p.category;

10)
SELECT 
    c.customer_name,
    SUM(o.sales) AS total_sales
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING SUM(o.sales) > 2000;

11)
SELECT 
    c.region,
    SUM(o.sales) AS total_sales,
    AVG(o.discount) AS avg_discount,
    COUNT(o.order_id) AS order_count
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.region;

12)
SELECT 
    c.region,
    COUNT(CASE WHEN o.sales > 1000 THEN 1 END) AS high_value_orders,
    COUNT(CASE WHEN o.sales <= 1000 THEN 1 END) AS low_value_orders
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.region;

13)
SELECT 
    c.customer_name,
    SUM(o.sales) AS total_sales,
    AVG(o.discount) AS avg_discount,
    COUNT(o.order_id) AS order_count,
    CASE 
        WHEN SUM(o.sales) > 2500 THEN 'VIP'
        ELSE 'REGULAR'
    END AS customer_type
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_sales DESC;