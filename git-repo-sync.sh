#!/bin/bash -xe
#
GIT_DIR=/home/git
LOG=${GIT_DIR}/log/or_$(date +%F).log

cd $GIT_DIR

for i in $(cat projects.list); do
  echo $i | tee -a $LOG
  cd $i
  git fetch | tee -a $LOG
  cd ..
done
