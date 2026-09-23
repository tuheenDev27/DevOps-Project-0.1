# this script create new group and manage the group permission, access and maintain
#!/bin/bash
echo  " this script create group and manage the group permission, access and maintain"
# create group
echo "Enter the group name to create "
read groupname
sudo groupadd $groupname
# view the group detail if exist
echo "Enter the group name to view the details"
read viewgroup
getent group $viewgroup
# maintain group permission
echo "Enter the group name to manage permission"
read permgroup
echo "Enter the permission to set for the group $permgroup"
read permission
chmod $permission $permgroup
