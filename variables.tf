variable "codepipeline_name" {}

variable "ddb_table" {
  type = object({
    arn        = string
    stream_arn = string
  })
}
