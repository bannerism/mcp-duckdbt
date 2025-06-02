-- Model: customers_by_coupon.sql
-- This model counts unique customers who have paid by coupon

select
  count(distinct o.customer_id) as num_customers_coupon
from {{ ref('stg_payments') }} p
join {{ ref('orders') }} o on p.order_id = o.order_id
where p.payment_method = 'coupon'
