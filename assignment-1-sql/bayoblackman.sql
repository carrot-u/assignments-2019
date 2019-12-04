-- Question 1
select * FROM fact_order 
WHERE charge_amount > 500
AND completed_at IS NOT NULL 
ORDER BY completed_at DESC
limit 1;
