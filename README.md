# docker-glances
`sudo docker rm -f glances ; sudo docker run -d --restart="always" --net host --pid host -e TZ=Europe\Prague --name=glances -v /var/run/docker.sock:/var/run/docker.sock:ro -p 61208-61209:61208-61209 glances`
