# boot process management script
#!/bin/bash
echo "check total boot time"
systemd-analyze
echo "check boot time for each service"
systemd-analyze blame   
echo "generate a graphical representation of the boot process"
systemd-analyze plot > boot_process.svg
# check the critical chain of services that are required for the system to boot
systemd-analyze critical-chain
