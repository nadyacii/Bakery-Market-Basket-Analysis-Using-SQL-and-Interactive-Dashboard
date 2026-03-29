-- Top Product Daily (Weekday)

SELECT 
    item,
    COUNT(*) AS total
FROM bakery
WHERE weekday_weekend = 'Weekday'
GROUP BY item
ORDER BY total DESC;