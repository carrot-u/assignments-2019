-- Week 2 Assignment --
-- QUESTION 1 ---------------------------------------------

SELECT *
FROM fact_order
WHERE charge_amount > 500
AND completed_at is NOT null

ORDER BY completed_at desc
LIMIT 1


-- Question 2 --------------------------------------------

SELECT 
    DATE_TRUNC('week', fo.completed_at) as period,

COUNT(DISTINCT fo.id) AS order_volume,
SUM(fo.total_charged_amt) AS GMV

FROM fact_order fo 
JOIN zones z ON z.id = fo.zone_id
JOIN regions r ON r.id = z.region_id

WHERE
r.country_id = 124
AND fo.completed_at >= date_trunc('week', dateadd('week',-8,current_date()))
AND fo.completed_at < date_trunc('week', current_date())
AND fo.completed_at is not null

GROUP BY 1
ORDER BY period desc


--Question 3 ----------------------------------------------

with active_drivers as (
SELECT 
id, 
hired_at
FROM drivers 
WHERE
workflow_state = 'active'
AND hired_at is NOT null
)

SELECT 
CASE 
    WHEN (DATEDIFF(month, hired_at, current_date) < 6) THEN '0-6 months'
    WHEN (DATEDIFF(month, hired_at, current_date) BETWEEN 6 AND 12) THEN '6-12 months'
    WHEN (DATEDIFF(month, hired_at, current_date) BETWEEN 12 AND 18) THEN '_12-18 months'
    WHEN (DATEDIFF(month, hired_at, current_date) BETWEEN 18 AND 24) THEN '_18-24 months'
    WHEN (DATEDIFF(month, hired_at, current_date) > 24 ) THEN '_24+ months'
    END AS months_shoppers_has_been_on_Instacart,
    ROUND(COUNT (d.id)* 100.0 / (Select COUNT (id) from  active_drivers),2) as pct

FROM active_drivers d

GROUP BY 1
ORDER BY 1 asc


-- Question 4 ---------------------------------------------

with shopper_groups as (
SELECT 
id,
CASE 
    WHEN (DATEDIFF(month, hired_at, current_date) < 6) THEN '0-6 months'
    WHEN (DATEDIFF(month, hired_at, current_date) BETWEEN 6 AND 12) THEN '6-12 months'
    WHEN (DATEDIFF(month, hired_at, current_date) BETWEEN 12 AND 18) THEN '12-18 months'
    WHEN (DATEDIFF(month, hired_at, current_date) BETWEEN 18 AND 24) THEN '18-24 months'
    WHEN (DATEDIFF(month, hired_at, current_date) > 24 ) THEN '_24+ months'
    END AS months_shoppers_have_been_on_Instacart
FROM drivers 
WHERE workflow_state = 'active'
AND hired_at is NOT null
)


SELECT 
sg.months_shoppers_have_been_on_Instacart,
AVG(sm.total_deliveries_count) AS Avg_total_deliveries,
AVG(sm.total_mpi) AS avg_total_mpi


FROM shopper_metrics sm
JOIN shopper_groups sg ON sg.id = sm.shopper_id

GROUP BY 1
ORDER BY 3 desc


-- QUESTION 5 ---------------------------------------------

--Dupe Driver IDs - No duplicates as each shopper account has their own unique ID and each row in this table logs unique shopper accounts on our platform. Shopper accounts do not allow the same 
SELECT 
    id, 
    COUNT(*)
FROM drivers
GROUP BY 1
HAVING COUNT(*) > 1
ORDER BY 2 desc
LIMIT 10

-- Dupe Batch IDs - While each batch has a unique batch_id, with one shopper working on each batch, the batch workflow  and transitioning to next steps may be influenced by other users (support agents, etc.)
SELECT 
    batch_id, 
    COUNT(*)

FROM fact_batch
GROUP BY 1
HAVING COUNT(*) > 1
ORDER BY 2 desc
LIMIT 10



-- Bonus Questions --------------------------------------

-- 1. Find your user (the user who's email is your instacart.com email address)-----------
SELECT 
    id,
    first_name,
    last_name,
    'https://admin.instacart.com/admin/customers/' || id AS user_link
    
FROM eclipse.users
WHERE email = 'chimi.sherpa@instacart.com'


--------------------------------------------
-- 2. Count the number of orders made by Dave's account (user id: 22438411) 
SELECT orders_count
FROM users
WHERE id = 22438411

--------------------------------------------
-- 3. Find the most recent order where the total is greater than $500
SELECT * as order_id
FROM orders
WHERE total > 500
AND completed_at is not null
Order by completed_at desc
LIMIT 1


--------------------------------------------
-- 4. Count the number of deliveries (table name: order_deliveries) from The Garden (warehouse id: 1000) that have been completed in the last day
SELECT 
    DATE_TRUNC('day', delivered_at) as day,
    COUNT (id) as total_orders
FROM order_deliveries
WHERE warehouse_id = 1000
AND workflow_state = 'delivered'
AND delivered_at is not null
GROUP BY 1
ORDER BY 1 desc
LIMIT 1


--------------------------------------------
-- 5. List the user_ids of the first 10 people to have a delivery from The Garden (warehouse id: 1000)
SELECT 
    DISTINCT(o.user_id) AS user_id,
    od.delivered_at
FROM order_deliveries od
JOIN orders o ON o.id = od.order_id
WHERE od.warehouse_id = 1000
AND od.workflow_state = 'delivered'
AND od.delivered_at is not null
ORDER BY od.delivered_at asc
LIMIT 10


--------------------------------------------
-- 6. Figure out the 5 year anniversary of Dave's account being created, and congratulate him on that day. (Don't forget to convert the timezone from UTC to America/Los_Angeles)
SELECT 
    id,
    DATEADD('year', +5, convert_timezone('America/Los_Angeles', created_at)) AS five_year_anniversary
FROM users
WHERE id = 22438411
--------------------------------------------