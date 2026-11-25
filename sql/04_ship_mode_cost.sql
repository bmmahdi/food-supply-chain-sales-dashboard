-- Business question: Which shipping modes are most cost-efficient?
-- Compares shipping cost as a share of sales and average profit per line by ship mode.
SELECT
    "Ship Mode"                                AS ship_mode,
    COUNT(*)                                   AS order_lines,
    ROUND(SUM("Sales"), 2)                     AS total_sales,
    ROUND(SUM("Shipping Cost"), 2)             AS total_shipping_cost,
    ROUND(SUM("Shipping Cost") / NULLIF(SUM("Sales"), 0) * 100, 2) AS shipping_cost_pct_of_sales,
    ROUND(AVG("Profit"), 2)                    AS avg_profit_per_line,
    ROUND(AVG("Discount") * 100, 2)            AS avg_discount_pct
FROM superstore
GROUP BY "Ship Mode"
ORDER BY total_shipping_cost DESC;
