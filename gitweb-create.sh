#!/bin/bash
/usr/bin/docker run \
	-d \
	--restart unless-stopped \
	--name repoweb \
	-e PROJECTROOT=/var/lib/git \
	-e PROJECTS_LIST=/var/lib/git/projects.list \
	-v /home/git:/var/lib/git:ro \
	-v /etc/localtime:/etc/localtime:ro \
	-p 0.0.0.0:8081:80 \
	--health-cmd="nginx -t &>/dev/null && wget -q -O - 127.0.0.1:80 &>/dev/null || exit 1" \
	--health-interval=30s \
	--health-timeout=5s \
	mlan/gitweb

#/usr/bin/docker update --restart unless-stopped repoweb
