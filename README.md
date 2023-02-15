# AWS Codepipeline Trigger: DynamoDB Stream

Creates a lambda function connected to a DynamoDB event stream that triggers a specified Codepipeline.

## Usage

```terraform
resource "aws_dynamodb_table" "my_table" {
  name             = "my-table"
  billing_mode     = "PAY_PER_REQUEST"
  hash_key         = "XXX"
  range_key        = "YYY"
  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"

  point_in_time_recovery {
    enabled = true
  }

  # ...
}


module "my_pipeline_trigger" {
  source = "pavelpichrt/codepipeline-trigger-ddb-stream/aws"

  codepipeline_name = aws_codepipeline.master.name

  ddb_table = {
    arn        = aws_dynamodb_table.my_table.arn
    stream_arn = aws_dynamodb_table.my_table.stream_arn
  }
}
```
