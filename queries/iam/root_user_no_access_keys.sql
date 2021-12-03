SELECT * FROM aws_iam_users
INNER JOIN
    aws_iam_user_access_keys ON
        aws_iam_users.cq_id = aws_iam_user_access_keys.user_cq_id
WHERE user_name = '<root>'
