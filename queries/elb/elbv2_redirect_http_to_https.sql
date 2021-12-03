select
    account_id,
    region,
    arn,
    protocol,

    aws_elbv2_listener_default_actions.type
from aws_elbv2_listeners
inner join
    aws_elbv2_listener_default_actions on
        aws_elbv2_listeners.cq_id =
        aws_elbv2_listener_default_actions.listener_cq_id
where
    protocol = 'HTTP' and (

        aws_elbv2_listener_default_actions.type != 'REDIRECT' or
        aws_elbv2_listener_default_actions.redirect_config_protocol != 'HTTPS'
    )
