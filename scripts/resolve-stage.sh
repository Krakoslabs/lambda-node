#!/bin/bash

if [ -z "$STAGE" ]
then
  # If not provided then resolve the stage by checking current branch name
  GIT_WORKING_BRANCH=`git rev-parse --abbrev-ref HEAD`
  echo "Current GIT branch: $GIT_WORKING_BRANCH"

  if [ "develop" = $GIT_WORKING_BRANCH ]
  then
      STAGE="ci"
  elif [[ "$GIT_WORKING_BRANCH" =~ ^release/.*$ ]]
  then
      STAGE="stable"
  elif [ "master" = $GIT_WORKING_BRANCH ]
  then
      STAGE="production"
  else
      STAGE="dev"
  fi

  export STAGE="$STAGE"
fi

echo "STAGE resolution is: $STAGE"
# Stores the value in a file so that it can be used by a parent script
echo $STAGE > ./stage.tmp
