#!/bin/bash

set -e

user=root

if [ -n "${runas}" ]
then
   runas_uid=$(echo "${runas}" | cut -d ":" -f1)
   runas_gid=$(echo "${runas}" | cut -d ":" -f2)
   sudo groupadd -g "${runas_gid}" user
   sudo useradd -d "/home/user" -u "${runas_uid}" -g "${runas_gid}" -s "/bin/bash" user
   if [ ! -d "/home/user" ]
   then
      mkdir "/home/user"
      chown ${runas_uid}:${runas_gid} "/home/user"
   fi

   user="user"
fi

exec sudo -u "${user}" --preserve-env=DISPLAY "${@}"
