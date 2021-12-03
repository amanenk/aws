select
    aws_elbv1_load_balancers.account_id,
    aws_elbv1_load_balancers.region,
    aws_elbv1_load_balancers.name
from aws_elbv1_load_balancers
inner join
    aws_elbv1_load_balancer_listeners on
        aws_elbv1_load_balancer_listeners.load_balancer_cq_id = aws_elbv1_load_balancers.cq_id
left join
    aws_acm_certificates on
        aws_acm_certificates.arn = aws_elbv1_load_balancer_listeners.listener_ssl_certificate_id
where
    aws_elbv1_load_balancer_listeners.listener_protocol = 'HTTPS' and aws_acm_certificates.arn is null;
