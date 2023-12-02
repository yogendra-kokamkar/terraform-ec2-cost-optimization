#Cloudwatch Event to start Ec2 Instances
resource "aws_cloudwatch_event_rule" "start_rule" {
  name                = "start_rule_ec2_instances"
  description         = "Rule to trigger EC2 start Lambda function"
  schedule_expression = "cron(15 08 * * ? *)" #1:45 PM IST
}

resource "aws_cloudwatch_event_target" "lambda_start_target" {
  rule      = aws_cloudwatch_event_rule.start_rule.name
  target_id = "lambda_start_target"
  arn       = aws_lambda_function.ec2_start.arn
}

#Cloudwatch Event to stop Ec2 Instances
resource "aws_cloudwatch_event_rule" "stop_rule" {
  name                = "stop_rule_ec2_instances"
  description         = "Rule to trigger EC2 stop Lambda function"
  schedule_expression = "cron(15 09 * * ? *)" #2:45 PM IST
}

resource "aws_cloudwatch_event_target" "lambda_stop_target" {
  rule      = aws_cloudwatch_event_rule.stop_rule.name
  target_id = "lambda_stop_target"
  arn       = aws_lambda_function.ec2_stop.arn
}