SELECT
    account_id,
    region,
    id
FROM aws_ec2_vpcs
WHERE vpc_id NOT IN(
    SELECT vpc_id
    FROM aws_ec2_vpc_endpoints
    WHERE vpc_endpoint_type = 'Interface'
          AND service_name ~
        'com.amazonaws.' || region || '.ec2'
)
