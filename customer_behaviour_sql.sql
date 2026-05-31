-- 1. Total customers by region.

SELECT region, COUNT(*) AS total_customer
FROM customers 
GROUP BY region
ORDER BY total_customer DESC;

-- 2. Gender wise total spending.

SELECT gender, SUM(purchase_amount) AS total_spending
FROM customers
GROUP BY gender
ORDER BY total_spending DESC;

-- 3. Most popular product category.

SELECT product_category, COUNT(*) AS total_purchased
FROM customers 
GROUP BY product_category
ORDER BY total_purchased DESC;

-- 4. Average satisfaction score by region.

SELECT region, AVG(satisfaction_score) AS avg_score
FROM customers 
GROUP BY region
ORDER BY avg_score DESC; 

-- 5. Promotion usage impact on purchase amount.

SELECT promotion_usage, SUM(purchase_amount) AS total_amount
FROM customers
GROUP BY promotion_usage
ORDER BY total_amount DESC;

-- 6. Average Purchase Amount by loyalty status.

SELECT loyalty_status, ROUND(AVG(purchase_amount),2) AS avg_amount
FROM customers
GROUP BY loyalty_status
ORDER BY avg_amount DESC;

-- 7. Purchase frequency distribution.

SELECT purchase_frequency, COUNT(*) AS total_customer
FROM customers
GROUP BY purchase_frequency
ORDER BY total_customer DESC;

-- 8. Education level vs average income.

SELECT education, ROUND(AVG(income),2) AS avg_income
FROM customers
GROUP BY education
ORDER BY avg_income DESC;

-- 9. Top 5 highest spending customers.

SELECT id, gender, region, purchase_amount AS total_spending
FROM customers
ORDER BY total_spending DESC
LIMIT 5;

-- 10. Rank customers within each loyalty group.

SELECT id, loyalty_status, purchase_amount,
RANK() OVER(PARTITION BY loyalty_status ORDER BY purchase_amount DESC) AS customer_rank
FROM customers;

-- 11. Highest spending product category in each region. 

SELECT region, product_category, SUM(purchase_amount) AS total_spending
FROM customers
GROUP BY region, product_category
ORDER BY total_spending DESC;