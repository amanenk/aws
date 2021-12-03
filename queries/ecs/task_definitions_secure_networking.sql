SELECT
    aws_ecs_task_definitions.account_id,
    aws_ecs_task_definitions.region,
    aws_ecs_task_definitions.arn,

    aws_ecs_task_definition_container_definitions.name
FROM aws_ecs_task_definitions
INNER JOIN
    aws_ecs_task_definition_container_definitions ON
        aws_ecs_task_definitions.cq_id =
        aws_ecs_task_definition_container_definitions.task_definition_cq_id
WHERE aws_ecs_task_definitions.network_mode = 'host'
      AND (
    aws_ecs_task_definition_container_definitions.privileged IS DISTINCT FROM TRUE
    AND (cd."user" = 'root' OR cd."user" IS NULL));
