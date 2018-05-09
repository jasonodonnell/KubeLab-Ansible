#!/bin/bash

set -u

rm -f ./keys/id_rsa ./keys/id_rsa.pub
rm -f ./keys/heketi ./keys/heketi.pub

ssh-keygen -b 2048 -t rsa -f ./keys/id_rsa -q -N ""
cp ./keys/id_rsa.pub ./roles/common/files/authorized_keys
cp ./keys/id_rsa ./roles/common/files/id_rsa

ssh-keygen -b 2048 -t rsa -f ./keys/heketi -q -N ""
cp ./keys/heketi.pub ./roles/heketi-base/files/authorized_keys
cp ./keys/heketi ./roles/heketi-base/files/heketi

chmod 400 ./keys/id_rsa*

exit 0
