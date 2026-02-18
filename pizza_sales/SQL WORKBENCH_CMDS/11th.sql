-- Calculate the percentage contribution of each pizza type to total revenue.

SELECT 
    pizza_types.category,
    ROUND(SUM(order_details_id.quantity * pizzas.price) / (SELECT 
                    ROUND(SUM(order_details_id.quantity * pizzas.price),
                                2) AS 'total sales'
                FROM
                    order_details_id
                        JOIN
                    pizzas ON order_details_id.pizza_id = pizzas.pizza_id) * 100,
            2) AS revenue
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details_id ON order_details_id.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY revenue DESC;