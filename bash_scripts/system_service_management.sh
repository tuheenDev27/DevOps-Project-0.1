# write a script that manages system services using systemctl command
!#/bin/bash
echo "this script will help you manage system services using systemctl command"
echo  "***********************************************************************"
echo "Please select an option:"
echo "1. Start a service"
echo "2. Stop a service"
echo "3. Restart a service"
echo "4. Check the status of a service"
read -p "Enter your choice (1-4): " choice  

case $choice in
  1)
    read -p "Enter the service name to start: " service
    systemctl start $service
    ;;
  2)
    read -p "Enter the service name to stop: " service
    systemctl stop $service
    ;;
  3)
    read -p "Enter the service name to restart: " service
    systemctl restart $service
    ;;
  4)
    read -p "Enter the service name to check status: " service
    systemctl status $service
    ;;
  *)
    echo "Invalid choice. Please try again."
    ;;
esac
echo "***********************************************************************"