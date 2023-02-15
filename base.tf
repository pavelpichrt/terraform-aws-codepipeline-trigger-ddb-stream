module "base" {
  source = "pavelpichrt/codepipeline-trigger-base/aws"

  type              = "ddb"
  codepipeline_name = var.codepipeline_name
  handler_zip_dir   = "${path.module}/handler"
}
