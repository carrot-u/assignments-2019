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
  ,count(distinct o.id) as num_orders
  ,sum(o.charge_amount) as GMV
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

with raw as (
    select d.id
        ,datediff('month',d.hired_at,current_date()) as tenure
        ,sm.total_mpi
        ,sm.total_deliveries_count
    from drivers d
    left join shopper_metrics sm on sm.shopper_id = d.id
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
        ,round(sum(total_deliveries_count)/sum(total_mpi),2) as average_mpi
        ,round(avg(total_deliveries_count),2) as avg_num_deliveries
        ,count(*) as num_drivers
    from raw
    group by 1
)

select tenure_bins
    ,average_mpi
    ,avg_num_deliveries
from bin
order by 2 desc


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

select id, email
from users
where email = 'robert.border@instacart.com'

-- 2. Count the number of orders made by Dave's account (user id: 22438411)

select count(*) as num_orders
from orders
where user_id = 22438411

-- 3. Find the most recent order where the total is greater than $500

select id
from orders
where total > 500
order by created_at desc

-- 4. Count the number of deliveries (table name: order_deliveries) from The Garden (warehouse id: 1000) that have been completed in the last day

select count(*) as num_order_deliveries
from order_deliveries
where warehouse_id = 1000
and created_at::date = dateadd('day',-1,current_date())

-- 5. List the user_ids of the first 10 people to have a delivery from The Garden (warehouse id: 1000)

select o.user_id
from order_deliveries od
left join orders o on o.id = od.order_id
where od.warehouse_id = 1000
order by od.created_at asc
limit 10

-- 6. Figure out the 5 year anniversary of Dave's account being created, and congratulate him on that day. (Don't forget to convert the timezone from UTC to America/Los_Angeles)

select cast(dateadd('year',5,convert_timezone('UTC','America/Los_Angeles',created_at)::date) as varchar) || ': Happy IC Anniversary Dave!'
from users
where id = 22438411
