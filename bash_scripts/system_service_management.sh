# write a script that manages system services using systemctl command
!#/bin/bash
echo "this script will help you manage system services using systemctl command"
echo  "print all running services"
systemctl list-units --type=service --state=running
echo "print all failed services"
systemctl list-units --type=service --state=failed  
echo "print all inactive services"
systemctl list-units --type=service --state=inactive
echo "print all enabled services"
systemctl list-unit-files --type=service --state=enabled   
echo "print all disabled services"
systemctl list-unit-files --type=service --state=disabled   
echo "what service do you want to start?"
read service_name
echo "starting the service $service_name"
systemctl start $service_name
echo "service $service_name started successfully"
echo "what service do you want to stop?"
read service_name
echo "stopping the service $service_name"
systemctl stop $service_name
echo "service $service_name stopped successfully"
echo "what service do you want to restart?"
read service_name
echo "restarting the service $service_name"
systemctl restart $service_name
echo "service $service_name restarted successfully"
