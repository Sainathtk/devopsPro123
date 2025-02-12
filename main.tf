provider "aws" {
  region = "ap-south-1"
}

resource "aws_subnet" "my_subnet" {
  vpc_id     = "vpc-06b326e20d7db55f9>"
  cidr_block = "10.0.1.0/24"
}

resource "aws_security_group" "my_sg" {
  name_prefix = "my-sg"
  vpc_id      = "vpc-06b326e20d7db55f9"
}

resource "aws_lambda_function" "my_lambda" {
  function_name = "myLambdaFunction"
  role          = "<IAM_ROLE>"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  filename      = "lambda_function.zip"
  source_code_hash = filebase64sha256("lambda_function.zip")
  vpc_config {
    subnet_ids         = [aws_subnet.my_subnet.id]
    security_group_ids = [aws_security_group.my_sg.id]
  }
}
