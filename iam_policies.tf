resource "random_string" "name_unique_suffix" {
  length  = 6
  lower   = true
  special = false
  numeric = false
  upper   = false
}

data "aws_iam_policy_document" "lambda_pipeline_trigger_custom" {
  statement {
    effect = "Allow"

    actions = [
      "dynamodb:DescribeStream",
      "dynamodb:GetRecords",
      "dynamodb:GetShardIterator",
      "dynamodb:ListStreams",
      "dynamodb:ListShards"
    ]

    resources = [
      "${var.ddb_table.arn}/stream/*",
    ]
  }
}

resource "aws_iam_policy" "lambda_pipeline_trigger_custom" {
  name   = "cp-trigger-lambda-ddb-${random_string.name_unique_suffix.result}"
  policy = data.aws_iam_policy_document.lambda_pipeline_trigger_custom.json
}
