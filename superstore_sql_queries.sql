/* =====================================================================
   SUPERSTORE SALES ANALYSIS — SQL QUERIES (Beginner Level)
   Table: superstore   (the cleaned data loaded from superstore_clean.csv)

   These answer real business questions using only basic SQL:
   GROUP BY, ORDER BY, SUM / AVG / COUNT, WHERE, HAVING, LIMIT.
   No advanced features (no window functions, no CTEs) — that's on purpose.

   Note: sales and profit load as decimals, so we write  ::numeric  before
   ROUND() — it just tells PostgreSQL the number is safe to round.
   ===================================================================== */


/* ---------------------------------------------------------------
   Q1. Overall snapshot: total sales, total profit, number of
       orders, and the average profit margin.
   --------------------------------------------------------------- */
SELECT
    ROUND(SUM(sales)::numeric, 2)        AS total_sales,
    ROUND(SUM(profit)::numeric, 2)       AS total_profit,
    COUNT(DISTINCT order_id)             AS total_orders,
    ROUND(AVG(profit_margin)::numeric,2) AS avg_profit_margin_pct
FROM superstore;


/* ---------------------------------------------------------------
   Q2. Sales and profit by region — which region performs best?
   --------------------------------------------------------------- */
SELECT
    region,
    ROUND(SUM(sales)::numeric, 2)  AS total_sales,
    ROUND(SUM(profit)::numeric, 2) AS total_profit
FROM superstore
GROUP BY region
ORDER BY total_sales DESC;


/* ---------------------------------------------------------------
   Q3. Sales and profit by category.
       (Watch how high sales does NOT always mean high profit.)
   --------------------------------------------------------------- */
SELECT
    category,
    ROUND(SUM(sales)::numeric, 2)  AS total_sales,
    ROUND(SUM(profit)::numeric, 2) AS total_profit
FROM superstore
GROUP BY category
ORDER BY total_profit DESC;


/* ---------------------------------------------------------------
   Q4. Which sub-categories are LOSING money?
       Sorted from biggest loss upward.
   --------------------------------------------------------------- */
SELECT
    sub_category,
    ROUND(SUM(profit)::numeric, 2) AS total_profit
FROM superstore
GROUP BY sub_category
ORDER BY total_profit ASC;


/* ---------------------------------------------------------------
   Q5. Top 10 products by total sales.
   --------------------------------------------------------------- */
SELECT
    product_name,
    ROUND(SUM(sales)::numeric, 2) AS total_sales
FROM superstore
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;


/* ---------------------------------------------------------------
   Q6. Sales and profit by customer segment.
   --------------------------------------------------------------- */
SELECT
    segment,
    ROUND(SUM(sales)::numeric, 2)  AS total_sales,
    ROUND(SUM(profit)::numeric, 2) AS total_profit
FROM superstore
GROUP BY segment
ORDER BY total_sales DESC;


/* ---------------------------------------------------------------
   Q7. Yearly sales trend — is the business growing?
   --------------------------------------------------------------- */
SELECT
    order_year,
    ROUND(SUM(sales)::numeric, 2)  AS total_sales,
    ROUND(SUM(profit)::numeric, 2) AS total_profit
FROM superstore
GROUP BY order_year
ORDER BY order_year;


/* ---------------------------------------------------------------
   Q8. Monthly sales pattern (all years combined) — which months
       are strongest? Useful for spotting seasonality.
   --------------------------------------------------------------- */
SELECT
    order_month,
    ROUND(SUM(sales)::numeric, 2) AS total_sales
FROM superstore
GROUP BY order_month
ORDER BY order_month;


/* ---------------------------------------------------------------
   Q9. Top 10 states by total sales.
   --------------------------------------------------------------- */
SELECT
    state,
    ROUND(SUM(sales)::numeric, 2) AS total_sales
FROM superstore
GROUP BY state
ORDER BY total_sales DESC
LIMIT 10;


/* ---------------------------------------------------------------
   Q10. Does discounting hurt profit? Average discount vs total
        profit, per category.
   --------------------------------------------------------------- */
SELECT
    category,
    ROUND(AVG(discount)::numeric, 2) AS avg_discount,
    ROUND(SUM(profit)::numeric, 2)   AS total_profit
FROM superstore
GROUP BY category
ORDER BY avg_discount DESC;


/* ---------------------------------------------------------------
   Q11. Average shipping time by ship mode (operations check).
   --------------------------------------------------------------- */
SELECT
    ship_mode,
    ROUND(AVG(shipping_days)::numeric, 1) AS avg_days_to_ship,
    COUNT(*)                              AS number_of_orders
FROM superstore
GROUP BY ship_mode
ORDER BY avg_days_to_ship;
