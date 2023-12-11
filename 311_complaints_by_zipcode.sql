
SELECT zipcode, COUNT(complaint_id) AS complaints_num
FROM complaints
WHERE complaint_created_date >= '2022-10-01' AND complaint_created_date <= '2023-09-30'
GROUP BY zipcode
ORDER BY complaints_num DESC;
