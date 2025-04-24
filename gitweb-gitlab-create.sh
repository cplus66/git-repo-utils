/usr/bin/docker run \
	-d \
	--name repoweb-gitlab \
	-e PROJECTROOT=/var/lib/git \
	-e PROJECTS_LIST=/var/lib/git/projects.list \
	-v /home/gitlab:/var/lib/git:ro \
	-v /etc/localtime:/etc/localtime:ro \
	-p 8082:80 \
	mlan/gitweb

