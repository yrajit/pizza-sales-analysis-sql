-- Identify the most common pizza size ordered.
SELECT 
    pizzas.size,
    COUNT(order_details_id.order_details_id) AS order_count
FROM
    pizzas
        JOIN
    order_details_id ON order_details_id.pizza_id = pizzas.pizza_id
GROUP BY pizzas.size
ORDER BY order_count DESC
;