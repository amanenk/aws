SELECT
    account_id,
    region,
    id
FROM aws_ec2_network_acls
LEFT JOIN
    aws_ec2_network_acl_associations ON
        aws_ec2_network_acls.cq_id =
        aws_ec2_network_acl_associations.network_acl_cq_id
WHERE
    aws_ec2_network_acl_associations.cq_id IS NULL;
