FROM alpine:3.3
MAINTAINER Enrique Gonzalez <goga.enrique@gmail.com>

ENV PUREFTPD_VERSION=1.0.42-r0 \
    SYSLOG_STDOUT_VERSION=1.1.1 \
    PURE_CONFDIR=/etc/pureftpd

RUN url_join() { local pifs="${IFS}"; IFS=/; echo "$*"; IFS="${pifs}"; } \
    && printf '%s\n' \
      '@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing' \
      >> /etc/apk/repositories \
    && apk update \
    && apk add pure-ftpd@testing="${PUREFTPD_VERSION}" \
    && apk add curl=7.49.1-r0 \
    && apk add python=2.7.12-r0
    && install -d -o root -g root -m 755 /usr/local/sbin \
    && curl -ksL \
      "$(url_join \
        https://github.com/timonier/syslog-stdout/releases/download \
        "v${SYSLOG_STDOUT_VERSION}" \
        syslog-stdout.tar.gz)" \
      |tar -xvzf - -C /usr/local/sbin \
    && apk del --purge curl \
    && rm -rf /var/cache/apk/*

# user ftpv and /srv/ftp for virtual users, user ftp and /var/lib/ftp
# for anonymous; these are separate so anonymous cannot read/write
# virtual users' files (if both enabled)
RUN adduser -D -h /dev/null -s /etc ftpv \
    && install -d -o root -g root -m 755 ~ftp /srv/ftp

COPY pure_defaults.sh /etc/profile.d/
COPY dkr-init.sh /usr/local/sbin/dkr-init
COPY adduser-ftp.sh /usr/local/bin/adduser-ftp
COPY mog-auth.py /usr/local/bin/mog-auth.py

ENTRYPOINT ["/usr/local/sbin/dkr-init"]
