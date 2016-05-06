FROM debian
MAINTAINER Enrique Gonzalez <goga.enrique@gmail.com>

# set environment
ENV DISPLAY=":1"
ENV PATH=".:$PATH"

# copy files
COPY run.sh mwb2sql.sh /opt/

# install necessary packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    mysql-workbench \
    xvfb \
    && rm -rf /var/lib/apt/lists/*

# set permissions
RUN chmod +x /opt/mwb2sql.sh /opt/run.sh

WORKDIR /data

# set entrypoint
ENTRYPOINT ["/opt/run.sh"]
