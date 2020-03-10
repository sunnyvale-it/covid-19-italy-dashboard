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
ADD load-data.sh /load-data.sh

 
RUN chmod +x /run.sh /entrypoint.sh /load-data.sh

ENTRYPOINT /entrypoint.sh