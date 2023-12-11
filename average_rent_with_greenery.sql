
SELECT t.zipcode, TO_CHAR(AVG(r.average_rent), 'FM9,999,999.99') AS avg_rent
FROM (
    SELECT zipcode
    FROM trees
    GROUP BY zipcode
    ORDER BY COUNT(*) DESC
    LIMIT 10
) AS t
LEFT JOIN average_rent r ON t.zipcode::text = r.zipcode::text
WHERE r.date >= '2023-08-01' AND r.date < '2023-09-01'
GROUP BY t.zipcode
ORDER BY COUNT(*) DESC;
