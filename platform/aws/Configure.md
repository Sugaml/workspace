# Configure Multiple AWS Profiles
You can store multiple AWS credentials in the ~/.aws/credentials and ~/.aws/config files using the following method.

## Method 1: Using the AWS CLI Command
Run the following command to configure multiple profiles:
```bash
aws configure --profile profile_name
```

AWS Access Key ID: <Your Access Key>
AWS Secret Access Key: <Your Secret Key>
Default region name: us-east-1
Default output format: json


## Method 2: Manually Edit AWS Credentials File
Alternatively, you can manually edit the ~/.aws/credentials file:
<<EOF
[default]
aws_access_key_id = YOUR_DEFAULT_ACCESS_KEY
aws_secret_access_key = YOUR_DEFAULT_SECRET_KEY

[dev]
aws_access_key_id = YOUR_DEV_ACCESS_KEY
aws_secret_access_key = YOUR_DEV_SECRET_KEY

[prod]
aws_access_key_id = YOUR_PROD_ACCESS_KEY
aws_secret_access_key = YOUR_PROD_SECRET_KEY


## Step 2: Use a Specific Profile in AWS CLI Commands
Once configured, you can specify which profile to use by adding --profile to your AWS CLI commands.
```bash
aws s3 ls --profile dev
aws ec2 describe-instances --profile dev
```

To set a default profile for your session:
```bash
export AWS_PROFILE=dev
aws s3 ls 
```
Unset it when done:
```bash
unset AWS_PROFILE
```
### Bonus: Switch Profiles Easily
If you frequently switch between profiles, you can use this alias:

```bash
alias awsdev='export AWS_PROFILE=dev'
alias awsprod='export AWS_PROFILE=prod'
awsdev  # Switch to dev profile
awsprod # Switch to prod profile
```
