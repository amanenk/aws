select
    aws_elbv2_load_balancers.account_id,
    aws_elbv2_load_balancers.region,
    aws_elbv2_load_balancers.name
from aws_elbv2_load_balancers
inner join
    aws_elbv2_load_balancer_attributes on
        aws_elbv2_load_balancer_attributes.load_balancer_cq_id = aws_elbv2_load_balancers.cq_id
where
    aws_elbv2_load_balancers.type = 'application' and aws_elbv2_load_balancer_attributes.routing_http_drop_invalid_header_fields is not true;
