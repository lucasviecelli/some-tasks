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
    CASE 
        WHEN count_event > 2 THEN
    	  MAX(difference) FILTER (WHERE id = 2) 
        ELSE
            0 
    END AS value
FROM diffs
WHERE 
    count_event > 1
GROUP BY event_type, count_event;