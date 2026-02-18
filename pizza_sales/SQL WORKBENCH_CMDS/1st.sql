-- Calculate the total revenue generated from pizza sales.

SELECT 
    ROUND(SUM(order_details_id.quantity * pizzas.price),
            2) AS 'total sales'
FROM
    order_details_id
        JOIN
    pizzas ON order_details_id.pizza_id = pizzas.pizza_id;