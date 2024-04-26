products.product_name, SUM(order_details.unit_price * order_details.quantity * (1.0 - order_details.discount)) AS sales
FROM products
INNER JOIN order_details ON order_details.product_id = products.product_id
GROUP BY products.product_name
ORDER BY sales DESC;