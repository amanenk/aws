      SELECT account_id, region, cloud_watch_logs_log_group_arn  FROM aws_redshift_subnet_groups
      WHERE pattern='{ ($.errorCode = "*UnauthorizedOperation") || ($.errorCode = "AccessDenied*") }'