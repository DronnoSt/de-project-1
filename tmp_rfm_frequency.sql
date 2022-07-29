delete from analysis.tmp_rfm_frequency;

with cte as (
	select user_id, 
		   sum(case when status=4 then 1 else 0 end ) as order_count 
	from analysis.orders
	where extract ('year' from order_ts)=2022
	group by user_id
)
insert into analysis.tmp_rfm_frequency
select id,
       ntile(5) over (order by order_count asc) as frequency
from analysis.users as u 
	left join cte on cte.user_id=u.id
order by 1 ;