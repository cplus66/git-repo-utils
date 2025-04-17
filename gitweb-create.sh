#!/bin/bash
/usr/bin/docker run \
	-d \
	--name repoweb \
	-e PROJECTROOT=/var/lib/git \
	-e PROJECTS_LIST=/var/lib/git/projects.list \
	-v /home/git:/var/lib/git:ro \
	-v /etc/localtime:/etc/localtime:ro \
	-p 8081:80 \
	mlan/gitweb

#/usr/bin/docker update --restart unless-stopped repoweb
