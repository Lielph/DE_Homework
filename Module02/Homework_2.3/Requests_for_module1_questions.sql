select 
sum(sales) as Total_Sales
,sum(profit) as Total_Profit
,sum(profit)*100/sum(sales) as Profit_Ratio
,sum(profit)/count(distinct order_id) as Profit_per_Order
,sum(sales)/count(distinct customer_id) as Sales_per_Customer
,sum(discount)/count(discount) as AVG_Discount
from orders



select 
extract("month" from order_date) as monthz,
segment,
    SUM(sales) AS total_sales
from orders 
group by extract("month" from order_date),segment
order by total_sales desc 

select 
count(distinct subcategory)
from orders

 
select 
subcategory,
extract("month" from order_date) as monthz,
    SUM(sales) AS total_sales
from orders 
group by extract("month" from order_date),subcategory
order by subcategory, monthz