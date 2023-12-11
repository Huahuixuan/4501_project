
WITH RentData AS (
    SELECT 
        zipcode::text, 
        AVG(average_rent) AS avg_rent
    FROM 
        average_rent
    WHERE 
        date >= '2023-01-01' AND date < '2023-02-01'
    GROUP BY 
        zipcode
),
RankedRentData AS (
    SELECT 
        zipcode, 
        avg_rent,
        ROW_NUMBER() OVER (ORDER BY avg_rent DESC) as high_rank,
        ROW_NUMBER() OVER (ORDER BY avg_rent) as low_rank
    FROM 
        RentData
),
TreeCounts AS (
    SELECT 
        zipcode, 
        COUNT(*) AS tree_count
    FROM 
        trees
    GROUP BY 
        zipcode
),
ComplaintCounts AS (
    SELECT 
        zipcode, 
        COUNT(*) AS complaint_count
    FROM 
        complaints
    GROUP BY 
        zipcode
)

SELECT 
    r.zipcode, 
    TO_CHAR(r.avg_rent, 'FM9,999,999.99') AS formatted_avg_rent,
    COALESCE(t.tree_count, 0) AS tree_count,
    COALESCE(c.complaint_count, 0) AS complaint_count
FROM 
    RankedRentData r
LEFT JOIN 
    TreeCounts t ON r.zipcode = t.zipcode
LEFT JOIN 
    ComplaintCounts c ON r.zipcode = c.zipcode
WHERE 
    r.high_rank <= 5 OR r.low_rank <= 5
ORDER BY 
    r.high_rank, r.low_rank
LIMIT 10;
