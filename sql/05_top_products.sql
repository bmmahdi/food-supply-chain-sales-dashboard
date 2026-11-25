-- Business question: Which are the top 5 products by profit, and which products lose money?
-- Ranks products by total profit and flags loss-making products for review.
SELECT
    "Product Name"                             AS product_name,
    "Product Category"                         AS product_category,
    COUNT(*)                                   AS order_lines,
    ROUND(SUM("Sales"), 2)                     AS total_sales,
    ROUND(SUM("Profit"), 2)                    AS total_profit,
    ROUND(SUM("Profit") / NULLIF(SUM("Sales"), 0) * 100, 2) AS profit_margin_pct,
    CASE WHEN SUM("Profit") < 0 THEN 'Loss-making' ELSE 'Profitable' END AS profit_flag
FROM superstore
GROUP BY "Product Name", "Product Category"
ORDER BY total_profit DESC
LIMIT 5;
