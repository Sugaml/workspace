# AWS CLI Commands Guide

This document provides a comprehensive list of commonly used AWS CLI commands for managing AWS services such as S3, EC2, IAM, Lambda, and CloudWatch.

## Prerequisites

- Install AWS CLI: [AWS CLI Installation Guide](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
- Configure AWS CLI with your credentials:
  ```sh
  aws configure
  ```

## AWS CLI Commands

### S3 (Simple Storage Service)
```sh
# List all S3 buckets
aws s3 ls

# Create a new S3 bucket
aws s3 mb s3://my-bucket-name

# Upload a file to an S3 bucket
aws s3 cp file.txt s3://my-bucket-name/

# Sync a local folder to an S3 bucket
aws s3 sync ./local-folder s3://my-bucket-name

# Delete a file from an S3 bucket
aws s3 rm s3://my-bucket-name/file.txt
```

### EC2 (Elastic Compute Cloud)
```sh
# List all EC2 instances
aws ec2 describe-instances

# Start an EC2 instance
aws ec2 start-instances --instance-ids i-1234567890abcdef0

# Stop an EC2 instance
aws ec2 stop-instances --instance-ids i-1234567890abcdef0

# Reboot an EC2 instance
aws ec2 reboot-instances --instance-ids i-1234567890abcdef0
```

### IAM (Identity and Access Management)
```sh
# List all IAM users
aws iam list-users

# Create a new IAM user
aws iam create-user --user-name new-user

# Attach a policy to a user
aws iam attach-user-policy --user-name new-user --policy-arn arn:aws:iam::aws:policy/AmazonS3FullAccess
```

### Lambda
```sh
# List all Lambda functions
aws lambda list-functions

# Invoke a Lambda function
aws lambda invoke --function-name my-function output.txt

# Update a Lambda function code
aws lambda update-function-code --function-name my-function --zip-file fileb://function.zip
```

### CloudWatch
```sh
# List CloudWatch log groups
aws logs describe-log-groups

# Retrieve logs from a log stream
aws logs get-log-events --log-group-name my-log-group --log-stream-name my-log-stream
```

## Additional Resources
- [AWS CLI Documentation](https://docs.aws.amazon.com/cli/latest/userguide/)
- [AWS CLI Command Reference](https://docs.aws.amazon.com/cli/latest/reference/)

---

**Author:** [Your Name]  
**Date:** [YYYY-MM-DD]

