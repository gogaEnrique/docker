FROM debian
MAINTAINER Enrique Gonzalez <goga.enrique@gmail.com>

# set environment
ENV DISPLAY=":1"
ENV PATH=".:$PATH"

# copy files
COPY m2s mwb2sql.sh /opt/

# install necessary packages
RUN apt-get update && apt-get install -q=2 --no-install-recommends \
    mysql-workbench \
    xvfb \
    && rm -rf /var/lib/apt/lists/*

# set mwb2swl
RUN chmod u+x /opt/mwb2sql.sh /opt/m2s

WORKDIR /data

# set entrypoint
ENTRYPOINT ["/opt/m2s"]
