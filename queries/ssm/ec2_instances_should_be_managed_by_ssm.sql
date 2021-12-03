SELECT aws_ec2_instances.id
FROM
    aws_ec2_instances LEFT OUTER JOIN aws_ssm_instances
    ON aws_ec2_instances.id = aws_ssm_instances.instance_id
WHERE
    aws_ssm_instances.instance_id IS NULL
