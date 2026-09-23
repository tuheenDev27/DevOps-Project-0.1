# user creatteation script where we create user ,  manage users permission, access and maintain 
#!/bin/bash
echo  "this script will adding new users, manage  their permission, password"
# create new user
echo "Enter the username to create "
read username
adduser $username
# set password for that user
echo "Enter the password for the user $username"
read password
echo "$username:$password" | chpasswd
# view the user detail if exist
echo "Enter the username to view the details"
read viewuser
id $viewuser
# user permission management
echo "Enter the username to manage permission"
read permuser
echo "Enter the permission to set for the user $permuser"
read permission
chmod $permission $permuser 
