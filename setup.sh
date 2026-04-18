#!/bin/bash

# Load credentials
source openrc admin admin

# Create VMs
openstack server create --flavor m1.small --image cirros --network private vm1
openstack server create --flavor m1.small --image cirros --network private vm2
openstack server create --flavor m1.small --image cirros --network private vm3

# Show status
openstack server list
