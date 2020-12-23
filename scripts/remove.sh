#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "No arguments supplied. Please specify dev, ci, stable or production."
    exit 0
fi

ENV=${@: -2:1}
PROD=${@: -1}

if [ $ENV != "dev" ] && [ $ENV != "ci" ] && [ $ENV != "stable" ] && [ $ENV != "production" ]; then
    echo "Invalid environment. Please specify dev, ci, stable or production."
    exit 0
fi

if [ "$PROD" == "" ] || ([ $PROD != "workflowsLite" ] && [ $PROD != "workflows" ]); then
    echo "Invalid product. Please specify workflowsLite, workflows."
    exit 0
fi


serverless remove -v --stage $ENV --product $PROD