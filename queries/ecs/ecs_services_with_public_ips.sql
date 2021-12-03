SELECT
    aws_ecs_clusters.account_id,
    aws_ecs_clusters.region,
    aws_ecs_cluster_services.cluster_arn,
    aws_ecs_cluster_services.name,
    aws_ecs_cluster_services.arn
FROM aws_ecs_clusters
LEFT JOIN
    aws_ecs_cluster_services ON
        aws_ecs_clusters.cq_id = aws_ecs_cluster_services.cluster_cq_id
WHERE
    network_configuration_awsvpc_configuration_assign_public_ip IS DISTINCT FROM 'DISABLED'
;
