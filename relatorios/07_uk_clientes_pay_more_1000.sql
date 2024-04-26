CREATE VIEW uk_clients_who_pay_more_then_1000 AS
SELECT customers.contact_name, SUM(order_details.unit_price * order_details.quantity * (1.0 - order_details.discount) * 100) / 100 AS payments
FROM customers
INNER JOIN orders ON orders.customer_id = customers.customer_id
INNER JOIN order_details ON order_details.order_id = orders.order_id
WHERE LOWER(customers.country) = 'uk'
GROUP BY customers.contact_name
HAVING SUM(order_details.unit_price * order_details.quantity * (1.0 - order_details.discount)) > 1000;
