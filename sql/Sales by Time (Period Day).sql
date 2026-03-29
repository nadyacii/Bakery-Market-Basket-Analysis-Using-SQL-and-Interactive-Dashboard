-- Sales by Time (Period Day)

SELECT 
    period_day,
    COUNT(*) AS total_penjualan
FROM bakery
GROUP BY period_day
ORDER BY total_penjualan DESC;