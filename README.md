# Fault Tolerance in OpenStack (DevStack)

## Project Role

Person 1 – Setup & VM Creation

##  Objective

To implement a simple fault tolerance mechanism in OpenStack by detecting failed virtual machines and recovering them using restart/rebuild operations.

---

##  Technologies Used

* Ubuntu (WSL)
* OpenStack (DevStack)
* OpenStack CLI
* Python (for automation)

---

##  Setup Instructions

### Step 1: Install DevStack

```bash
git clone https://opendev.org/openstack/devstack
cd devstack
./stack.sh
```

---

### Step 2: Load OpenStack Credentials

```bash
source openrc admin admin
```

---

##  VM Creation

```bash
openstack server create --flavor m1.small --image cirros --network private vm1
openstack server create --flavor m1.small --image cirros --network private vm2
openstack server create --flavor m1.small --image cirros --network private vm3
```

Check:

```bash
openstack server list
```

Expected:

* Status = ACTIVE

---

##  Failure Simulation

```bash
openstack server stop vm1
openstack server reboot --hard vm1
```

---

##  Recovery

```bash
openstack server start vm1
openstack server rebuild vm1
```

---

##  Automation Script

Run:

```bash
python3 auto_fix.py
```

---

##  Implementation Summary

We implemented a simple fault tolerance mechanism in OpenStack where VM failures were simulated using stop and reboot operations. Failed VMs were detected using status monitoring and recovered using restart and rebuild operations. A Python script was used to continuously verify VM states and automatically recover non-active instances.

---

##  Outcome

* VM failure detected
* VM successfully recovered
* System remains consistent (no SHUTOFF/ERROR state)

---

## Team Contribution

* Person 1: Setup, DevStack installation, VM creation
* Person 2: Failure simulation and recovery
* Person 3: Automation and verification

---
