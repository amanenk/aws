WITH sg_rules_ports AS (SELECT
    aws_ec2_security_groups.account_id,
    aws_ec2_security_groups.region,
    aws_ec2_security_groups.group_name,
    aws_ec2_security_groups.arn,
    aws_ec2_security_groups.id,

    aws_ec2_security_group_ip_permissions.from_port,

    aws_ec2_security_group_ip_permissions.to_port,

    aws_ec2_security_group_ip_permissions.ip_protocol,

    aws_ec2_security_group_ip_permissions.cq_id AS permission_id
    FROM aws_ec2_security_groups
    LEFT JOIN
        aws_ec2_security_group_ip_permissions
        ON aws_ec2_security_groups.cq_id =
           aws_ec2_security_group_ip_permissions.security_group_cq_id)

SELECT
    sg_rules_ports.*,
    aws_ec2_security_group_ip_permission_ip_ranges.cidr_ip AS ip
FROM sg_rules_ports
LEFT JOIN aws_ec2_security_group_ip_permission_ip_ranges
          ON
        sg_rules_ports.permission_id = aws_ec2_security_group_ip_permission_ip_ranges.security_group_ip_permission_cq_id
UNION DISTINCT
SELECT
    sg_rules_ports.*,
    aws_ec2_security_group_ip_permission_ipv6_ranges.cidr_ipv6 AS ip
FROM sg_rules_ports
LEFT JOIN aws_ec2_security_group_ip_permission_ipv6_ranges
          ON
        sg_rules_ports.permission_id = aws_ec2_security_group_ip_permission_ipv6_ranges.security_group_ip_permission_cq_id
