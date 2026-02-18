-- Analyze the cumulative revenue generated over time.

select order_date,
round(sum(revenue) over (order by order_date),2) as cum_revenue
from
 (select orders.order_date, 
 sum(order_details_id.quantity * pizzas.price) as revenue
 from order_details_id join pizzas
 on order_details_id.pizza_id = pizzas.pizza_id
 join orders
 on order_details_id.order_id= orders.order_id
 group by order_date
 order by revenue limit 5) as sale;
 