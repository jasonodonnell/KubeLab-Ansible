#!/bin/bash

export GOPATH=$HOME/cdev
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
export CCP_BASEOS=centos7
export CCP_PGVERSION=11
export CCP_PG_FULLVERSION=11.1
export CCP_VERSION=2.3.0
export CCP_IMAGE_PREFIX=crunchydata
export CCP_IMAGE_TAG=$CCP_BASEOS-$CCP_PG_FULLVERSION-$CCP_VERSION
export CCPROOT=$GOPATH/src/github.com/crunchydata/crunchy-containers
export CCP_CLI=kubectl
export CCP_NAMESPACE=demo
export CCP_STORAGE_MODE=ReadWriteOnce
export CCP_STORAGE_CAPACITY=400M
export CCP_STORAGE_CLASS=hostpath-sc
export REPLACE_CCP_IMAGE_PREFIX=crunchydata

go get github.com/blang/expenv
# kubectl create namespace demo
# kubectl config set-context $(kubectl config current-context) --namespace=demo
