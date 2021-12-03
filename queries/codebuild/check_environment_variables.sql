SELECT DISTINCT
    aws_codebuild_projects.account_id,
    aws_codebuild_projects.region,
    aws_codebuild_projects.name
FROM aws_codebuild_projects
INNER JOIN aws_codebuild_project_environment_variables ON
    aws_codebuild_projects.cq_id = aws_codebuild_project_environment_variables.project_cq_id
WHERE aws_codebuild_project_environment_variables."type" = 'PLAINTEXT'
    AND (
        UPPER(
            aws_codebuild_project_environment_variables.name
        ) LIKE '%ACCESS_KEY%'
        OR UPPER(
            aws_codebuild_project_environment_variables.name
        ) LIKE '%SECRET%'
        OR UPPER(
            aws_codebuild_project_environment_variables.name
        ) LIKE '%PASSWORD%'
    );
