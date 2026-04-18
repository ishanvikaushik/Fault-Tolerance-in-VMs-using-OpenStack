#!/bin/bash

# Simulate failure
openstack server stop vm1

# Check status
openstack server list

# Recover VM
openstack server start vm1

# Verify
openstack server show vm1
