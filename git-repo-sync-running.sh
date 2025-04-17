#!/bin/bash -xe
#
GIT_DIR=/home/git
LOG=${GIT_DIR}/log/git_sync_running_$(date +%F).log

date | tee -a $LOG
source /home/git/git-repo-utils/git-env

cd $GIT_DIR
for i in $(cat projects_running.list); do
  echo $i | tee -a $LOG
  cd $i
  git fetch 2>&1 | tee -a $LOG
  git remote update 2>&1 | tee -a $LOG
  cd ..
done
