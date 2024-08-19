-- Objective 2: Explore the orders table

  -- 1. View of the order_details table
SELECT *
FROM restaurant_db.dbo.order_details

-- 2. What is the data range of the table?
SELECT MIN(order_date),MAX(order_date)
FROM order_details;

-- 3. How many orders were made within this data range?
SELECT COUNT(DISTINCT order_id)
FROM order_details

-- 4. How many items were ordered within this date range?
SELECT COUNT(*)
FROM order_details

-- 5. Which orders had the most number of items?
SELECT order_id,COUNT(item_id) as Num_items
FROM order_details
GROUP BY order_id
ORDER BY Num_items DESC;

-- 6. How many orders had more than 12 items?
SELECT COUNT(*) FROM
(SELECT COUNT(item_id) AS Num_items
FROM order_details
GROUP BY order_id
HAVING Num_items > 12)As Num_orders;

-- Query to count the number of orders with more than 12 items
SELECT COUNT(*)
FROM (
    SELECT COUNT(item_id) AS Num_items
    FROM order_details
    GROUP BY order_id
    HAVING COUNT(item_id) > 12
) AS Num_orders;




