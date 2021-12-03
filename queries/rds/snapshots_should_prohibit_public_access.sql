SELECT arn
FROM aws_rds_cluster_snapshots, jsonb_array_elements(attributes)
WHERE
    (attrs ->> 'AttributeName' IS NOT DISTINCT FROM 'restore')
    AND (attrs -> 'AttributeValues') ? 'all'
