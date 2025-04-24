#!/bin/bash -xe
#
GIT_DIR=/home/gitlab
LOG=${GIT_DIR}/log/git_gitlab_sync_$(date +%F).log

mkdir -p $GIT_DIR/log

date | tee -a $LOG
source $GIT_DIR/git-repo-utils/git-env

cd $GIT_DIR
for i in $(cat projects.list); do
  echo $i | tee -a $LOG
  cd $i
  git fetch 2>&1 | tee -a $LOG
  git remote update 2>&1 | tee -a $LOG
  cd ..
done
