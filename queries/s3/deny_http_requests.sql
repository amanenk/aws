select arn
from
    aws_s3_buckets
where
    arn not in (
        -- Find all buckets that have a bucket policy that denies non SSL requests
        select arn
        from
            (
                select
                    aws_s3_buckets.arn,
                    statements,
                    statements -> 'Principal' as principals
                from
                    aws_s3_buckets,
                    jsonb_array_elements(policy -> 'Statement')
                where
                    statements -> 'Effect' = '"Deny"'
            ),
            jsonb_array_elements_text(
                statements -> 'Condition' -> 'Bool' -> 'aws:securetransport'
            )
        where
            principals = '"*"'
            or (
                principals :: jsonb ? 'AWS'
                and (
                    principals -> 'AWS' = '"*"'
                    or principals -> 'AWS' @> '"*"'
                )
            )
            and ssl :: bool = false
    );
