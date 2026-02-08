# Contributing to AWS Resource Automation Script

First off, thank you for considering contributing to this project! 🎉

## Code of Conduct

This project and everyone participating in it is governed by a code of respect and professionalism. By participating, you are expected to uphold this code.

## How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check the existing issues to avoid duplicates. When you create a bug report, include as many details as possible:

- **Use a clear and descriptive title**
- **Describe the exact steps to reproduce the problem**
- **Provide specific examples** (commands you ran, error messages)
- **Describe the behavior you observed** and what you expected
- **Include your environment details** (OS, AWS CLI version, bash version)

### Suggesting Enhancements

Enhancement suggestions are tracked as GitHub issues. When creating an enhancement suggestion, include:

- **Use a clear and descriptive title**
- **Provide a detailed description** of the suggested enhancement
- **Explain why this enhancement would be useful**
- **List any alternative solutions** you've considered

### Pull Requests

1. Fork the repo and create your branch from `main`
2. If you've added code, add tests if applicable
3. Ensure your code follows the existing style
4. Update the README.md with details of changes if needed
5. Update the version number in the script header
6. Issue the pull request

## Development Setup

```bash
# Fork and clone the repository
git clone https://github.com/HenryKum23/AWS_bash_automation_script.git
cd AWS_bash_automation_script

# Create a new branch
git checkout -b feature/your-feature-name

# Make your changes

# Test your changes
./aws_resource_list.sh us-east-1 ec2

# Commit your changes
git add .
git commit -m "Add: brief description of changes"

# Push to your fork
git push origin feature/your-feature-name
```

## Coding Standards

- Use clear, descriptive variable names
- Add comments for complex logic
- Follow bash best practices
- Keep functions modular and reusable
- Handle errors gracefully

### Bash Style Guide

```bash
# Use lowercase for variable names
aws_region=$1

# Use uppercase for constants
readonly MAX_RETRIES=3

# Use descriptive function names
check_aws_credentials() {
    # Function implementation
}

# Always quote variables
echo "Region: $aws_region"

# Use meaningful error messages
log_error "Failed to list EC2 instances in region: $aws_region"
```

## Testing

Before submitting a PR, test your changes with:

- Different AWS regions
- Different AWS services
- Edge cases (invalid inputs, missing credentials)
- Different operating systems if possible

## Commit Messages

- Use present tense ("Add feature" not "Added feature")
- Use imperative mood ("Move cursor to..." not "Moves cursor to...")
- Limit first line to 72 characters
- Reference issues and pull requests liberally

Examples:
```
Add support for ECS service listing
Fix CloudFront region parameter issue
Update README with new examples
```

## Adding New AWS Services

When adding support for a new AWS service:

1. Add the service to the case statement in alphabetical order
2. Use the correct AWS CLI command
3. Add appropriate echo message
4. Update the README.md supported services table
5. Test thoroughly with different regions
6. Update the version number

Example:
```bash
ecs)
    echo "Listing ECS clusters in $aws_region"
    aws ecs list-clusters --region $aws_region
    ;;
```

## Questions?

Feel free to open an issue with the tag `question` if you need help or clarification.

Thank you for your contributions! 🚀

