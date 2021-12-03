SELECT

    aws_iam_users.account_id,
    arn,
    max(password_last_used) AS password_last_used

FROM aws_iam_users
LEFT JOIN
    aws_iam_virtual_mfa_devices ON
        aws_iam_virtual_mfa_devices.user_arn = aws_iam_users.arn
WHERE
    aws_iam_users.user_name = '<root_account>' AND (
        serial_number IS NULL OR aws_iam_users.mfa_active = FALSE
    )
GROUP BY aws_iam_users.account_id, arn
