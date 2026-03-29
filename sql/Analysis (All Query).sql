-- Market Basket Analysis on Bakery Sales
-- Author: Nadia Chusnul Ikromah

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


-- Total Transactions
SELECT COUNT(DISTINCT transactions) AS total_transaksi
FROM bakery;


-- Total Unique Items
SELECT COUNT(DISTINCT item) AS total_item
FROM bakery;


-- Sales by Time (Period Day)
SELECT 
    period_day,
    COUNT(*) AS total_penjualan
FROM bakery
GROUP BY period_day
ORDER BY total_penjualan DESC;


-- Sales by Time (Weekday Weekend)
SELECT 
    weekday_weekend,
    COUNT(*) AS total_penjualan
FROM bakery
GROUP BY weekday_weekend;


-- Top Selling Items
SELECT 
    item,
    COUNT(*) AS total_terjual
FROM bakery
GROUP BY item
ORDER BY total_terjual DESC;


-- Top Product Daily (Weekday)
SELECT 
    item,
    COUNT(*) AS total
FROM bakery
WHERE weekday_weekend = 'Weekday'
GROUP BY item
ORDER BY total DESC;


-- Top Product Daily (Weekend)
SELECT 
    item,
    COUNT(*) AS total
FROM bakery
WHERE weekday_weekend = 'Weekend'
GROUP BY item
ORDER BY total DESC;


-- MARKET BASKET (Item Pair)
SELECT 
    a.item AS Item_1,
    b.item AS Item_2,
    COUNT(*) AS Frequency,
    
    -- support
    COUNT(*) / (
        SELECT COUNT(DISTINCT transactions) 
        FROM bakery
    ) AS Support

FROM bakery a
JOIN bakery b 
    ON a.transactions = b.transactions 
    AND a.item < b.item
GROUP BY Item_1, Item_2
ORDER BY Frequency DESC;
