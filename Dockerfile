FROM alpine:latest
ADD consul /usr/bin
RUN sed -i -e s/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/ /etc/apk/repositories
RUN apk add --no-cache curl python3-dev nginx uwsgi
RUN python3.5 -m pip install -U pip requests flask
