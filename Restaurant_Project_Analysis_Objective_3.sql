-- Objective 3 
-- 1. Join tables
SELECT *
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id;
SELECT * FROM menu_items;

-- 2.  What were the least and most ordered items?
SELECT item_name, COUNT(order_details_id) AS num_purchases
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
ORDER BY num_purchases;

SELECT mi.item_name, COUNT(od.order_details_id) AS num_purchases
FROM order_details od
LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
GROUP BY mi.item_name
ORDER BY num_purchases DESC;

-- What categories were they in?
SELECT mi.item_name, category, COUNT(od.order_details_id) AS num_purchases
FROM order_details od
LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
GROUP BY mi.item_name, category
ORDER BY num_purchases;

-- 3. What are the top 5 orders  that spent the most money?
SELECT TOP 5 order_id, SUM(price) AS total_spend
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY total_spend DESC;

-- 4. View the details of the highest spend order.What insights can you gather from the
SELECT order_id,category, COUNT(item_id) AS num_items
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
WHERE order_id IN (440,2075,1957,330,2675)
GROUP BY order_id,category;






