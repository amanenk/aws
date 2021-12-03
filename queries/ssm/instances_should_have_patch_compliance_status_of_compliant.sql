SELECT
    aws_ssm_instances.arn,
    aws_ssm_instance_compliance_items.title
FROM
    aws_ssm_instances INNER JOIN aws_ssm_instance_compliance_items
    ON
        aws_ssm_instances.cq_id = aws_ssm_instance_compliance_items.instance_cq_id
WHERE
    aws_ssm_instance_compliance_items.compliance_type = 'Patch'
    AND aws_ssm_instance_compliance_items.status IS DISTINCT FROM 'COMPLIANT'
