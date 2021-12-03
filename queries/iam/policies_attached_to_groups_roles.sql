SELECT
    aws_iam_users.account_id,
    arn,
    user_name
FROM aws_iam_users
INNER JOIN
    aws_iam_user_attached_policies ON
        aws_iam_users.cq_id =
        aws_iam_user_attached_policies.user_cq_id
