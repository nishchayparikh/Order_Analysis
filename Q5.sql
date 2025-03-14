-- Which sub category had highest growth by profit in 2023 compared to 2022

WITH cte AS (
    SELECT sub_category,
        YEAR(order_date) AS order_year, 
        round(SUM(sale_price),0) AS sales 
    FROM df_orders
    GROUP BY sub_category, YEAR(order_date)
), cte2 as (
SELECT sub_category,
    SUM(CASE WHEN order_year = 2022 THEN sales ELSE 0 END) AS sales_2022,
    SUM(CASE WHEN order_year = 2023 THEN sales ELSE 0 END) AS sales_2023
FROM cte 
GROUP BY sub_category)
select *,round((sales_2023 - sales_2022)*100/sales_2022,2) as nice from cte2
order by nice desc limit 1