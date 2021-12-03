SELECT
    account_id,
    id,
    region
FROM aws_redshift_clusters

WHERE EXISTS(SELECT 1
                    FROM aws_redshift_cluster_parameter_groups
                    INNER JOIN aws_redshift_cluster_parameters
    ON
        aws_redshift_cluster_parameter_groups.cq_id = aws_redshift_cluster_parameters.cluster_parameter_group_cq_id
    WHERE rsc.cq_id = aws_redshift_cluster_parameter_groups.cluster_cq_id
        AND (
            aws_redshift_cluster_parameters.parameter_name = 'require_ssl' AND aws_redshift_cluster_parameters.parameter_value = 'false'
        )
        OR (
            aws_redshift_cluster_parameters.parameter_name = 'require_ssl' AND aws_redshift_cluster_parameters.parameter_value IS NULL
        )
        OR NOT EXISTS((SELECT 1
            FROM aws_redshift_cluster_parameters
            WHERE
                cluster_parameter_group_cq_id = aws_redshift_cluster_parameter_groups.cq_id
                AND parameter_name = 'require_ssl'))
);
