# docker-glances

## Info:
Based on Alpine:latest

## Usage:
`sudo docker rm -f glances ; sudo docker run -d --restart="always" --net host --pid host -e TZ=Europe\Prague --name=glances -v /var/run/docker.sock:/var/run/docker.sock:ro -v glances:/config/ -p 61208-61209:61208-61209 lukasmrtvy/docker-glances`
