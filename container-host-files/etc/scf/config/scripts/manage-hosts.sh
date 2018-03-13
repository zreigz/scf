#!/bin/bash

HOST_ADDR=${HOST_ADDR:-"10.0.0.4"}
UAA_HOSTNAME=""

if [ -z ${UAA_HOST} ]
 then
        UAA_HOSTNAME="uaa.cf.svc.cluster.local"
 else
        UAA_HOSTNAME="cf.${UAA_HOST}"
fi

HOSTS_LINE="$HOST_ADDR    $UAA_HOSTNAME"
sudo -- /bin/bash -c -e "echo '$HOST_ADDR    cf.uaa.uaa.svc.cluster.local' >> /etc/hosts";
sudo -- /bin/bash -c -e "echo '$HOST_ADDR    cf.login.cf.svc.cluster.local' >> /etc/hosts";
sudo -- /bin/bash -c -e "echo '$HOST_ADDR    tcp.cf.svc.cluster.local' >> /etc/hosts";

echo "The entry $HOSTS_LINE added to /etc/hosts"
