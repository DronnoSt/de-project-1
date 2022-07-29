CREATE OR REPLACE VIEW analysis.orders AS 
with cte as (
	select order_id, status_id,
	row_number() over (partition by order_id order by dttm desc) as rn
	from production.orderstatuslog
)
select  o.order_id,
        o.order_ts,
        o.user_id,
        o.bonus_payment,
        o.payment,
        o.cost,
        o.bonus_grant,
		cte.status_id as status	
from production.orders as o 
left join cte on cte.order_id=o.order_id
where cte.rn=1;