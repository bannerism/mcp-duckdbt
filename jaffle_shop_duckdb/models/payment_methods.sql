-- Model: payment_methods.sql
-- This model joins customers, orders, and payments to show each customer's payment methods

select
  c.customer_id,
  c.first_name,
  c.last_name,
  p.payment_method
from {{ ref('customers') }} c
join {{ ref('orders') }} o on c.customer_id = o.customer_id
join {{ ref('stg_payments') }} p on o.order_id = p.order_id
where p.payment_method is not null
