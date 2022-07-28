CREATE OR REPLACE VIEW analysis.orders AS 
with cte as (
	select order_id, max(dttm) as last_status
	from production.orderstatuslog
	group by order_id
),
cte2 as(
	select cte.order_id, os.status_id
	from  cte join  production.orderstatuslog as os
	on cte.last_status=os.dttm and cte.order_id=os.order_id
)
select  o.order_id,
        o.order_ts,
        o.user_id,
        o.bonus_payment,
        o.payment,
        o.cost,
        o.bonus_grant,
       	cte2.status_id as status
from production.orders as o left join cte2
	on cte2.order_id=o.order_id;