-- Sales by Time (Weekday Weekend)

SELECT 
    weekday_weekend,
    COUNT(*) AS total_penjualan
FROM bakery
GROUP BY weekday_weekend;