# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Planned Features
- Output formatting options (table, CSV, YAML)
- Multi-region support in single command
- Resource filtering capabilities
- Cost estimation integration
- HTML report generation
- Support for additional AWS services (ECS, EKS, Fargate)

## [1.0.0] - 2025-02-08

### Added
- Initial release of AWS Resource Automation Script
- Support for 14 AWS services:
  - EC2 (Elastic Compute Cloud)
  - RDS (Relational Database Service)
  - S3 (Simple Storage Service)
  - CloudFront
  - VPC (Virtual Private Cloud)
  - IAM (Identity and Access Management)
  - Route53
  - CloudWatch
  - Lambda
  - CloudFormation
  - SNS (Simple Notification Service)
  - SQS (Simple Queue Service)
  - DynamoDB
  - EBS (Elastic Block Store)
- Region-specific resource queries
- Input validation and error handling
- AWS CLI installation check
- AWS credentials verification
- Case-insensitive service name handling
- Comprehensive README with examples
- MIT License
- Contributing guidelines
- Sample cron wrapper script

### Features
- Single command interface for listing AWS resources
- Support for both regional and global AWS services
- User-friendly error messages
- Minimal dependencies (only requires AWS CLI)
- Easy integration with cron jobs for automation

## [0.0.1] - 2025-02-01

### Added
- Initial script structure
- Basic service support
- Command-line argument parsing

