# this  script hel to create your ssh key and copy it to the remote server for passwordless login\
#!/bin/bash
echo "this script will help to create your ssh key and copy it to the remote server for passwordless login"
# create ssh key
read -p "Enter the email address for the ssh key: " email
ssh-keygen -t rsa -b 4096 -C "$email"
# two  file are created in the .ssh directory id_rsa and id_rsa.pub
echo "SSH key created successfully"
echo "The private key is stored in ~/.ssh/id_rsa"
echo "The public key is stored in ~/.ssh/id_rsa.pub"
# copy ssh key to remote server
read -p "Enter the remote server username: " remote_user
read -p "Enter the remote server IP address: " remote_ip
sudo ssh-copy-id $remote_user@$remote_ip
ssh $remote_user@$remote_ip "echo 'SSH key copied successfully to the remote server'"
