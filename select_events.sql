WITH diffs as (
    select
    	row_number() over(partition by event_type) as id,
    	count(*) over (partition by event_type) as count_event,
        event_type,
        value - lag(value) over (partition BY event_type ORDER BY time) as difference
    FROM
        events
)
SELECT
    event_type,
    case when count_event > 2 then 
    	  MAX(difference) FILTER (WHERE id = 2) 
    else 0 end as value
from diffs
where COUNT_EVENT > 1
GROUP BY event_type, count_event;