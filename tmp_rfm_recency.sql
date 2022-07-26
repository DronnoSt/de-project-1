delete from analysis.tmp_rfm_recency;

with cte as (
	select user_id, 
		   current_date - max(date_trunc('day',order_ts)) as last_order
	from analysis.orders
	where status=4 and extract ('year' from order_ts)=2022
	group by user_id
)

insert into analysis.tmp_rfm_recency
select id,
	ntile(5) over (order by last_order desc) as Recency
from analysis.users as u 
	left join cte on cte.user_id=u.id
	order by 1 

