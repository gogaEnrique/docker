FROM debian
MAINTAINER Enrique Gonzalez <goga.enrique@gmail.com>

#RUN adduser --system --no-create-home --shell /etc _pure-ftpd --force-badname --disabled-password \
#    && addgroup _pure-ftpd --force-badname \
#    && adduser _pure-ftpd _pure-ftpd \
#    && mkdir /etc/pureftpd

#RUN apt-get update \
#    && apt-get install -y pure-ftpd

# properly setup debian sources
ENV DEBIAN_FRONTEND noninteractive
RUN echo "deb http://http.debian.net/debian jessie main\n\
deb-src http://http.debian.net/debian jessie main\n\
deb http://http.debian.net/debian jessie-updates main\n\
deb-src http://http.debian.net/debian jessie-updates main\n\
deb http://security.debian.org jessie/updates main\n\
deb-src http://security.debian.org jessie/updates main\n\
" > /etc/apt/sources.list
RUN apt-get -y update

# install package building helpers
RUN apt-get -y --force-yes install dpkg-dev debhelper

# install dependancies
RUN apt-get -y build-dep pure-ftpd

# build from source
RUN mkdir /tmp/pure-ftpd/ && \
  cd /tmp/pure-ftpd/ && \
  apt-get source pure-ftpd && \
  cd pure-ftpd-* && \
  sed -i '/^optflags=/ s/$/ --without-capabilities/g' ./debian/rules && \
  dpkg-buildpackage -b -uc

# install the new deb files
RUN dpkg -i /tmp/pure-ftpd/pure-ftpd-common*.deb
RUN apt-get -y install openbsd-inetd
RUN dpkg -i /tmp/pure-ftpd/pure-ftpd_*.deb

# Prevent pure-ftpd upgrading
RUN apt-mark hold pure-ftpd pure-ftpd-common

# setup ftpgroup and ftpuser
RUN groupadd -g 1007 ftpgroup
RUN useradd -u 1007 -g ftpgroup -d /home/ftpusers -s /dev/null ftpuser



COPY auth.sh /usr/local/bin/auth
COPY dkr-init.sh /usr/local/sbin/dkr-init

ENTRYPOINT ["/usr/local/sbin/dkr-init"]
