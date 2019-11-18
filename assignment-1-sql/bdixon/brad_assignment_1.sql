-- Assignment #1
-- Question 1: Find the most recent completed order where the basket size was > $500.

select id, user_id, completed_at, charge_amount
from fact_order
where charge_amount > 500
and completed_at is not null
order by completed_at desc
limit 1

-- Question 2: What GMV have we generated, how many orders were made per week in the 
-- last 8 weeks in Canada? Order the results from the most recent week to the oldest.

select date_trunc('week',completed_at) as completion_week, sum(f.charge_amount) as total_GMV, count(f.id) as order_count 
from fact_order f
    join zones z on f.zone_id = z.id 
    join regions r on z.region_id = r.id
where r.country_id = 124
and completion_week between '2019-09-23' and '2019-11-11'
group by 1
order by 1 

-- Question 3: What percentage of our active shoppers have been with us for the 
-- following months: - (0-6) - (6-12) - (12-18) - (18-24) - 24+
select case 
    when datediff(month, hired_at, now()) between 0 and 6 then '0-6'
    when datediff(month, hired_at, now()) between 7 and 12 then '7-12'
    when datediff(month, hired_at, now()) between 13 and 18 then '12-18'
    when datediff(month, hired_at, now()) between 19 and 24 then '18-24'
    when datediff(month, hired_at, now()) > 24 then '>24'
    END as shopper_age,
    (count(id) / (select count(id) from drivers where hired_at is not null)) * 100 as shopper_percentage
from drivers
where hired_at is not null
group by 1

-- Question 4: For each of the age range categories you created in the previous 
-- question, what is the: **- Average delivery counts per age range of shoppers_ 
-- - Average mpi Rank those ranges from the highest average mpi to the lowest.
with shopper_tenure as (select id,
    case 
        when datediff(month, hired_at, now()) between 0 and 6 then '0-6'
        when datediff(month, hired_at, now()) between 7 and 12 then '7-12'
        when datediff(month, hired_at, now()) between 13 and 18 then '12-18'
        when datediff(month, hired_at, now()) between 19 and 24 then '18-24'
        when datediff(month, hired_at, now()) > 24 then '>24'
    END as shopper_age
from drivers
where hired_at is not null)

select st.shopper_age, avg(sm.total_deliveries_count) as avg_deliveries, avg(total_mpi) as avg_mpi
from shopper_tenure st
join shopper_metrics sm on st.id = sm.shopper_id
group by 1
order by 3 desc

-- Are there duplicate driver ID records in the drivers table? (Column to check: “id”). 
-- Are there duplicate batch ID records in the fact_batch table? (Column to check: “batch_id”)
-- If so, return: the ID that’s duplicated in column 1, and the number of occurrences of the dupe in column 2 
-- Order the results by the dupes that are the most duplicated Limit your result to only 10 records.
-- Can you figure out why there are duplicates?

--DUPLICATE BATCHES
select id, count(id) as count_drivers
from drivers
group by 1
having count_drivers > 1 -- results in zero duplicate drivers

-- DUPLICATE BATCHES
select batch_id, count(*) as count_records
from fact_batch
group by 1
having count_records > 1
order by 2 desc
limit 10 -- this results in 10 batch_ids w/ multiple records, when counted there are > 1 million duplicate records
