#!/bin/bash -xe

LIST=$(cat bitbucket.txt)

for i in $LIST; do
  REP=$(echo $i | sed 's/\r$//g')
  if [ ! -f ${REP}.git ]; then
    ~/git-repo-utils/git-repo-clone.sh git@bitbucket.org:advantechisg/$REP.git
  fi
done
