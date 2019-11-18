-- Assignment 1 SQL
-- https://github.com/carrot-u/carrot-u-docs/blob/master/2019-session/assignments/assignment-1-sql.md

------------------------------------------------
-- Question 1
-- Find the most recent completed order where the basket size was > $500.
SELECT *
FROM fact_order
WHERE completed_at is NOT NULL
AND charge_amount > 500
ORDER BY completed_at DESC
LIMIT 1

------------------------------------------------
-- Question 2
-- What GMV have we generated, how many orders were made per week in the last 8 weeks in Canada? 
-- Order the results from the most recent week to the oldest.
SELECT DATE_TRUNC('week', fact_order.completed_at) AS WEEK, 
       SUM(fact_order.charge_amount) AS GMV, 
       COUNT(fact_order.id) AS NUM_ORDERS, 
FROM fact_order FO
INNER JOIN countries C
ON FO.country_id = C.id
WHERE C.name = 'Canada'
-- AND FO.completed_at BETWEEN DATEADD(day, -56, CURRENT_DATE) AND DATEADD(day, -1, CURRENT_DATE)
-- AND fact_order.completed_at BETWEEN DATEADD(week, -7, CURRENT_DATE) AND CURRENT_DATE
GROUP BY 1
ORDER BY 1 DESC
LIMIT 8

------------------------------------------------
-- Question 3
-- What percentage of our active shoppers have been with us for the following months:
--  - (0-6) - (6-12) - (12-18) - (18-24) - 24+
SELECT
    CASE
        WHEN DATEDIFF(month, hired_at, CURRENT_DATE) >= 24 THEN '(4) 4+ months'
        WHEN DATEDIFF(month, hired_at, CURRENT_DATE) >= 12 THEN '(3) 12-24 months'
        WHEN DATEDIFF(month, hired_at, CURRENT_DATE) >= 6 THEN '(2) 6-12 months'
        WHEN DATEDIFF(month, hired_at, CURRENT_DATE) >= 0 THEN '(1) 0-6 months'
        ELSE '(5) N/A'
    END AS hired_since, 
    COUNT(*) AS drivers_count, 
    drivers_count/SUM(drivers_count) OVER () AS drivers_pct
FROM drivers
WHERE active = 1
GROUP BY 1
ORDER BY 1 ASC

------------------------------------------------
-- Question 4
-- For each of the age range categories you created in the previous question, 
-- what is the: **- Average delivery counts per age range of shoppers_ 
-- - Average mpi Rank those ranges from the highest average mpi to the lowest.
SELECT
    CASE
        WHEN DATEDIFF(month, D.hired_at, CURRENT_DATE) >= 24 THEN '4+ months'
        WHEN DATEDIFF(month, D.hired_at, CURRENT_DATE) >= 12 THEN '12-24 months'
        WHEN DATEDIFF(month, D.hired_at, CURRENT_DATE) >= 6 THEN '6-12 months'
        WHEN DATEDIFF(month, D.hired_at, CURRENT_DATE) >= 0 THEN '0-6 months'
        ELSE 'N/A'
    END AS hired_since, 
    ROUND(AVG(S.total_deliveries_count) , 2) AS avg_deliveries_count,
    ROUND((SUM(S.total_deliveries_count) / SUM(S.total_mpi)), 2) AS avg_mpi
FROM shopper_metrics S
INNER JOIN drivers D
ON S.shopper_id = D.id
WHERE D.active = 1
GROUP BY 1
ORDER BY 3 DESC

------------------------------------------------
-- Question 5
-- Are there duplicate driver ID records in the drivers table? (Column to check: “id”). 
SELECT COUNT(id), COUNT(DISTINCT id)
FROM drivers
-- Are there duplicate batch ID records in the fact_batch table? (Column to check: “batch_id”)
SELECT COUNT(batch_id), COUNT(DISTINCT batch_id)
FROM fact_batch
-- If so, return: the ID that’s duplicated in column 1, and the number of occurrences of 
-- the dupe in column 2 Order the results by the dupes that are the most duplicated Limit 
-- your result to only 10 records.
-- Can you figure out why there are duplicates?
SELECT batch_id, COUNT(batch_id) AS occurrences
FROM fact_batch
GROUP BY 1
HAVING occurrences > 1
ORDER BY occurrences DESC
LIMIT 10

------------------------------------------s------
Bonus assignment
------------------------------------------------
-- 1. Find your user (the user who's email is your instacart.com email address)

------------------------------------------------
-- 2. Count the number of orders made by Dave's account (user id: 22438411)
SELECT COUNT(*)
FROM orders
WHERE user_id = '22438411'

------------------------------------------------
-- 3. Find the most recent order where the total is greater than $500
SELECT * 
FROM orders
WHERE total > '500'
ORDER BY created_at DESC
LIMIT 1

------------------------------------------------
-- 4. Count the number of deliveries (table name: order_deliveries) from The Garden (warehouse id: 1000) that have been completed in the last day
SELECT COUNT(*)
FROM order_deliveries
WHERE warehouse_id = '1000'
AND DATE_TRUNC('day', delivered_at) = DATEADD(day, -1, CURRENT_DATE) 

------------------------------------------------
-- 5. List the user_ids of the first 10 people to have a delivery from The Garden (warehouse id: 1000)

------------------------------------------------
-- 6. Figure out the 5 year anniversary of Dave's account being created, and congratulate him on that day. (Don't forget to convert the timezone from UTC to America/Los_Angeles)
