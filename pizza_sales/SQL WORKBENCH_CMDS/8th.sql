-- Group the orders by date and 
-- calculate the average number of pizzas ordered per day.

SELECT 
    AVG(quantity)
FROM
    (SELECT 
        DATE(order_date) AS Date,
            SUM(order_details_id.quantity) AS quantity
    FROM
        orders
    JOIN order_details_id ON orders.order_id = order_details_id.order_id
    GROUP BY DATE(order_date)) AS a;