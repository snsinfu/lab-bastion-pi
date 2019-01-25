#!/bin/sh -eu

# Set up network. Note: Docker owns /etc/hosts and /etc/resolv.conf and we
# cannot use cp to overwrite them. Cat works.
cat /srv/hosts > /etc/hosts
cat /srv/resolv.conf > /etc/resolv.conf

# Create users
for user in $(ls -1 /srv/users); do
    adduser -D -s /bin/sh ${user} || true
    addgroup ${user} ssh_users

    srcdir="/srv/users/${user}"
    sshdir="/home/${user}/.ssh"

    install -o ${user} -g ${user} -m 0700 -d "${sshdir}"
    install -o ${user} -g ${user} -m 0600 "${srcdir}/authorized_keys" "${sshdir}"
done

# Execute Docker CMD
exec "$@"
