#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "No arguments supplied. Please specify at least app to deploy followed by optional parameters"
    echo "Example usage: 'npm run deploy STAGE"
    echo "- STAGE: dev|ci|stable|production"
    exit 0
fi

FUNCTION=""
STAGE=$1

if [ $STAGE != "dev" ] && [ $STAGE != "ci" ] && [ $STAGE != "stable" ] && [ $STAGE != "production" ]; then
    echo "Invalid environment '$STAGE'. Please specify dev, ci, stable or production."
    echo "Example: 'npm run deploy dev workflowsLite'"
    exit 0
fi

echo "Deploying..."
DEPLOY_COMMAND="deploy -v --aws-profile aws-${STAGE} --stage ${STAGE} --product ${APP} ${FUNCTION}"
echo "Executing: serverless ${DEPLOY_COMMAND}"
serverless ${DEPLOY_COMMAND}
