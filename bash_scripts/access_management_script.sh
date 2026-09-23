# write a  script that handles users for this application
#!/bin/bash
echo "this script will handle  basic user operation andd  file managemet"
echo "************************************************"
echo "check the dir structure for the application"
sources ./setup_scripts/application_setup_script.sh
dirname=${dirname}
if [ -d "${dirname}" ]; then
    echo "dir ${dirname} exists"
else
    echo "dir ${dirname} does not exist"
    echo "please run the application_setup_script.sh first"
    exit 1
fi
# now create two groups for this directory
echo "create two groups for this application"
read group1 
read group2
# check if group are exists or not
if [ $(getent group ${group1}) ]; then
    echo "group ${group1} exists"
else
    echo "group ${group1} does not exist"
    sudo groupadd ${group1}
    echo "group ${group1} created"
fi
if [ $(getent group ${group2}) ]; then
    echo "group ${group2} exists"
else
    echo "group ${group2} does not exist"
    sudo groupadd ${group2}
    echo "group ${group2} created"
fi
# adding users to the groups
