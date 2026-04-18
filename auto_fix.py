import subprocess
import time

def fix_vm(vm):
    status = subprocess.getoutput(f"openstack server show {vm} -f value -c status")
    
    if status != "ACTIVE":
        print(f"{vm} is {status}, fixing...")
        subprocess.run(f"openstack server start {vm}", shell=True)

while True:
    fix_vm("vm1")
    fix_vm("vm2")
    fix_vm("vm3")
    time.sleep(10)
