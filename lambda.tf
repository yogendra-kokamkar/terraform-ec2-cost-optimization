#Lambda Function to Start EC2 Instances

resource "aws_lambda_function" "ec2_start" {
  filename         = data.archive_file.lambda_zip_start_ec2.output_path
  function_name    = "ec2_start"
  role             = aws_iam_role.lambda_role.arn
  handler          = "lambda_function.lambda_handler"
  runtime          = "python3.11"
  layers           = ["arn:aws:lambda:ap-south-1:336392948345:layer:AWSSDKPandas-Python311:2"] #This is AWS Default Layer, ARN May differ
  timeout          = "30"
  source_code_hash = data.archive_file.lambda_zip_start_ec2.output_base64sha256
}

data "archive_file" "lambda_zip_start_ec2" {
  type        = "zip"
  source_dir  = "scripts/ec2-start/"
  output_path = "scripts/ec2-start/ec2-start.zip"
}

resource "aws_lambda_permission" "allow_cloudwatch_to_start_ec2" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.ec2_start.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.start_rule.arn
}

#Lambda Function to Stop EC2 Instances

resource "aws_lambda_function" "ec2_stop" {
  filename         = data.archive_file.lambda_zip_stop_ec2.output_path
  function_name    = "ec2_stop"
  role             = aws_iam_role.lambda_role.arn
  handler          = "lambda_function.lambda_handler"
  runtime          = "python3.11"
  layers           = ["arn:aws:lambda:ap-south-1:336392948345:layer:AWSSDKPandas-Python311:2"] #This is AWS Default Layer, ARN May differ
  timeout          = "30"
  source_code_hash = data.archive_file.lambda_zip_stop_ec2.output_base64sha256
}

data "archive_file" "lambda_zip_stop_ec2" {
  type        = "zip"
  source_dir  = "scripts/ec2-stop/"
  output_path = "scripts/ec2-stop/ec2-stop.zip"
}

resource "aws_lambda_permission" "allow_cloudwatch_to_stop_ec2" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.ec2_stop.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.stop_rule.arn
}
