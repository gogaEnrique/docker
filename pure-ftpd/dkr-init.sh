#!/bin/sh

set -e
set -x

/usr/sbin/pure-authd -s /var/run/ftpd.sock -r /usr/local/bin/auth &
sleep 1
# -j Create home directories
# -A Chroot
#* -B Daemonize
# -E Do not allow anonymous access
#* -k 95 Do not allow ftp users to write on disk once it is at 95%
# -l extauth:/var/run/ftpd.sock External auth
# -p XXXX:YYYY Passive ports, then -c option is YYYY+1 - XXXX /2
# -r Do not allow to override files, they are renamed
# -R Do not allow users to execute CHMOD
# -U 177:077 Masks fro files and dirs permissions
# -Y 3 SSL/TLS 
# -Z Prevent users to do stupid things (like chmod 0 on their own files)

exec /usr/sbin/pure-ftpd -j -A -E -l "extauth:/var/run/ftpd.sock" -p 30000:30009 -R -U 177:077 -Z
