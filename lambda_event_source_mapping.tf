resource "aws_lambda_event_source_mapping" "pipeline_trigger_ddb" {
  event_source_arn  = var.ddb_table.stream_arn
  function_name     = module.base.lambda_function.arn
  starting_position = "LATEST"
}
