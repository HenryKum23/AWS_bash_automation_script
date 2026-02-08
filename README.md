# AWS Resource Automation Script

![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Bash](https://img.shields.io/badge/bash-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)
![License](https://img.shields.io/badge/license-MIT-blue.svg?style=for-the-badge)

A powerful bash automation script designed to streamline AWS resource management by listing and auditing resources across 14 different AWS services with a single command.

## 🚀 Overview

This script automates the process of inventorying AWS resources, eliminating the need to manually navigate through the AWS Console. Perfect for DevOps engineers, cloud administrators, and anyone managing AWS infrastructure.

## ✨ Features

- **14 AWS Services Supported**: EC2, RDS, S3, Lambda, DynamoDB, VPC, IAM, Route53, CloudWatch, CloudFormation, SNS, SQS, EBS, and CloudFront
- **Region-Specific Queries**: Target specific AWS regions for accurate resource tracking
- **Input Validation**: Built-in checks for arguments, AWS CLI installation, and credentials
- **Error Handling**: Comprehensive error checking and user-friendly messages
- **Lightweight**: No dependencies other than AWS CLI
- **Cron-Ready**: Easy integration with cron jobs for scheduled audits
- **Case-Insensitive**: Service names can be entered in any case

## 📋 Prerequisites

Before using this script, ensure you have:

1. **AWS CLI** installed on your system
2. **AWS Credentials** configured (`aws configure`)
3. **Bash shell** (Linux, macOS, or WSL on Windows)
4. **Appropriate IAM permissions** to list resources for the services you want to query

## 🔧 Installation

### 1. Clone the Repository

```bash
git clone https://github.com/HenryKum23/AWS_bash_automation_script.git
cd AWS_bash_automation_script
```

### 2. Make the Script Executable

```bash
chmod +x aws_resource_list.sh
```

### 3. Verify AWS CLI Installation

```bash
aws --version
```

If not installed, install AWS CLI:

**Linux:**
```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

**macOS:**
```bash
brew install awscli
```

**Windows:**
Download and run the MSI installer from [AWS CLI official page](https://aws.amazon.com/cli/)

### 4. Configure AWS Credentials

```bash
aws configure
```

Enter your:
- AWS Access Key ID
- AWS Secret Access Key
- Default region name
- Default output format (json recommended)

## 📖 Usage

### Basic Syntax

```bash
./aws_resource_list.sh <aws_region> <aws_service>
```

### Examples

**List EC2 instances in us-east-1:**
```bash
./aws_resource_list.sh us-east-1 ec2
```

**List S3 buckets (global service):**
```bash
./aws_resource_list.sh us-east-1 s3
```

**List Lambda functions in eu-west-1:**
```bash
./aws_resource_list.sh eu-west-1 lambda
```

**List RDS databases in ap-southeast-1:**
```bash
./aws_resource_list.sh ap-southeast-1 rds
```

### Supported Services

| Service | Command | Region Required |
|---------|---------|----------------|
| EC2 Instances | `ec2` | Yes |
| RDS Databases | `rds` | Yes |
| S3 Buckets | `s3` | No (Global) |
| CloudFront | `cloudfront` | No (Global) |
| VPC | `vpc` | Yes |
| IAM Users | `iam` | No (Global) |
| Route53 | `route53` | No (Global) |
| CloudWatch | `cloudwatch` | Yes |
| Lambda Functions | `lambda` | Yes |
| CloudFormation | `cloudformation` | Yes |
| SNS Topics | `sns` | Yes |
| SQS Queues | `sqs` | Yes |
| DynamoDB Tables | `dynamodb` | Yes |
| EBS Volumes | `ebs` | Yes |


## 📊 Output Format

The script outputs AWS resources in JSON format by default. You can redirect output to a file:

```bash
./aws_resource_list.sh us-east-1 ec2 > ec2_instances.json
```

### Sample Output (EC2)

```json
{
    "Reservations": [
        {
            "Instances": [
                {
                    "InstanceId": "i-1234567890abcdef0",
                    "InstanceType": "t2.micro",
                    "State": {
                        "Name": "running"
                    },
                    "LaunchTime": "2024-01-15T10:30:00.000Z"
                }
            ]
        }
    ]
}
```

## 🛡️ Security Best Practices

1. **Never commit AWS credentials** to version control
2. **Use IAM roles** when running on EC2 instances
3. **Follow principle of least privilege** - grant only necessary permissions
4. **Rotate access keys regularly**
5. **Enable MFA** for AWS accounts
6. **Use AWS Secrets Manager** or Parameter Store for sensitive data

### Recommended IAM Permissions

Create an IAM policy with read-only access:

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ec2:Describe*",
                "rds:Describe*",
                "s3:ListAllMyBuckets",
                "lambda:ListFunctions",
                "dynamodb:ListTables",
                "iam:ListUsers",
                "cloudwatch:DescribeAlarms",
                "sns:ListTopics",
                "sqs:ListQueues"
            ],
            "Resource": "*"
        }
    ]
}
```

## 🐛 Troubleshooting

### Common Issues

**Issue: "AWS CLI is not installed"**
```bash
# Solution: Install AWS CLI using the installation instructions above
```

**Issue: "AWS CLI is not configured"**
```bash
# Solution: Run aws configure and enter your credentials
aws configure
```

**Issue: "Unable to locate credentials"**
```bash
# Solution: Verify your credentials file exists
cat ~/.aws/credentials
```

**Issue: "An error occurred (UnauthorizedOperation)"**
```bash
# Solution: Check your IAM permissions for the specific service
aws iam get-user
```

**Issue: "Invalid choice 'list-bucket'"**
```bash
# Solution: This is a typo in your script. Use 'list-buckets' (plural)
```

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Feature Ideas

- [ ] Add support for more AWS services (ECS, EKS, Fargate)
- [ ] Output formatting options (table, csv, yaml)
- [ ] Resource filtering and search capabilities
- [ ] Cost estimation integration
- [ ] Multi-region queries in a single command
- [ ] HTML report generation
- [ ] Resource tagging audit
- [ ] Compliance checks

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👤 Author

**Henry Kumah**

- GitHub: [@HenryKum23](https://github.com/HenryKum23)
- LinkedIn: [Henry Kumah](https://linkedin.com/in/henry-kumah)

## 🙏 Acknowledgments

- AWS CLI Documentation
- AWS Community
- DevOps Best Practices

## 📞 Support

If you have any questions or run into issues, please:

1. Check the [Troubleshooting](#-troubleshooting) section
2. Open an issue on GitHub
3. Reach out on LinkedIn

## 🗺️ Roadmap

- **v1.0.0** - Initial release with 14 AWS services
- **v1.1.0** - Add output formatting options
- **v1.2.0** - Multi-region support
- **v2.0.0** - Web dashboard for visualization

---

⭐ If you find this project useful, please consider giving it a star on GitHub!

**Made with ❤️ for the DevOps Community**
