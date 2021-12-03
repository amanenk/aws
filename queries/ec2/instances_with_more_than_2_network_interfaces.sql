SELECT
    account_id,
    region,
    id,
    COUNT(aws_ec2_instance_network_interfaces.cq_id) AS interfaces
FROM aws_ec2_instances
LEFT JOIN
    aws_ec2_instance_network_interfaces ON
        aws_ec2_instances.cq_id = aws_ec2_instance_network_interfaces.instance_cq_id
GROUP BY account_id,
    region,
    id
HAVING COUNT(aws_ec2_instance_network_interfaces.cq_id) > 1
