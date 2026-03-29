-- Data Cleaning & Feature Engineering (Date, Time, Month, Day, and Period Day)

SELECT 
    transactions,
    item,
    DATE(date_time) AS date,
    TIME(date_time) AS time,
    MONTHNAME(date_time) AS month,
    DAYNAME(date_time) AS day,
    CASE 
        WHEN HOUR(date_time) BETWEEN 5 AND 11 THEN 'morning'
        WHEN HOUR(date_time) BETWEEN 12 AND 16 THEN 'afternoon'
        WHEN HOUR(date_time) BETWEEN 17 AND 20 THEN 'evening'
        ELSE 'night'
    END AS period_day,
    weekday_weekend

FROM bakery;