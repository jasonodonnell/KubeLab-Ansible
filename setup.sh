#!/bin/bash

set -u

if [[ -f ./keys/id_rsa ]]
then
    rm -f ./keys/id_rsa
    rm -f ./keys/id_rsa.pub
fi

ssh-keygen -b 2048 -t rsa -f ./keys/id_rsa -q -N ""
chmod 400 ./keys/id_rsa*
cp ./keys/id_rsa.pub ./roles/common/files/authorized_keys
cp ./keys/id_rsa ./roles/common/files/id_rsa

exit 0
