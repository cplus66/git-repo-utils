/usr/bin/docker run -d --name repoweb -e PROJECTROOT=/var/lib/git -e PROJECTS_LIST=/var/lib/git/projects.list -v /home/git:/var/lib/git:ro -p 172
.17.4.18:8080:80 mlan/gitweb
