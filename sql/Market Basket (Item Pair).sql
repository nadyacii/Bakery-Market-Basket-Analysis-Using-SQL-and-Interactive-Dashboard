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