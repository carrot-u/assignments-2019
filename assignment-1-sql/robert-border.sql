-- Question 1
-- Find the most recent completed order where the basket size was > $500.

SELECT *
FROM fact_order
WHERE charge_amount > 500
ORDER BY completed_at DESC
LIMIT 1;

-- Question 2
-- What GMV have we generated, how many orders were made per week in the last 8 weeks in Canada? Order the results from the most recent week to the oldest.

SELECT date_trunc('week', o.created_at) AS WEEK
FROM fact_order o
JOIN zones z ON z.id = o.zone_id
JOIN regions r ON r.id = z.region_id
JOIN countries c ON c.id = r.country_id
WHERE c.name = 'Canada'
GROUP BY 1
ORDER BY 1 DESC
LIMIT 8;

-- Question 3
-- What percentage of our active shoppers have been with us for the following months: - (0-6) - (6-12) - (12-18) - (18-24) - 24+

with raw as (
    select datediff('month',hired_at,current_date()) as tenure
    from drivers
    where active = true
),
bin as (
    select
        case when tenure >= 24 then '24 +'
            when tenure >= 18 then '18 - 24'
            when tenure >= 12 then '12 - 18'
            when tenure >= 6 then '6 - 12'
            when tenure >= 0  then '0  - 6'
            else 'no tenure' end as tenure_bins
        ,count(*) as num_drivers
    from raw
    group by 1
)

select tenure_bins
    ,round(sum(num_drivers) / (select sum(num_drivers) from bin),2) as pct_of_drivers
from bin
group by 1
order by 1

-- Question 4
-- For each of the age range categories you created in the previous question, what is the:
    -- Average delivery counts per age range of shoppers_
    -- Average mpi Rank those ranges from the highest average mpi to the lowest.

-- Average MPI column exists in snowfalke on table instadata.rds_data.drivers but does not exist in psql main
-- Average MPI column is all null

with raw as (
    select id
        ,datediff('month',hired_at,current_date()) as tenure
        ,mpi_average
    from drivers
    where active = true
),
bin as (
    select
        case when tenure >= 24 then '24 +'
            when tenure >= 18 then '18 - 24'
            when tenure >= 12 then '12 - 18'
            when tenure >= 6 then '6 - 12'
            when tenure >= 0  then '0  - 6'
            else 'no tenure' end as tenure_bins
        ,avg(mpi_average) as mpi_average
        ,count(*) as num_drivers
    from raw
    group by 1
)

select tenure_bins
    ,mpi_average
    ,round(sum(num_drivers) / (select sum(num_drivers) from bin),2) as pct_of_drivers
from bin
group by 1, 2
order by 3 desc


-- Question 5
-- Are there duplicate driver ID records in the drivers table? (Column to check: “id”).
-- Are there duplicate batch ID records in the fact_batch table? (Column to check: “batch_id”)
-- If so, return:
    -- the ID that’s duplicated in column 1
    -- the number of occurrences of the dupe in column 2
    -- Order the results by the dupes that are the most duplicated
    -- Limit your result to only 10 records.
-- Can you figure out why there are duplicates?

-- No drivers duplicates
select id
    ,count(*) as num_occurences
from drivers
group by 1
having count(*) > 1
order by 2 desc

-- batch duplicates
select batch_id
    ,count(*) as num_occurences
from fact_batch
group by 1
having count(*) > 1
order by 2 desc
limit 10
-- Multiple shopper_id's per batch. 1 'driver' shopper type and N-1 users.


--Bonus Assignment
-- 1. Find your user (the user who's email is your instacart.com email address)

-- 2. Count the number of orders made by Dave's account (user id: 22438411)

-- 3. Find the most recent order where the total is greater than $500

-- 4. Count the number of deliveries (table name: order_deliveries) from The Garden (warehouse id: 1000) that have been completed in the last day

-- 5. List the user_ids of the first 10 people to have a delivery from The Garden (warehouse id: 1000)

-- 6. Figure out the 5 year anniversary of Dave's account being created, and congratulate him on that day. (Don't forget to convert the timezone from UTC to America/Los_Angeles)
