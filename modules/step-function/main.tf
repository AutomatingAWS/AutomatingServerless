resource "aws_sfn_state_machine" "calculator-state-machine" {
  name     = var.sfn_name
  role_arn = var.sfn_arn

  definition = var.sfn_def == "" templatefile("${path.module}/templates/steptemplate.json", {LAMBDA_ARN="${var.lambda_arn}"}) : var.sfn_def
}

output "definition" {
  value = aws_sfn_state_machine.sfn_state_machine.definition
}