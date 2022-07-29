delete from analysis.dm_rfm_segments;
insert into analysis.dm_rfm_segments
select u.id,f.frequency, r.recency, v.monetary_value
from analysis.users as u 
	left join analysis.tmp_rfm_frequency as f on u.id=f.user_id
	left join analysis.tmp_rfm_recency as r on u.id=r.user_id
	left join analysis.tmp_rfm_monetary_value as v on u.id=v.user_id






ID  | frequency | recency   | monetary_value |
1	|     3		|	 4	    |		3		 |
2	|	  3	    |	 2		|		5		 |
3	|	  3		|	 2		|		3		 |
4	|	  3		|	 4		|		3		 |
5	|	  5		|	 5		|		5		 |
6	|	  3		|	 1		|		5		 |
7	|	  2		|	 4		|		2		 |
8	|	  1		|	 1		|		3		 |
9	|	  3		|	 1		|		2		 |