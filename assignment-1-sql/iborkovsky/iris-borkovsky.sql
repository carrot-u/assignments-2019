-- Question 1
-- Find the most recent completed order where the basket size was > $500.
SELECT * 
    FROM fact_order
 WHERE total_charged_amt_usd > 500
 AND completed_at IS NOT NULL
ORDER BY completed_at DESC
LIMIT 1

-- Question 2
-- What GMV have we generated, how many orders were made per week in the last 8 weeks in Canada? 
-- Order the results from the most recent week to the oldest.
SELECT 
    DATE_TRUNC('WEEK', created_at) AS week, 
    COUNT(distinct(id)) AS "Number of Orders", 
    SUM(charge_amount) AS "Weekly GMV"

        FROM fact_order
    WHERE created_at >= current_date - 49
    AND country_id = 124

GROUP BY 1
ORDER BY 1

-- Question 3
-- What percentage of our active shoppers have been with us for the following months: 
-- (0-6) - (6-12) - (12-18) - (18-24) - 24+
SELECT 
    time_worked AS "Time with Instacart",  
    ROUND(100 * driver_count/total,2) AS "Percent of Drivers"

FROM
    (SELECT
    CASE WHEN DATEDIFF(month, hired_at, GETDATE()) <= 6 then '0-6'
    WHEN DATEDIFF(month, hired_at, GETDATE()) BETWEEN 6 AND 12 then '6-12'
    WHEN DATEDIFF(month, hired_at, GETDATE()) BETWEEN 12 AND 18 then '12-18'
    WHEN DATEDIFF(month, hired_at, GETDATE()) BETWEEN 18 AND 24 then '18-24'
    WHEN DATEDIFF(month, hired_at, GETDATE()) > 24 then '24+' END AS time_worked,
    COUNT(id) AS driver_count,
    SUM(COUNT(id)) OVER () AS total
    FROM drivers
    WHERE active = true
    AND hired_at is not null
    GROUP BY 1
    ) 
    AS duration_of_work

ORDER BY time_worked

-- Question 4
-- For each of the age range categories you created in the previous question, what is the: 
-- **- Average delivery counts per age range of shoppers_ - Average mpi Rank those ranges from the highest average mpi to the lowes
WITH time_worked_deliveries AS
(

    SELECT dr.id,
        sm.total_deliveries_count,
        sm.total_mpi,
        CASE WHEN DATEDIFF(month, hired_at, GETDATE()) <= 6 then '0-6'
        WHEN DATEDIFF(month, hired_at, GETDATE()) BETWEEN 6 AND 12 then '6-12'
        WHEN DATEDIFF(month, hired_at, GETDATE()) BETWEEN 12 AND 18 then '12-18'
        WHEN DATEDIFF(month, hired_at, GETDATE()) BETWEEN 18 AND 24 then '18-24'
        WHEN DATEDIFF(month, hired_at, GETDATE()) > 24 then '24+' END AS time_worked
        
    FROM drivers dr
    JOIN shopper_metrics sm ON sm.shopper_id = dr.id
        WHERE active = true
        AND hired_at is not null
)
SELECT ROUND(AVG(total_deliveries_count),2) AS "Average Deliveries",
ROUND(AVG(total_mpi),2) AS "Average MPI",
time_worked

FROM time_worked_deliveries

GROUP BY 3
ORDER BY 2 DESC 

-- Question 5
-- Are there duplicate driver ID records in the drivers table? (Column to check: “id”). 
-- Are there duplicate batch ID records in the fact_batch table? (Column to check: “batch_id”)
-- If so, return: the ID that’s duplicated in column 1, and the number of occurrences of the dupe in column 2 
-- Order the results by the dupes that are the most duplicated Limit your result to only 10 records.
-- Can you figure out why there are duplicates?



SELECT DISTINCT(id) AS "Drive ID", COUNT(id) as "Duplicates"
    FROM drivers
 
 GROUP BY 1
 HAVING COUNT(id) > 1
 ORDER BY 2 DESC
 LIMIT 10
  -- There are no duplicates in the drivers table because each driver is unique and so is their id


SELECT DISTINCT(batch_id) AS "Batch ID", COUNT(batch_id) as "Duplicates"
    FROM fact_batch
 
 GROUP BY 1
 HAVING COUNT(batch_id) > 1
 ORDER BY 2 DESC
 LIMIT 10
 -- There are duplicates in the fact_batch table (as many as 8 per batch_id). There is a field 	
-- shopper_assigned_to_batch_ind in the same table. My gu