SELECT SUM((order_details.unit_price) * order_details.quantity * (1.0 - order_details.discount)) AS total_revenues_1997
FROM order_details
INNER JOIN (
    SELECT order_id 
    FROM orders 
    WHERE EXTRACT(YEAR FROM order_date) = '1997'
) AS ord 
ON ord.order_id = order_details.order_id;