# interrobangc/ansible

Ansible on CentOS 7 with SystemD

## Basic usage

Run ansible container
```
docker run --privileged --rm -d -e "container=docker"  -v /sys/fs/cgroup:/sys/fs/cgroup:ro --tmpfs /run --tmpfs /run/lock interrobangc/ansible
```
