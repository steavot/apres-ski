#!/bin/bash
# Script to allow user to run as the host user by passing
# their UID in as an environment variable.

if [ -n "$RUN_AS" ]
then
  sudo adduser -h /home/host-user -s /bin/bash -k /home/developer -u $RUN_AS -D host-user
  # host-user has already be added to sudoers in Dockerfile
  sudo su -c '/usr/bin/tmux' host-user
else
  /usr/bin/tmux
fi

