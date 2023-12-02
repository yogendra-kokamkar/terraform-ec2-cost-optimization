# Automation for EC2 Instances Cost Optimization using Terraform

This project aims to automate the starting and stopping of EC2 instances based on an Excel sheet stored in an S3 bucket. Terraform is used to define the infrastructure, including Lambda functions, IAM roles, S3 bucket, and CloudWatch Events. The Lambda functions are triggered by AWS CloudWatch Events at scheduled times.


![flow_diagram2](https://github.com/yogendra-kokamkar/terraform-ec2-cost-optimization/assets/55878086/9fc6ef38-83c7-403f-ae0b-12ce065d9e84)

## Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Setup](#setup)
- [Usage](#usage)
- [Testing](#testing)
- [Logging and Monitoring](#logging-and-monitoring)
- [Security](#security)
- [Scaling](#scaling)
- [Maintenance](#maintenance)
- [Contributing](#contributing)
- [License](#license)

## Overview

The project automates the management of EC2 instances based on a predefined schedule specified in an Excel sheet. Two Lambda functions are responsible for starting and stopping instances, triggered by CloudWatch Events.

## Prerequisites

Before you begin, ensure you have the following:

- AWS account with appropriate permissions
- Excel sheet with instance IDs saved to a specific format in an S3 bucket
- Terraform installed on your local machine
- AWS CLI configured for Terraform

## Setup

1. **Prepare Excel Sheet:**
   - Create an Excel sheet listing the instance IDs.
   - Save the sheet to the designated S3 bucket.

2. **IAM Role:**
   - Create an IAM role with the required permissions for Lambda functions.

3. **Lambda Functions:**
   - Create two Lambda functions: one for starting instances and another for stopping instances.
   - Configure functions with the IAM role.

4. **CloudWatch Events:**
   - Create two CloudWatch Events rules for scheduling Lambda function executions.

5. **Testing:**
   - Test Lambda functions to ensure correct interaction with EC2 instances.

## Usage

The EC2 instances will be automatically started and stopped based on the schedule specified in the Excel sheet. Lambda functions will be triggered by CloudWatch Events at the scheduled times.


## Testing

To test the Lambda functions, follow these steps:

1. Manually trigger the CloudWatch Events rules to execute the Lambda functions.
2. Check CloudWatch Logs for each Lambda function to verify correct execution.

## Logging and Monitoring

Logging is implemented within the Lambda functions. CloudWatch Metrics are used for monitoring Lambda function invocations and performance.

## Security

Ensure that IAM roles and permissions are correctly configured. Implement encryption for S3 and follow AWS best practices for security.

## Scaling

Consider potential scaling issues, especially if the number of instances or the size of the Excel sheet grows. Optimize your code and architecture accordingly.

## Maintenance

Regularly review and update the solution, especially if there are changes in EC2 instances or scheduling requirements.

## Contributing

Feel free to contribute by opening issues or pull requests. Your feedback and contributions are highly appreciated.

## License

This project is licensed under the [MIT License](LICENSE).

