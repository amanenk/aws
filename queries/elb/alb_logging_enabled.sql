(select
    aws_elbv2_load_balancers.account_id,
    aws_elbv2_load_balancers.region,
    aws_elbv2_load_balancers.name
    from aws_elbv2_load_balancers
    inner join
        aws_elbv2_load_balancer_attributes on
            aws_elbv2_load_balancer_attributes.load_balancer_cq_id = aws_elbv2_load_balancers.cq_id
    where aws_elbv2_load_balancers.type = 'application' and aws_elbv2_load_balancer_attributes.access_logs_s3_enabled is not true)
union distinct
(
    select
        account_id,
        region,
        name
    from
        aws_elbv1_load_balancers
    where attributes_access_log_enabled is not true
);
