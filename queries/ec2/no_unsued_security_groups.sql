select arn
from
    aws_ec2_security_groups
left join
    aws_ec2_instance_network_interface_groups on
        aws_ec2_security_groups.id = aws_ec2_instance_network_interface_groups.group_id
where
    aws_ec2_instance_network_interface_groups.cq_id is null
