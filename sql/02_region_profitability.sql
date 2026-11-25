-- Business question: Which Canadian provinces / regions are most and least profitable?
-- Profit per region with margin and discount intensity to spot margin erosion.
SELECT
    "Province"                                 AS province,
    "Region"                                   AS region,
    COUNT(*)                                   AS order_lines,
    ROUND(SUM("Sales"), 2)                     AS total_sales,
    ROUND(SUM("Profit"), 2)                    AS total_profit,
    ROUND(SUM("Profit") / NULLIF(SUM("Sales"), 0) * 100, 2) AS profit_margin_pct,
    ROUND(AVG("Discount") * 100, 2)            AS avg_discount_pct,
    ROUND(SUM("Shipping Cost"), 2)             AS total_shipping_cost
FROM superstore
GROUP BY "Province", "Region"
ORDER BY total_profit DESC;
