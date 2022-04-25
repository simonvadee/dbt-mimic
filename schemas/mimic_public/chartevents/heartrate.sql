SELECT *
FROM
    chartevents -- dbt-ref(chartevents)
WHERE
    itemid = 211 -- Only select heart rate rows
