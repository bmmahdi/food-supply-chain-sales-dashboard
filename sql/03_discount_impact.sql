-- Business question: How does discounting affect profitability?
-- Buckets orders by discount band and compares margin and profit per order line.
SELECT
    CASE
        WHEN "Discount" = 0            THEN '0% (No discount)'
        WHEN "Discount" <= 0.05        THEN '1-5%'
        WHEN "Discount" <= 0.10        THEN '6-10%'
        WHEN "Discount" <= 0.20        THEN '11-20%'
        ELSE '20%+'
    END                                        AS discount_band,
    COUNT(*)                                   AS order_lines,
    ROUND(SUM("Sales"), 2)                     AS total_sales,
    ROUND(SUM("Profit"), 2)                    AS total_profit,
    ROUND(SUM("Profit") / NULLIF(SUM("Sales"), 0) * 100, 2) AS profit_margin_pct,
    ROUND(AVG("Profit"), 2)                    AS avg_profit_per_line
FROM superstore
GROUP BY discount_band
ORDER BY MIN("Discount");
