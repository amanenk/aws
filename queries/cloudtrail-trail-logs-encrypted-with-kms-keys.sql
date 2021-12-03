select

    account_id,
    region,
    arn

from aws_cloudtrail_trails where kms_key_id is null
