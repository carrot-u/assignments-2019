
--Answer for Question 1: 

SELECT id FROM fact_order 
WHERE charge_amount > 500
ORDER BY updated_at DESC
LIMIT 1;



--Answer for Question 2: 
Select date_trunc('week',completed_at) as completion_week, sum(f.charge_amount) as total_GMV, count(f.id) as order_count 
from fact_order f
    join zones z on f.zone_id = z.id 
    join regions r on z.region_id = r.id
where r.country_id = 124
and completion_week between '2019-09-23' and '2019-11-11'
group by 1
order by 1 


--Answer for Question 3: 
SELECT CASE 
    WHEN datediff('month', hired_at, current_date)  <= 6
    THEN '0-6 Mo'
    WHEN datediff('month', hired_at, current_date)  BETWEEN 7 AND 12
    THEN '6-12 Mo'
    WHEN datediff('month', hired_at, current_date) BETWEEN 13 AND 18
    THEN '12-18 Mo'
    WHEN datediff('month', hired_at, current_date) BETWEEN 19 AND 24
    THEN '19-24 Months'
    WHEN datediff('month', hired_at, current_date) > 24
    THEN '24+ Mo'
    END AS tenure, (count(id) / (SELECT count(id) FROM drivers WHERE hired_at IS NOT NULL )) * 100 AS percentage_active
FROM drivers
    
WHERE hired_at IS NOT NULL

GROUP BY 1

--Answer for Question 4: 

WHITH sh_tenure AS (SELECT id,
CASE 
    WHEN datediff('month', hired_at, current_date)  <= 6
    THEN '0-6 Mo'
    WHEN datediff('month', hired_at, current_date)  BETWEEN 7 AND 12
    THEN '6-12 Mo'
    WHEN datediff('month', hired_at, current_date) BETWEEN 13 AND 18
    THEN '12-18 Mo'
    WHEN datediff('month', hired_at, current_date) BETWEEN 19 AND 24
    THEN '19-24 Months'
    WHEN datediff('month', hired_at, current_date) > 24
    THEN '24+ Mo'
    END AS tenure t
    FROM drivers 
    WHERE hired_at IS NOT NULL)

    SELECT t.tenure, AVG(m.total_deliveries_count) AS avg_deliveries, AVG(total_mpi) AS avg_mpi
    FROM sh_tenure st
    INNER JOIN shopper_metrics m ON st.id = m.shopper_id
    GROUP BY 1
    ORDER BY 3 DESC;


--Answer for Question 5:

--DUPLICATE BATCHES
select id, count(id) as count_drivers
from drivers
group by 1
having count_drivers > 1 

-- This query results in zero duplicate drivers

-- DUPLICATE BATCHES
select batch_id, count(*) as count_records
from fact_batch
group by 1
having count_records > 1
order by 2 desc
limit 10 

-- This query results in 10 batch_ids with multiple records. There are over 1 million duplicate records