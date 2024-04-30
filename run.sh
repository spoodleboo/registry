#!/bin/sh
exec 2>&1
exposed_ports="5000:5000"
runtime=$(which docker||echo "Docker not installed")
my_name=$(pwd|sed 's/.*\///g')

exec ${runtime} run \
       	$(for port_set in ${exposed_ports}; do echo "-p ${port_set}"; done)\
	--name ${my_name} ${my_name}:latest
