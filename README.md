# Lab bastion server

Dockerized ssh/mosh bastion server on raspberry pi, via reverse tunnel gateway
server on the public internet.

```
ansible-playbook provision_system.yml
ansible-playbook provision_user.yml
```

## Customization

You need to modify the IP address of the raspberry pi in `hosts.ini` file.
Change `provate_key_file` in `ansible.cfg` if your SSH key is not
`~/.ssh/id_ed25519`. Also, create these files before provisioning
`provision_user.yml`:

```
config/hosts
config/resolv.conf
config/rtun.yml
```

rtun.yml is (reverse tunnel agent)[https://github.com/snsinfu/reverse-tunnel]
configuration.
