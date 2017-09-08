FROM alpine:latest

ENV GLANCES_OPT -w

RUN apk update && apk upgrade && apk add --no-cache --virtual build-dependencies py2-pip py2-psutil gcc musl-dev python-dev linux-headers

RUN pip install --upgrade pip && \
    pip install glances psutil netifaces glances bottle hddtemp docker py-cpuinfo && apk del build-dependencies

ADD glances.conf  /opt/glances/

WORKDIR /opt/glances

EXPOSE 61209

EXPOSE 61208

ENTRYPOINT python -m glances -C /opt/glances/glances.conf $GLANCES_OPT
