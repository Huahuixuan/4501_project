
SELECT 
    t.zipcode::text, 
    COUNT(t.*) AS total_trees
FROM 
    trees t
LEFT JOIN zipcodes z
ON ST_Contains(z.geometry, t.geometry)
GROUP BY 
    t.zipcode
ORDER BY 
    total_trees DESC
LIMIT 10;
