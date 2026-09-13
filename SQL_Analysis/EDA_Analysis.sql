SELECT COUNT(*)
FROM retail_inventory;

SELECT *
FROM retail_inventory
LIMIT 10;

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'retail_inventory';

-- Buisness perspective analysis
-- 1. Total revenue of inventory

SELECT SUM(revenue) AS total_revenue
FROM retail_inventory;

-- 2. Regions generating highest revenue
SELECT region, SUM(revenue) AS total_revenue
FROM retail_inventory
GROUP BY region
ORDER BY total_revenue DESC;

-- 3. stores generating highest revenue

SELECT store_id, SUM(revenue) AS total_revenue
FROM retail_inventory
GROUP BY store_id
ORDER BY total_revenue DESC;

--4. regions with highest stockouts
SELECT region, COUNT(*) AS stockout_count
FROM retail_inventory
WHERE stockout = 'Yes'
GROUP BY region
ORDER BY stockout_count DESC;

-- 5.stores having highest stockouts
SELECT store_id, COUNT(*) AS stockout_count
FROM retail_inventory
WHERE stockout = 'Yes'
GROUP BY store_id
ORDER BY stockout_count DESC;

-- 6.product categories mostly affected by stockouts
SELECT category, COUNT(*) AS stockout_count
FROM retail_inventory
WHERE stockout = 'Yes'
GROUP BY category
ORDER BY stockout_count DESC;

-- 7.regions which do not fulfill customer demand
SELECT region, SUM(demand_gap) AS total_demand_gap
FROM retail_inventory
GROUP BY region
ORDER BY total_demand_gap DESC;

-- 8.stores which do not fulfill  customer demand
SELECT store_id, SUM(demand_gap) AS total_demand_gap
FROM retail_inventory
GROUP BY store_id
ORDER BY total_demand_gap DESC;

-- 9.product categories have the highest unmet demand
SELECT category, SUM(demand_gap) AS total_demand_gap
FROM retail_inventory
GROUP BY category
ORDER BY total_demand_gap DESC;

-- Inventory performance based on its utilization

-- # Which regions have the highest average inventory utilization?
SELECT region, ROUND(AVG(inventory_utilization),2) AS avg_inventory_utilization
FROM retail_inventory
GROUP BY region
ORDER BY avg_inventory_utilization DESC;

-- #Which stores have the lowest inventory utilization?
SELECT store_id,ROUND(AVG(inventory_utilization),2) AS avg_inventory_utilization
FROM retail_inventory
GROUP BY store_id
ORDER BY avg_inventory_utilization ASC;

-- # Which categories are most overstocked?
SELECT category, COUNT(*) AS overstock_count
FROM retail_inventory
WHERE overstock = 'Yes'
GROUP BY category
ORDER BY overstock_count DESC;

-- # Which stores generate above-average revenue?
WITH store_revenue AS (
    SELECT store_id, SUM(revenue) AS total_revenue
    FROM retail_inventory
    GROUP BY store_id
)
SELECT store_id, total_revenue
FROM store_revenue
WHERE total_revenue >(
    SELECT AVG(total_revenue)
    FROM store_revenue
)
ORDER BY total_revenue DESC;

-- # Which products have below-average inventory utilization?
WITH product_utilization AS (
    SELECT product_id, AVG(inventory_utilization) AS avg_utilization
    FROM retail_inventory
    GROUP BY product_id
)
SELECT product_id, ROUND(avg_utilization, 2) AS avg_inventory_utilization
FROM product_utilization
WHERE avg_utilization < (
    SELECT AVG(avg_utilization)
    FROM product_utilization
)
ORDER BY avg_utilization ASC;

-- # Which products have above-average demand gaps?
WITH product_demand_gap AS (
    SELECT product_id, SUM(demand_gap) AS total_demand_gap
    FROM retail_inventory
    GROUP BY product_id
)
SELECT product_id, total_demand_gap
FROM product_demand_gap
WHERE total_demand_gap > (
    SELECT AVG(total_demand_gap)
    FROM product_demand_gap
)
ORDER BY total_demand_gap DESC;

-- Ranking Top & Bottom Business Performers

-- # Which are the Top 10 revenue-generating stores?
SELECT store_id, SUM(revenue) AS total_revenue,
    RANK() OVER (ORDER BY SUM(revenue) DESC) AS revenue_rank
FROM retail_inventory
GROUP BY store_id
ORDER BY revenue_rank
LIMIT 10;

-- Which are the Top 10 products with the highest demand gap?
SELECT product_id, SUM(demand_gap) AS total_demand_gap,
    RANK() OVER (ORDER BY SUM(demand_gap) DESC) AS demand_gap_rank
FROM retail_inventory
GROUP BY product_id
ORDER BY demand_gap_rank
LIMIT 10;

-- Which stores have the highest number of stockouts?
SELECT store_id, COUNT(*) AS stockout_count,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS stockout_rank
FROM retail_inventory
WHERE stockout = 'Yes'
GROUP BY store_id
ORDER BY stockout_rank
LIMIT 10;

-- Which stores had stockouts, and how much revenue did they make during that time?
SELECT store_id, SUM(revenue) AS total_revenue,
    COUNT(*) AS stockout_count
FROM retail_inventory
WHERE stockout = 'Yes'
GROUP BY store_id
ORDER BY total_revenue DESC;

-- # Which stores have fulfillment rates below the company average?
SELECT store_id, ROUND(AVG(fulfillment_rate),2) AS avg_fulfillment_rate
FROM retail_inventory
GROUP BY store_id
HAVING AVG(fulfillment_rate) <(
    SELECT AVG(fulfillment_rate)
    FROM retail_inventory
)
ORDER BY avg_fulfillment_rate;

--# Which product categories generate the most revenue during stockout records?
SELECT category, SUM(revenue) AS total_revenue,
    COUNT(*) AS stockout_count
FROM retail_inventory
WHERE stockout = 'Yes'
GROUP BY category
ORDER BY total_revenue DESC;

--# Do stores with more stockouts also have bigger gaps in demand during those stockouts?
SELECT store_id,  COUNT(*) AS stockout_count,
    SUM(demand_gap) AS total_demand_gap
FROM retail_inventory
WHERE stockout = 'Yes'
GROUP BY store_id
ORDER BY total_demand_gap DESC;

