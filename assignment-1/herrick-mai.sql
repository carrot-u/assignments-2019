/*question 1 Find the most recent completed order where the basket size was > $500.
*/
SELECT * FROM Fact_order
WHERE charge_amount > 500
AND completed_at IS NOT NULL
ORDER BY created_at
DESC LIMIT 1

/*question 2 What GMV have we generated, how many orders were made per week in the last 8 weeks in Canada?
Order the results from the most recent week to the oldest.
*/
-- fact_order table: charge_amount, country_id, zone_id
-- zones table: region_id (i.e. 447 plattsburg-ny)
-- regions table: country_id refers to countries,
-- countries table: Canada has id of 124

SELECT SUM(fact_order.charge_amount) AS Total_GMV, COUNT(fact_order.id) as Total_Orders, DATE_TRUNC('week', completed_at) AS Week FROM fact_order
JOIN zones on fact_order.zone_id = zones.region_id
JOIN regions on fact_order.country_id = regions.country_id
JOIN countries on fact_order.country_id = countries.id
where fact_order.country_id = 124
AND completed_at
BETWEEN '2019-9-29' AND '2019-11-17'
GROUP BY Week
ORDER BY Week DESC

/*question 3 What percentage of our active shoppers have been with us for
the following months: - (0-6) - (6-12) - (12-18) - (18-24) - 24+
Tables; drivers, column is hired_at
*/
SELECT CASE
WHEN DATEDIFF(month, hired_at, 2019-11-18 00:00:00) BETWEEN 0 AND 6 THEN '(0-6)'
WHEN DATEDIFF(month, hired_at, 2019-11-18 00:00:00) BETWEEN 6 AND 12 THEN '(6-12)'
WHEN DATEDIFF(month, hired_at, 2019-11-18 00:00:00) BETWEEN 12 AND 18 THEN '(12-18)'
WHEN DATEDIFF(month, hired_at, 2019-11-18 00:00:00) BETWEEN 18 AND 24 THEN '(18-24)'
WHEN DATEDIFF(month, hired_at, 2019-11-18 00:00:00) > 24 THEN '24+',
COUNT(id)/SUM(count(id))
FROM drivers
--didn't get a chance to make it work =(
