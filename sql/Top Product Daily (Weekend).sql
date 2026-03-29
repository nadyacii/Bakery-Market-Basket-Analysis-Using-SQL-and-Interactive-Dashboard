-- Top Product Daily (Weekend)
SELECT 
    item,
    COUNT(*) AS total
FROM bakery
WHERE weekday_weekend = 'Weekend'
GROUP BY item
ORDER BY total DESC;