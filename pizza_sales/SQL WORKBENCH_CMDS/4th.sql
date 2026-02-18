-- List the top 10 most ordered pizza types 
-- along with their quantities.

SELECT 
    pizza_types.name, SUM(order_details_id.quantity) AS Quantity
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details_id ON order_details_id.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY quantity DESC
LIMIT 5

