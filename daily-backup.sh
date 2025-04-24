#!/bin/bash

GIT_HOME=/home/git

# List changed project list
LIST=$(cat data/bitbucket.txt)

# Clone if the repositories doesn't exist.
cd $GIT_HOME

for i in $LIST; do
  if [ ! -d ${i}.git ]; then
    $GIT_HOME/git-repo-utils/git-repo-clone.sh git@bitbucket.org:advantechisg/${i}.git
  fi
done
