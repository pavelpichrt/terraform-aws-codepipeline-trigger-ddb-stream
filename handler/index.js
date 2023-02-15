// Always available ENV vars: PIPELINE_NAME

const AWS = require('aws-sdk');
const codepipeline = new AWS.CodePipeline();

exports.handler = async () => {
  const { PIPELINE_NAME } = process.env;

  const { pipelineExecutionId } = await codepipeline
    .startPipelineExecution({
      name: PIPELINE_NAME,
    })
    .promise();

  console.log(`Pipeline started, execution id: ${pipelineExecutionId}!`);

  return;
};
