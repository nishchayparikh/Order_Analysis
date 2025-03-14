#Find the top 10 highest revenue generating products

select product_id, round(sum(sale_price),0) as sales
from df_orders group by product_id order by sales desc limit 10;
