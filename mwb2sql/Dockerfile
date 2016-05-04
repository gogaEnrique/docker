FROM debian
MAINTAINER Enrique Gonzalez <goga.enrique@gmail.com>

# set environment
ENV DISPLAY=":1"
ENV PATH=".:$PATH"

# install necessary packages
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y git \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    mysql-workbench \
    xvfb \
    && rm -rf /var/lib/apt/lists/*

# set mwb2swl
WORKDIR /opt
RUN git clone https://github.com/tomoemon/mwb2sql.git \
    && chmod u+x /opt/mwb2sql/mwb2sql.sh
COPY m2s /opt/
RUN chmod u+x /opt/m2s

WORKDIR /data

# set entrypoint
ENTRYPOINT ["/opt/m2s"]
