--Question 1
select *
from fact_order
where charge_amount > 500
and canceled_at is null
and completed_at is not null
order by completed_at desc
limit 1;
--------------------
--Question 2
select date_trunc('week', completed_at) AS week
    , count(distinct(fo.id)) AS num_orders
    , sum(fo.charge_amount) AS GMV
from fact_order fo
left join countries c on fo.country_id = c.id
where c.name = 'Canada'
AND week between dateadd('week', -9, getdate()) AND dateadd('week', -1, getdate())
--didn't wamt the current week to show incomplete set of numbers since the week isn't finished so I offset it by one week
group by 1
order by 1 desc
limit 10;
--------------------
--Question 3
SELECT 
CASE WHEN datediff('month', hired_at, getdate())  <= 6
    THEN '0-6 Months'
    WHEN datediff('month', hired_at, getdate())  BETWEEN 7 AND 12
    THEN '6-12 Months'
    WHEN datediff('month', hired_at, getdate()) BETWEEN 13 AND 18
    THEN '12-18 Months'
    WHEN datediff('month', hired_at, getdate()) BETWEEN 19 AND 24
    THEN '19-24 Months'
    WHEN datediff('month', hired_at, getdate()) > 24
    THEN '24+ Months'
    END AS shopper_tenure
    ,(count(id) / (SELECT count(id) FROM drivers WHERE hired_at IS NOT NULL )) * 100 AS percent_of_total
FROM drivers
    
WHERE hired_at IS NOT NULL

GROUP BY 1

---------------

--Question 4
SELECT CASE WHEN count(distinct(id)) != count(id)
    THEN 'true'
    ELSE 'false'
    END AS duplicates
FROM drivers;

SELECT batch_id,
        count(batch_id) AS dupes
FROM fact_batch
group by 1
having dupes > 1
Order by 2 Desc
limit 10;

-- duplicates occur because there are multiple shopper ids associated with the batch. Is this because it logs all of the shoppers it offered this batch to?

---------------
-- Bonus Questions
-- Bonus Question 1
select *
from users
where id = 56259092

-- Bonus Question 2 -- 
--dave's orders = 38

select count(*)
from orders
where user_id = 22438411

-- Bonus Question 3 -- 
--is this question different than question #1?
select *
from fact_order
where charge_amount > 500
and canceled_at is null
and completed_at is not null
order by completed_at desc
limit 1;

---- Bonus Question 4 -- 

select count(*)
from order_deliveries
where warehouse_id = 1000
and delivered_at >= dateadd('day', -1, getdate()) 
and delivered_at is not null


---- Bonus Question 5 -- 

select o.user_id, od.delivered_at
from order_deliveries od
left join orders o on od.order_id = o.id    
where warehouse_id = 1000
and delivered_at is not null
order by delivered_at ASC
limit 10

---- Bonus Question 6 -- 

with daves_account AS (select * 
from users
where id = 22438411
limit 10)

select  TO_TIMESTAMP_NTZ(CONVERT_TIMEZONE('America/Los_Angeles', dateadd('year', 5, created_at)))
as daves_5_year
from daves_account