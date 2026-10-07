CREATE DATABASE datacraftinglab_db;
USE datacraftinglab_db;
CREATE TABLE flourmills_sales(
    sales_id INT PRIMARY KEY,
    sale_date DATE NOT NULL,
    region VARCHAR(100) NOT NULL,
    state0 VARCHAR(100) NOT NULL,
    product_category VARCHAR(100) NOT NULL,
    product_name VARCHAR(150) NOT NULL,
    customer_type VARCHAR(100) NOT NULL,
    customer_id INT NOT NULL,
    quantity_sold INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    discount_rate INT NOT NULL,
    payment_method VARCHAR(150) NOT NULL,
    sales_rep VARCHAR(150) NOT NULL,
    warehouse VARCHAR(100) NOT NULL,
    delivery_status VARCHAR(100) NOT NULL,
    order_channel VARCHAR(100) NOT NULL,
    batch_number INT NOT NULL,
    production_date DATE NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
)