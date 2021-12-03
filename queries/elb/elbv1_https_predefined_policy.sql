select
    aws_elbv1_load_balancers.account_id,
    aws_elbv1_load_balancers.region,
    aws_elbv1_load_balancers.name
from aws_elbv1_load_balancers
inner join
    aws_elbv1_load_balancer_listeners on
        aws_elbv1_load_balancer_listeners.load_balancer_cq_id = aws_elbv1_load_balancers.cq_id
where
    aws_elbv1_load_balancer_listeners.listener_protocol in (
        'HTTPS', 'SSL'
    ) and 'ELBSecurityPolicy-TLS-1-2-2017-01' != any(
        aws_elbv1_load_balancers.other_policies
    );
