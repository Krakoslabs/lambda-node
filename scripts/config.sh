#!/bin/bash

## Script to configure AWS credentials so that they can be leveraged by serverless ##

if [ -z "$AWS_ACCESS_KEY_ID" ] && [ -z "$AWS_SECRET_ACCESS_KEY" ]
then
  if [ $# -ne 2 ]
    then
      echo "No AWS credentials supplied. Please specify the following as env variables or script parameters."
      echo "Example usage: 'npm run config AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY"
      exit 0
  fi
  AWS_ACCESS_KEY_ID=$1
  AWS_SECRET_ACCESS_KEY=$2
fi

echo "Setting config..."
if [ -z "${STAGE}" ]
then
  STAGE="dev"
fi
CONFIG_COMMAND="config credentials --profile aws-${STAGE} --provider aws --key ${AWS_ACCESS_KEY_ID} --secret ${AWS_SECRET_ACCESS_KEY} -o"
echo "Executing: serverless ${CONFIG_COMMAND}"
serverless ${CONFIG_COMMAND}



