# vim:set ft=dockerfile:

FROM ubuntu:14.04
MAINTAINER Jason Smith <jason@smithss.org>

ENV APPDIR /app
WORKDIR $APPDIR

RUN apt-get update && apt-get install -y \
      unzip \
      tmux \
      wget \
      telnet

# wget consul
ENV CONSULVER 0.5.2_linux_amd64
ENV CONSULURL https://dl.bintray.com/mitchellh/consul/$CONSULVER.zip 
RUN wget $CONSULURL -O consul-$CONSULVER.zip && \
    unzip consul-$CONSULVER.zip && \
    rm consul-$CONSULVER.zip

# environment variables
#ENV PATH ${PATH}:$APPDIR/bin
#ENV RERUN_MODULES /usr/lib/rerun/modules
#ENV RERUN_COLOR true

#Open Consul ports
EXPOSE 8300 8301 8302 8400 8500 8600
WORKDIR $APPDIR

CMD []
