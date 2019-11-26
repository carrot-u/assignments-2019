--Question 1

SELECT * FROM Fact_order
WHERE charge_amount > 500
AND completed_at IS NOT NULL
ORDER BY completed_at desc
LIMIT 1;

--Question 2

SELECT DATE_TRUNC('week', completed_at) AS week
    , count(fo.completed_at) AS "Orders Completed"
    , sum(fo.charge_amount) AS "Gross Revenue"
FROM fact_order AS fo
JOIN countries AS c ON c.ID = fo.country_id
WHERE c.name = 'Canada'
AND week BETWEEN DATEADD('week', -9, getdate()) AND DATEADD('week', -1, getdate())
group by week
order by week desc
limit 10;

--Question 3

SELECT
    CASE
        WHEN DATEDIFF('month', hired_at, getdate()) <= 6 THEN '0-6'
        WHEN DATEDIFF('month', hired_at, getdate()) BETWEEN 7 AND 12 THEN '6-12'
        WHEN DATEDIFF('month', hired_at, getdate()) BETWEEN 13 AND 18 THEN '12-18'
        WHEN DATEDIFF('month', hired_at, getdate()) BETWEEN 19 AND 24 THEN '18-24'
        WHEN DATEDIFF('month', hired_at, getdate()) > 24 THEN '24+'
        END AS active_shopper
        , count(id) / (SELECT count(id) FROM drivers WHERE hired_at IS NOT NULL) * 100 AS percentage_by_months_acitve
FROM drivers
WHERE hired_at IS NOT NULL
GROUP BY 1;

--Question 4

N/A

--Question 5

N/A
