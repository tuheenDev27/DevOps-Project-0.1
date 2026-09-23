#  this script help to delete that no need 
#!/bin/bash
echo "this  script will help to delete the user and group which is no need"
# delete user from the system
read -p "Enter the username to delete: " deluser
sudo userdel -r $deluser
# delete group from the system
read -p "Enter the group name to delete: " delgroup
sudo groupdel $delgroup
