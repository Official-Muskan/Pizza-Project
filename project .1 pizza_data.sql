USE newdb;

SELECT * FROM pizza_data;  

-- Q1 Write an sql query to calculate the total revenue generated from all pizza sales.  

SELECT 
     SUM( total_price ) AS total_revenue
     FROM pizza_data;
	
-- Q2 Write an sql query to find the average order value of all customer orders.  

SELECT 
     SUM(total_price) * 1.0 / COUNT(DISTINCT order_id) AS average_order_value
     FROM pizza_data;

-- Q3 Write an sql query to calculate the total number of pizzas sold. 
 
SELECT SUM(quantity) AS total_pizzas_sold
FROM pizza_data; 

-- Q4 Write an sql query to determine the total number of orders placed. 

SELECT COUNT(DISTINCT order_id) AS total_orders
FROM pizza_data; 

-- Q5Write an sql query to calculate the average number of pizzas sold per order. 
 SELECT 
      CAST(SUM(quantity) AS DECIMAL(10,2)) /
      COUNT(DISTINCT order_id) AS avg_pizzas_per_order 
      FROM pizza_data; 
      
-- Q6 Write an sql query to analyze the daily trend of total orders, showing the number of orders placed each day.  
SELECT 
        order_date, 
        COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_data
GROUP BY order_date 
ORDER BY order_date;

 -- Q7 Write an sql query to analyze the hourly trend of orders, showing the number of orders placed during each hour of the day. 
SELECT   
      HOUR(order_time) AS order_hour, 
      COUNT(DISTINCT order_id) AS orders_per_hour
FROM pizza_data 
GROUP BY HOUR(order_time) 
ORDER BY order_hour; 

-- Q8 Write an sql query to calculate the percentage contribution of sales by each pizza category. 
 
 SELECT 
      pizza_category, 
      SUM(total_price) AS total_sales, 
      ROUND( 
           SUM(total_price) * 100.0 / 
           ( SELECT SUM(total_price) FROM pizza_data), 
           2
	   ) AS sales_percentage 
FROM pizza_data
GROUP BY pizza_category 
ORDER BY sales_percentage DESC; 
           
-- Q9 Write am sql query to find the total number of pizzas sold for each pizza category . 
     SELECT pizza_category, 
            SUM(quantity) AS total_pizzas_sold 
FROM pizza_data 
GROUP BY pizza_category
ORDER BY total_pizzas_sold DESC;
 
-- Q10. Write an sql query to identify the top 5 best-selling pizzas based on total quantity sold. 

SELECT 
      pizza_name,
      SUM(quantity) AS total_quantity_sold
FROM pizza_data 
GROUP BY pizza_name 
ORDER BY total_quantity_sold DESC 
LIMIT 5; 

-- Q11. Write an sql query to identify the bottom 5 least-selling pizzas based on total quantity sold. 

SELECT 
      pizza_name, 
      SUM(quantity) AS total_quantity_sold 
FROM pizza_data 
GROUP BY pizza_name
ORDER BY total_quantity_sold ASC
LIMIT 5;























































