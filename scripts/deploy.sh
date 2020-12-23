#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "No arguments supplied. Please specify at least app to deploy followed by optional parameters"
    echo "Example usage: 'npm run deploy APP STAGE [FUNCTION]"
    echo "- APP: workflowsLite|workflows"
    echo "- STAGE: dev|ci|stable|production"
    echo "- FUNCTION (Optional): --scheduler --poller"
    exit 0
fi

FUNCTION=""
APP=$1
STAGE=$2

## Start - Input param validations ##
#####################################

if [ -z "$REDIS_URL" ]
then
  echo "Please provide the environment variable REDIS_URL"
  exit 0
fi

if [ $STAGE != "dev" ] && [ $STAGE != "ci" ] && [ $STAGE != "stable" ] && [ $STAGE != "production" ]; then
    echo "Invalid environment '$STAGE'. Please specify dev, ci, stable or production."
    echo "Example: 'npm run deploy dev workflowsLite'"
    exit 0
fi

if [ $APP == "" ] || ([ $APP != "workflowsLite" ] && [ $APP != "workflows" ]); then
    echo "Invalid product '$APP'. Please specify workflowsLite, workflows."
    echo "Example: 'npm run deploy dev workflowsLite'"
    exit 0
fi

## End - Input params validations ##
####################################

for var in "$@"
do
    case "$var" in
            --scheduler)
                FUNCTION="function --function scheduler"
                ;;
            --poller)
                FUNCTION="function --function poller"
                ;;
        esac
        shift
done

echo "Deploying..."
DEPLOY_COMMAND="deploy -v --aws-profile aws-${STAGE} --stage ${STAGE} --product ${APP} ${FUNCTION}"
echo "Executing: serverless ${DEPLOY_COMMAND}"
serverless ${DEPLOY_COMMAND}


echo ""
echo "Getting Scheduler info..."
echo ""

INFO=$(serverless info --stage $STAGE --product $APP)

re="POST - (.*)functions"
if [[ $INFO =~ $re ]]; then
    SCHEDULER_URL=${BASH_REMATCH[1]};
    echo "**************************************************************************************************************"
    echo "**************************************************************************************************************"
    echo "AWS_SCHEDULE_URL is -->  $SCHEDULER_URL"
    echo "**************************************************************************************************************"
    echo "**************************************************************************************************************"
else
    echo "Problem retrieving the info, execute 'serverless info --stage $STAGE --product $APP' for more info"
fi
