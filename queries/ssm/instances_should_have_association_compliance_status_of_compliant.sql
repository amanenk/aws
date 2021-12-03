SELECT
    aws_ssm_instances.arn,
    aws_ssm_instance_compliance_items.title
FROM
    aws_ssm_instances INNER JOIN aws_ssm_instance_compliance_items
    ON
        aws_ssm_instances.cq_id = instance_cq_id
WHERE
    aws_ssm_instance_compliance_items.compliance_type = 'Association'
    AND aws_ssm_instance_compliance_items.status IS DISTINCT FROM 'COMPLIANT'
