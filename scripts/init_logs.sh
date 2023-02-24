
#! /bin/bash
cd "${0%/*}"
source ../.env

mkdir $LOGDIR
touch $LOGDIR/access.log  
touch $LOGDIR/authelia.log  
touch $LOGDIR/traefik.log