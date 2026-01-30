#!/bin/bash

GIT_HOME=/home/gitlab
GITLAB_BACKUP_PRJ_HOME=$(dirname $0)
PRJ_LIST=$GITLAB_BACKUP_PRJ_HOME/data/gitlab.txt

# Retrieve the project list to $PRJ_LIST or data/gitlab.txt
$GITLAB_BACKUP_PRJ_HOME/gitlab-project-list.sh

# List changed project list
LIST=$(cat $PRJ_LIST)

# Clone if the repositories doesn't exist.
cd $GIT_HOME

for i in $LIST; do
  if [ ! -d ${i}.git ]; then
    $GIT_HOME/git-repo-utils/git-repo-gitlab-clone.sh git@172.17.4.45:isystem-esg-linux-bsp/${i}.git
  fi
done

# Sync gitlab
$GIT_HOME/git-repo-utils/git-repo-gitlab-sync.sh
