#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "No arguments supplied. Please specify dev, ci, stable or production."
    exit 0
fi

serverless remove -v --aws-profile aws-$STAGE --stage $STAGE
