module "base" {
  source = "pavelpichrt/codepipeline-trigger-base/aws"

  type                       = "ddb"
  codepipeline_name          = var.codepipeline_name
  handler_implementation_dir = "${path.module}/handler"
}
