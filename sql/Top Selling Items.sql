-- Top Selling Items

SELECT 
    item,
    COUNT(*) AS total_terjual
FROM bakery
GROUP BY item
ORDER BY total_terjual DESC;