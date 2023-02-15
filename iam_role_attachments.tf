resource "aws_iam_role_policy_attachment" "lambda_pipeline_trigger_custom" {
  role       = module.base.lambda_service_role.name
  policy_arn = aws_iam_policy.lambda_pipeline_trigger_custom.arn
}
