1)
SELECT product_name, total_amount  
FROM flourmills_sales 
WHERE total_amount > (SELECT AVG(total_amount) FROM flourmills_sales);

2)
SELECT * FROM flourmills_sales
WHERE product_category = (SELECT product_category FROM flourmills_sales
GROUP BY product_category 
ORDER BY SUM(total_amount) DESC LIMIT 1) 
ORDER BY sales_id ASC;

3)
SELECT
product_name,total_amount,
(SELECT AVG(total_amount) FROM flourmills_sales) as avg_amount
FROM flourmills_sales

4)
SELECT 
product_name, total_amount, total_amount / (SELECT SUM(total_amount) FROM flourmills_sales) as amount_share
FROM flourmills_sales

5)
SELECT *
FROM (
    SELECT 
    EXTRACT(MONTH FROM sale_date) as month,
    SUM(total_amount) AS monthly_sales
    FROM flourmills_sales
    GROUP BY month
) AS t
ORDER BY monthly_sales DESC; 
6)
SELECT *
FROM (
    SELECT product_category,SUM(total_amount) as total_sales
    FROM flourmills_sales
    GROUP BY product_category
) as t
WHERE total_sales > 50000000
ORDER BY total_sales DESC;

7)
SELECT 
product_name,
product_category,
total_amount
FROM flourmills_sales t1
WHERE total_amount > (
    SELECT AVG(total_amount)
    FROM flourmills_sales t2
    WHERE t2.product_category = t1.product_category
);

8)
SELECT
product_name,
region,
total_amount,
(
    SELECT MIN(t2.total_amount)
    FROM flourmills_sales t2
    WHERE t2.region = t1.region
) AS region_min_amount
FROM flourmills_sales t1;

9)SELECT *
FROM flourmills_sales t1
WHERE EXISTS (
    SELECT 1
    FROM flourmills_sales t2
    WHERE t2.product_name = t1.product_name
    HAVING COUNT(DISTINCT EXTRACT(MONTH FROM t2.sale_date)) > 1
);

10)SELECT
product_category,
product_name,
total_amount
FROM flourmills_sales t1
WHERE EXISTS (
    SELECT 1
    FROM flourmills_sales t2
    WHERE t2.product_category = t1.product_category
    AND t2.total_amount > 200000
);

11)
SELECT DISTINCT
product_category
FROM flourmills_sales t1
WHERE EXISTS (
    SELECT 1
    FROM flourmills_sales t2
    WHERE t2.product_category = t1.product_category
    HAVING COUNT(DISTINCT t2.region) > 3
);

12)
SELECT *
FROM flourmills_sales t1
WHERE EXISTS (
    SELECT 1
    FROM flourmills_sales t2
    WHERE t2.region = t1.region
    AND EXTRACT(YEAR FROM t2.sale_date) = 2024
);

13)
SELECT DISTINCT
product_category
FROM flourmills_sales t1
WHERE NOT EXISTS (
    SELECT 1
    FROM flourmills_sales t2
    WHERE t2.product_category = t1.product_category
    AND t2.total_amount >  500000
);

14)
SELECT DISTINCT
region
FROM flourmills_sales t1
WHERE NOT EXISTS (
    SELECT 1
    FROM flourmills_sales t2
    WHERE t2.region = t1.region
    AND t2.product_category = 'Flour'
);
