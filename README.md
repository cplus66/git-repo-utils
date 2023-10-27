# Git Server Repositories Utilities 

## Create Git repository

```
$ sudo adduser git
$ su git
$ cd
$ mkdir .ssh
```

# Import developer's ssh certification
```
$ cat /tmp/id_rsa.john.pub >> ~/.ssh/authorized_keys
```

## Start Git Web service

```
/usr/bin/docker run -d --name repoweb \
-e PROJECTROOT=/var/lib/git \
-e PROJECTS_LIST=/var/lib/git/projects.list \
-v /home/git:/var/lib/git:ro \
-p 172.17.4.18:8080:80 \
mlan/gitweb
```
where 172.17.4.18 is git server ip and 8080 is gitweb service port.

## Clone projects from local repository or remote Git server to local Git repositories

```
git clone --bare my_project my_project.git
git clone --bare https://github.com/Tianxiaomo/pytorch-YOLOv4 pytorch-YOLOv4.git
```

## Create a new project on Git server

STEP#1 (gh repo create)
```
$ mkdir /home/git/${PROJECT}.git
$ cd /home/git/${PROJECT}.git
$ git init --bare
```
STEP#2
modify /home/git/projects.list
```
echo ${PROJECT}.git >> /home/git/projects.list
```

STEP#3
edit description ${PROJECT}.git/description

## Adding a local repository to Git server

```
$ cd myproject
$ git init
$ git add .
$ git commit -m 'initial commit'
$ git remote add origin git@172.17.4.18:project.git
$ git remote -v
$ git push origin master
$ git branch --set-upstream-to=origin/master master
```
where git@172.17.4.18:project.git is REMOTE-URL
