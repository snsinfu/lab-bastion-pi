#!/bin/sh -eu

# Set up network. Note: Docker owns /etc/hosts and /etc/resolv.conf and we
# cannot use cp to overwrite them. Cat works.
cat /srv/hosts > /etc/hosts
cat /srv/resolv.conf > /etc/resolv.conf

# Create users.
rmdir /home
ln -s /srv/users /home

for user in $(ls /home); do
    adduser -D -s /bin/sh ${user}
    addgroup ${user} ssh_users

    [ -f /home/${user}/.profile ] || cp /etc/skel/.profile /home/${user}

    chown -R ${user}:${user} /home/${user}
done

# Execute Docker CMD.
exec "$@"
