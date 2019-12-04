
Question 1

SELECT id, user_id, completed_at, charge_amount FROM fact_order
WHERE charge_amount > 500 AND completed_at is not null
ORDER BY  completed_at desc
LIMIT 1

-------------------------------

Question 2

SELECT date_trunc('week',completed_at) AS completed_week, SUM(f.charge_amount) AS total_gmv, count(f.id) AS order_count 
FROM fact_order f
    JOIN zones z on f.zone_id = z.id
    JOIN regions r on z.region_id = r.id
WHERE r.country_id = 124
AND completed_week BETWEEN '2019-09-23' AND '2019-11-18'
GROUP BY 1
ORDER BY 1

-----------------------------------

Question 3
SELECT case 
    WHEN datediff(month, hired_at, now()) BETWEEN 0 and 6 then '0-6'
    WHEN datediff(month, hired_at, now()) BETWEEN 7 and 12 then '7-12'
    WHEN datediff(month, hired_at, now()) BETWEEN 13 and 18 then '12-18'
    WHEN datediff(month, hired_at, now()) BETWEEN 19 and 24 then '18-24'
    WHEN datediff(month, hired_at, now()) > 24 then '>24'
    END as shopper_age,
    (count(id) / (select count(id) from drivers where hired_at is not null)) * 100 as shopper_percentage
FROM drivers
WHERE hired_at is not null
GROUP BY 1

------------------------------

QUESTION 4

WITH shopper_tenure AS (SELECT id,
    CASE
        WHEN datediff(month, hired_at, now()) between 0 and 6 then '0-6'
        WHEN datediff(month, hired_at, now()) between 7 and 12 then '7-12'
        WHEN datediff(month, hired_at, now()) between 13 and 18 then '12-18'
        WHEN datediff(month, hired_at, now()) between 19 and 24 then '18-24'
        WHEN datediff(month, hired_at, now()) > 24 then '>24'
    END as shopper_age
FROM drivers
WHERE hired_at is not null)

SELECT sht.shopper_age, avg(shm.total_deliveries_count) as avg_deliveries, avg(total_mpi) as avg_mpi
FROM shopper_tenure sht
JOIN shopper_metrics shm on sht.id = shm.shopper_id
GROUP BY 1
ORDER BY 3 desc

------------------------------

Question 5A
---There are no duplicate drivers in the drivers table

SELECT id, COUNT(id) as driver_count
FROM drivers
GROUP BY id
HAVING driver_count > 1

Question 5B
---
SELECT batch_id, COUNT(batch_id) as batch_count
FROM fact_batch
GROUP BY batch_id
HAVING batch_count > 1
LIMIT 1
