delete from analysis.tmp_rfm_monetary_value;

with cte as (
	select user_id, 
			sum(case when status=4 then payment else 0 end) as payment
	from analysis.orders
	where extract ('year' from order_ts)=2022
	group by user_id
)

insert into analysis.tmp_rfm_monetary_value
select id,
		ntile(5) over (order by payment) as monetary_value
from analysis.users as u left join cte 
		on cte.user_id=u.id
order by 1