#!/bin/bash -xe
GIT_DIR=/home/git

cd $GIT_DIR

for i in $(cat projects.list); do
  echo $i
  cd $i
  git fetch
  cd ..
done
