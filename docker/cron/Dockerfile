FROM ubuntu:16.04
MAINTAINER Denis Maggiorotto

# Install cron
RUN apt-get update && \
    apt-get install -y cron && \
    apt-get install -y postgresql-client && \
    apt-get install -y curl && \
    apt-get install -y dateutils

# Add files
ADD run.sh /run.sh
ADD entrypoint.sh /entrypoint.sh



RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive && \
    apt-get install -y tzdata
    
ENV TZ=Europe/Rome

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN dpkg-reconfigure --frontend noninteractive tzdata

 
RUN chmod +x /run.sh /entrypoint.sh

ENTRYPOINT /entrypoint.sh