# Fault Tolerance in OpenStack (Complete Setup Guide)

## 👤 Purpose

This guide allows any team member to set up OpenStack from scratch and continue the project.

---

##  System Requirements (IMPORTANT)

* RAM: Minimum 8GB (16GB recommended)
* Storage: 20GB free
* OS: Windows with WSL OR Ubuntu Linux

---

##  STEP 1: Install WSL + Ubuntu (Windows only)

Open PowerShell as Administrator:

```bash
wsl --install
```

Restart system.

Then install Ubuntu from Microsoft Store.

---

##  STEP 2: Open Ubuntu Terminal

Search "Ubuntu" → open it.

Update system:

```bash
sudo apt update && sudo apt upgrade -y
```

---

##  STEP 3: Install Required Dependencies

```bash
sudo apt install -y git python3-pip
```

---

##  STEP 4: Install OpenStack (DevStack)

```bash
git clone https://opendev.org/openstack/devstack
cd devstack
```

Create config file:

```bash
nano local.conf
```

Paste:

```
[[local|localrc]]
ADMIN_PASSWORD=admin
DATABASE_PASSWORD=admin
RABBIT_PASSWORD=admin
SERVICE_PASSWORD=admin
```

Save and exit.

Now run:

```bash
./stack.sh
```

⏳ This will take 20–40 minutes.

---

##  STEP 5: Load OpenStack Environment

```bash
source openrc admin admin
```

---

##  STEP 6: Verify Installation

```bash
openstack service list
```

If services appear → setup successful.

---

##  STEP 7: Verify Image, Network, Flavor

```bash
openstack image list
openstack network list
openstack flavor list
```

Ensure:

* Image: cirros
* Network: private
* Flavor: m1.small

---

##  STEP 8: Create Virtual Machines

```bash
openstack server create --flavor m1.small --image cirros --network private vm1
openstack server create --flavor m1.small --image cirros --network private vm2
openstack server create --flavor m1.small --image cirros --network private vm3
```

---

##  STEP 9: Verify VMs

```bash
openstack server list
```

Expected:

* All VMs should be in **ACTIVE** state

---

##  STEP 10: If VM is NOT ACTIVE

Start it:

```bash
openstack server start vm1
```

Or rebuild:

```bash
openstack server rebuild vm1
```

---

##  NEXT (Person 2 Work)

You will:

1. Simulate failure
2. Detect failure
3. Recover VMs

Commands:

```bash
openstack server stop vm1
openstack server reboot --hard vm1
openstack server start vm1
openstack server rebuild vm1
```

---

##  PROJECT SUMMARY

We implemented a fault tolerance mechanism where:

* VM failures are simulated
* System detects non-active states
* Recovery actions restore VM to ACTIVE

---

##  NOTE

Each team member must run this setup locally.
VMs are not shared across systems.
