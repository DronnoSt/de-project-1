delete 
from analysis.tmp_rfm_monetary_value;

with cte as (
select user_id, 
		sum(payment) as payment
from analysis.orders
where status=5
group by user_id)

insert into analysis.tmp_rfm_monetary_value

select id,
		ntile(5) over (order by payment desc) as monetary_value
from analysis.users as u left join cte 
		on cte.user_id=u.id
order by 1 