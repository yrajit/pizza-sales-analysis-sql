-- Determine the top 3 most ordered pizza types 
-- based on revenue for each pizza category.

select name, revenue 
from
(select category, name, revenue,
rank() over (partition by category order by revenue desc ) as rn
from
(select pizza_types.category, pizza_types.name,
sum(order_details_id.quantity * pizzas.price) as revenue
 from pizza_types join pizzas
 on pizza_types.pizza_type_id = pizzas.pizza_type_id
 join order_details_id
 on order_details_id.pizza_id= pizzas.pizza_id
 group by pizza_types.category, pizza_types.name
 order by revenue desc limit 5) as a) as b 
 where rn <= 3;

