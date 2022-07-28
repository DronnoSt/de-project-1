delete from analysis.dm_rfm_segments;
insert into analysis.dm_rfm_segments
select u.id,f.frequency, r.recency, v.monetary_value
from analysis.users as u 
	left join analysis.tmp_rfm_frequency as f on u.id=f.user_id
	left join analysis.tmp_rfm_recency as r on u.id=r.user_id
	left join analysis.tmp_rfm_monetary_value as v on u.id=v.user_id


ID  | frequency | recency  | monetary_value |
0	|     1     |     4	   |        1       |
1	|     2     |     5	   |        2       |
2	|     3	    |     4	   |        5       | 
3	|     3	    |     4	   |        4       |
4	|     2	    |     4	   |        4       |
5	|     3	    |     4	   |        2       |
6	|     4	    |     1	   |        5       |
7	|     5	    |     5	   |        4       |
8	|     5	    |     4	   |        4       |
9	|     2	    |     4	   |        3       |