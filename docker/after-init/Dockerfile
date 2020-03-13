FROM ubuntu:16.04
MAINTAINER Denis Maggiorotto

RUN apt-get update && \
    apt-get install -y curl


COPY entrypoint.sh /entrypoint.sh

RUN chmod a+x /entrypoint.sh

ENTRYPOINT /entrypoint.sh
