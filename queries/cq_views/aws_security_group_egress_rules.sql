WITH sg_rules_ports AS (SELECT sg.account_id,
                               sg.region,
                               sg.group_name,
                               sg.arn,
                               sg.id,
                               p.from_port,
                               p.to_port,
                               p.ip_protocol,
                               p.cq_id AS permission_id
                        FROM aws_ec2_security_groups sg
                                 LEFT JOIN aws_ec2_security_group_ip_permissions_egresses p
                                           ON sg.cq_id = p.security_group_cq_id)
SELECT sgs.*, r.cidr_ip AS ip
FROM sg_rules_ports sgs
         LEFT JOIN aws_ec2_security_group_ip_permissions_egress_ip_ranges r
                   ON sgs.permission_id = r.security_group_ip_permissions_egress_cq_id
UNION
SELECT sgs.*, r.cidr_ipv6 AS ip
FROM sg_rules_ports sgs
         LEFT JOIN aws_ec2_security_group_ip_permissions_egress_ipv6_ranges r
                   ON sgs.permission_id = r.security_group_ip_permissions_egress_cq_id
