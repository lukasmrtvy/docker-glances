FROM alpine:latest

ENV GLANCES_OPT -w

ENV UID 1000
ENV USER htpc
ENV GROUP htpc

ENV GLANCES_VERSION 2.11

RUN addgroup -S ${GROUP} && adduser -D -S -u ${UID} ${USER} ${GROUP} && \
    apk update && apk upgrade && apk add --no-cache --virtual build-dependencies py2-pip py2-psutil gcc musl-dev python-dev linux-headers && \
    pip install --upgrade pip && \
    pip install glances==${GLANCES_VERSION} \
                psutil \
                netifaces \
                bottle \
                hddtemp \ 
                docker \ 
                py-cpuinfo && \
    apk del build-dependencies

ADD glances.conf  /opt/glances/

WORKDIR /opt/glances

EXPOSE 61209
EXPOSE 61208

LABEL name=glances
LABEL version=${GLANCES_VERSION}
LABEL url=https://api.github.com/repos/nicolargo/glances/releases/latest

USER ${USER}

ENTRYPOINT python -m glances -C /opt/glances/glances.conf $GLANCES_OPT
