#!/bin/bash -xe
#
GIT_DIR=/home/git
LOG=${GIT_DIR}/log/git_sync_$(date +%F).log

cd $GIT_DIR

for i in $(cat projects.list); do
  echo $i | tee -a $LOG
  cd $i
  git fetch 2>&1 | tee -a $LOG
  cd ..
done
