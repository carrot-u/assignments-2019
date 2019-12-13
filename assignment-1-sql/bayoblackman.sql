-- Question 1
select * FROM fact_order 
WHERE charge_amount > 500
AND completed_at IS NOT NULL 
ORDER BY completed_at DESC
limit 1;

-- Bonus Assignment
-- Question 1
select id, email
From users
where email = 'leselinyana.blackman@instacart.com';
-- Question 2
select count(user_id)
from orders
Where user_id = '22438411';
-- Question 3
select id, reconciled_total, completed_at
from orders
WHERE reconciled_total > 500 
AND completed_at IS NOT NULL
Order by completed_at DESC
limit 5;
-- Question 4
select count(*)
from order_deliveries
where warehouse_id = 1000
and delivered_at > dateadd('day',-1,now());