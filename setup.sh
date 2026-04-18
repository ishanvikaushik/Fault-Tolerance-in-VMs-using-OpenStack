#!/bin/bash

echo "Loading OpenStack credentials..."
source openrc admin admin

echo "Creating VMs..."

openstack server create --flavor m1.small --image cirros --network private vm1
openstack server create --flavor m1.small --image cirros --network private vm2
openstack server create --flavor m1.small --image cirros --network private vm3

sleep 5

echo "Checking VM status..."
openstack server list
