#!/bin/bash

###################################
# Author: Henry Kumah
# Version: v.0.0.2
#
# Script to automate the process of listing all the resources in an AWS account
#########################################

set -euo pipefail  # Exit on error, undefined variable, pipe failure

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Log function
log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1" >&2
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

# Check if the required number of arguments are passed
if [ $# -lt 2 ] || [ $# -gt 3 ]; then
    echo "Usage: $0 <aws_region> <aws_service> [output_file]"
    echo "Example: $0 us-east-1 ec2"
    echo "Example: $0 us-east-1 ec2 output.json"
    echo ""
    echo "Supported services: ec2, rds, s3, cloudfront, vpc, iam, route53, cloudwatch,"
    echo "                    lambda, cloudformation, sns, sqs, dynamodb, ebs, all"
    exit 1
fi

# Assign the arguments to variables
aws_region=$1
aws_service=$(echo "$2" | tr '[:upper:]' '[:lower:]')
output_file=${3:-}

# Check if the AWS CLI is installed
if ! command -v aws &> /dev/null; then
    log_error "AWS CLI is not installed. Please install the AWS CLI and try again."
    exit 1
fi

# Check if the AWS CLI is configured
if [ ! -d ~/.aws ]; then
    log_error "AWS CLI is not configured. Please configure the AWS CLI and try again"
    exit 1
fi

# Verify AWS credentials
if ! aws sts get-caller-identity &> /dev/null; then
    log_error "AWS credentials are invalid or expired. Please check your credentials."
    exit 1
fi

log_info "Authenticated as: $(aws sts get-caller-identity --query 'Arn' --output text)"

# Function to handle output
output_result() {
    if [ -n "$output_file" ]; then
        cat >> "$output_file"
    else
        cat
    fi
}

# List the resources based on the service
case $aws_service in 
    ec2)
        log_info "Listing EC2 instances in $aws_region"
        aws ec2 describe-instances --region "$aws_region" | output_result
        ;;
    rds)
        log_info "Listing RDS instances in $aws_region"
        aws rds describe-db-instances --region "$aws_region" | output_result
        ;;
    s3)
        log_info "Listing S3 buckets (S3 is a global service)"
        aws s3api list-buckets | output_result
        ;;
    cloudfront)
        log_info "Listing CloudFront distributions (CloudFront is a global service)"
        aws cloudfront list-distributions | output_result
        ;;
    vpc)
        log_info "Listing VPCs in $aws_region"
        aws ec2 describe-vpcs --region "$aws_region" | output_result
        ;;
    iam)
        log_info "Listing IAM users (IAM is a global service)"
        aws iam list-users | output_result
        ;;
    route53)
        log_info "Listing Route53 hosted zones (Route53 is a global service)"
        aws route53 list-hosted-zones | output_result
        ;;
    cloudwatch)
        log_info "Listing CloudWatch alarms in $aws_region"
        aws cloudwatch describe-alarms --region "$aws_region" | output_result
        ;;
    lambda)
        log_info "Listing Lambda functions in $aws_region"
        aws lambda list-functions --region "$aws_region" | output_result
        ;;
    cloudformation)
        log_info "Listing CloudFormation stacks in $aws_region"
        aws cloudformation list-stacks --region "$aws_region" | output_result
        ;;
    sns)
        log_info "Listing SNS topics in $aws_region"
        aws sns list-topics --region "$aws_region" | output_result
        ;;
    sqs)
        log_info "Listing SQS queues in $aws_region"
        aws sqs list-queues --region "$aws_region" | output_result
        ;;
    dynamodb)
        log_info "Listing DynamoDB tables in $aws_region"
        aws dynamodb list-tables --region "$aws_region" | output_result
        ;;
    ebs)
        log_info "Listing EBS volumes in $aws_region"
        aws ec2 describe-volumes --region "$aws_region" | output_result
        ;;
    all)
        log_info "Listing all resources in $aws_region"
        for service in ec2 rds s3 vpc lambda dynamodb ebs; do
            echo "========== $service =========="
            $0 "$aws_region" "$service" "$output_file"
            echo ""
        done
        ;;
    *)
        log_error "Invalid service: $aws_service"
        echo "Supported services: ec2, rds, s3, cloudfront, vpc, iam, route53, cloudwatch,"
        echo "                    lambda, cloudformation, sns, sqs, dynamodb, ebs, all"
        exit 1
        ;;
esac

if [ -n "$output_file" ]; then
    log_info "Output saved to: $output_file"
fi

log_info "Script completed successfully"