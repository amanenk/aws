policy "2" {
    name = "Section 2: Logging"
    description = file("cis_v1.2.0/docs/2.md")

    query "2.1" {
      name = "AWS CIS 2.1 Ensure CloudTrail is enabled in all regions"
      description = file("cis_v1.2.0/docs/2.1.md")
      query       = file("queries/cloudtrail/enabled_in_all_regions.sql")
    }

    query "2.2" {
      name = "AWS CIS 2.2 Ensure CloudTrail log file validation is enabled"
      description = file("cis_v1.2.0/docs/2.2.md")
      query       = file("queries/cloudtrail/log_file_validation_enabled.sql")
    }

    query "2.4" {
      name = "AWS CIS 2.4 Ensure CloudTrail trails are integrated with CloudWatch Logs"
      description = file("cis_v1.2.0/docs/2.4.md")
      query       = file("queries/cloudtrail/integrated_with_cloudwatch_logs.sql")
    }

    query "2.6" {
      name = "AWS CIS 2.6 Ensure S3 bucket access logging is enabled on the CloudTrail S3 bucket"
      description = file("cis_v1.2.0/docs/2.6.md")
      query       = file("queries/cloudtrail/bucket_access_logging.sql")
    }

    query "2.7" {
      name = "AWS CIS 2.7 Ensure CloudTrail logs are encrypted at rest using KMS CMKs"
      description = file("cis_v1.2.0/docs/2.7.md")
      query       = file("queries/cloudtrail/logs_encrypted.sql")
    }

    query "2.8" {
      name = "AWS CIS 2.8 Ensure rotation for customer created CMKs is enabled (Scored)"
      description = file("cis_v1.2.0/docs/2.8.md")
      query       = file("queries/kms/rotation_enabled_for_customer_key.sql")
    }

    query "2.9" {
      name = "AWS CIS 2.9 Ensure VPC flow logging is enabled in all VPCs (Scored)"
      description = file("cis_v1.2.0/docs/2.9.md")
      query       = file("queries/ec2/flow_logs_enabled_in_all_vpcs.sql")
    }
}