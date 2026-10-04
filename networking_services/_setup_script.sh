# configure firewall rules on the host machine
#!/bin/bash
echo "Configuring firewall rules for this application"
echo  " enable and install ufw if not installed"
if ! command -v ufw &> /dev/null; then
    echo "ufw could not be found, installing ufw"
    sudo apt-get update
    sudo apt-get install ufw -y
fi
    echo "enable firewall rules for this application"
read -p "Enter the port number to allow: " port_number
# check if the port is already allowed
if sudo ufw status | grep -q "$port_number"; then
    echo "Port $port_number is already allowed"
else
    sudo ufw allow $port_number
    echo "Port $port_number is now allowed"
fi
