--Q1

select id, completed_at, max(charge_amount) as basket_size
from fact_order
where charge_amount > 500  and deleted_ind = 'N' and canceled_at is null
group by 1,2
order by completed_at desc nulls last
limit 1;

--Q2 

select date_trunc ('week', fo.completed_at) as week , sum(fo.charge_amount) as GMV
from fact_order fo join countries c on fo.country_id = country_id
where completed_at > current_timestamp - interval '8 weeks' and c.name = 'United States of America'
and date_trunc('week', fo.completed_at) <> date_trunc('week', current_timestamp)
group by 1
order by week desc;

--Q3
     
select case when datediff(month, hired_at, current_timestamp) < 6 then '0-6'
            when datediff(month, hired_at, current_timestamp) between 6 and 11 then '6-12'
            when datediff(month, hired_at, current_timestamp) between 12 and 17 then '12-18'
            when datediff(month, hired_at, current_timestamp) between 18 and 23 then '18-24'
       else '24+' end as month,
            count(id)/sum(count (id)) over () * 100 || '%'as pct
from drivers
where hired_at is not null and active = true
group by 1;

--Q4 

with t as(
   select case when datediff(month, hired_at, current_timestamp) < 6 then '0-6'
               when datediff(month, hired_at, current_timestamp) between 6 and 11 then '6-12'
               when datediff(month, hired_at, current_timestamp) between 12 and 17 then '12-18'
               when datediff(month, hired_at, current_timestamp) between 18 and 23 then '18-24'
          else '24+' end as month,
               id
    from drivers
    where hired_at is not null and active = true
    group by 1,2
  )
select t.month, sum(m.total_deliveries_count)/sum(total_mpi) as avg_cnt
from t join shopper_metrics m on t.id = m.shopper_id
group by 1
order by avg_cnt desc;

--Q5 

--no duplicate id in drivers table
select id, count(*) as cnt
from drivers
group by 1
having cnt > 1
order by cnt desc
limit 10;

--there are duplicate batch_id in fact_batch table since one batch could be sent to mulitple shoppers
select batch_id, count(distinct) as cnt
from fact_batch  
group by 1
having cnt > 1
order by cnt desc
limit 10;


--Bonus assignment

--Q1 (using name column since there is no email column)

select *
from users 
where name ilike '%yang.wang@instacart.com%';

--Q2

select count(id)as cnt
from orders 
where user_id = 22438411;

--Q3

select id, charge_amount
from orders
where charge_amount>500
order by completed_at desc
limit 1;

--Q4

select count(order_id) as order_cnt, to_date(delivered_at) as day
from order_deliveries
where delivered_at is not null and deleted_ind = 'N' and warehouse_id = 1000
group by 2
order by day desc
limit 1;

--Q5

select distinct user_id
from(
    select o.user_id, dense_rank() over (partition by user_id order by delivered_at) as rnk
    from orders o join order_deliveries od on o.id = od.order_id
    where od.warehouse_id = 1000 and delivered_at is not null and o.deleted_ind = 'N' and od.deleted_ind = 'N'
)
where rnk = 1
limit 10;

--Q6

select dateadd(year, 5, to_date(convert_timezone('UTC', 'America/Los_Angeles', created_at::timestamp_ntz))) as "5_year_anniversary"
from users
where id = 22438411;

