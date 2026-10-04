# Create New cgroup for this application
#!/bin/bash
echo "Creating new cgroup for this application"
read -p "Enter cgroup name: " cgroup_name
mkdir -p /sys/fs/cgroup/cpu/$cgroup_name
# check what are the cgroups available
echo "Available cgroups:"
ls /sys/fs/cgroup/cpu/$cgroup_name
# assing application to the cgroup
echo "assing applcation cpu and memory limit"
read -p "Enter CPU limit (in percentage): " cpu_limit
read -p "Enter Memory limit (in bytes): " memory_limit
echo $cpu_limit > /sys/fs/cgroup/cpu/$cgroup_name/cpu.cfs_quota_us
echo $memory_limit > /sys/fs/cgroup/memory/$cgroup_name/memory.limit_in_bytes
echo "Application assigned to cgroup $cgroup_name with CPU limit $cpu_limit% and Memory limit $memory_limit bytes"
# add the application to the cgroup
read -p "Enter the PID of the application to assign to this cgroup: " app_pid
echo $app_pid > /sys/fs/cgroup/cpu/$cgroup_name/tasks
