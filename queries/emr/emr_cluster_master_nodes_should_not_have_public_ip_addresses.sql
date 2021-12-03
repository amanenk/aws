SELECT aws_emr_clusters.arn
FROM
    aws_emr_clusters
LEFT OUTER JOIN aws_ec2_subnets
    ON aws_emr_clusters.ec2_instance_attribute_subnet_id = aws_ec2_subnets.id
WHERE
    aws_ec2_subnets.map_public_ip_on_launch
    AND aws_emr_clusters.state IN ('RUNNING', 'WAITING')
