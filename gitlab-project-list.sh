#!/bin/bash

GIT_BACKUP_HOME=$(dirname $0)
GITLAB_KEY=$(cat ~/.ssh/gitlab-api-key)
TMP_JSON=$GIT_BACKUP_HOME/data/projects.json
PROJECT_LIST=$GIT_BACKUP_HOME/data/gitlab.txt

rm -f $PROJECT_LIST

for ((i=0;;i++)); do
  curl --insecure https://172.17.4.45/api/v4/projects?private_token=${GITLAB_KEY}\&per_page=100\&page=$i -o $TMP_JSON

  cat $TMP_JSON | jq '.[] | .path_with_namespace' | tee -a $PROJECT_LIST

  num=$(cat $TMP_JSON | jq | grep path_with_namespace | wc | awk '{print $1}')
  if [ $num -ne 100 ]; then
    break
  fi
done

sed -e 's/\"//g' $PROJECT_LIST | grep isystem-esg-linux-bsp | sort | cut -c 23- | tee ${PROJECT_LIST}.sort
mv ${PROJECT_LIST}.sort $PROJECT_LIST
