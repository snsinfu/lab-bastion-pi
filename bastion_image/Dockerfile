FROM alpine:3.8

RUN apk add --no-cache openssh-server-pam openssh-client mosh \
 && ssh-keygen -A \
 && addgroup ssh_users

COPY init.sh /root/
COPY motd /etc/
COPY sshd_config /etc/ssh/
COPY profile /etc/skel/.profile

VOLUME /srv

ENTRYPOINT ["/root/init.sh"]
CMD ["/usr/sbin/sshd", "-D", "-e"]
