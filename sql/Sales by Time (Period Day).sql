-- Sales by Time (Period Day)

WITH new_data AS (
    SELECT 
        transactions,
        item,
        CASE 
            WHEN HOUR(date_time) BETWEEN 5 AND 11 THEN 'morning'
            WHEN HOUR(date_time) BETWEEN 12 AND 16 THEN 'afternoon'
            WHEN HOUR(date_time) BETWEEN 17 AND 20 THEN 'evening'
            ELSE 'night'
        END AS period_day
    FROM bakery
)

SELECT 
    period_day,
    COUNT(*) AS total_transactions
FROM new_data
GROUP BY period_day
ORDER BY total_transactions DESC;