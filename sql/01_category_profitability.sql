-- Business question: Which product categories drive sales and profit, and what is the margin?
-- Maps the retail categories to a food manufacturer's portfolio (Beverages, Snacks, Perishables, Other).
SELECT
    CASE
        WHEN "Product Category" = 'Technology' THEN 'Beverages'
        WHEN "Product Category" = 'Furniture'  THEN 'Snacks'
        WHEN "Product Category" = 'Office Supplies' THEN 'Perishables'
        ELSE 'Other'
    END AS food_category,
    COUNT(*)                                   AS order_lines,
    ROUND(SUM("Sales"), 2)                     AS total_sales,
    ROUND(SUM("Profit"), 2)                    AS total_profit,
    ROUND(SUM("Profit") / NULLIF(SUM("Sales"), 0) * 100, 2) AS profit_margin_pct,
    ROUND(AVG("Discount") * 100, 2)            AS avg_discount_pct
FROM superstore
GROUP BY food_category
ORDER BY total_sales DESC;
