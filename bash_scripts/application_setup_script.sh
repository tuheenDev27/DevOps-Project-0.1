# this is script is create a dir structure for now 
#!/bin/bash
echo "create dir structure for my project" 
read  dirname
mkdir ${dirname}
echo "dir ${dirname} created"
echo "************************************************"
echo "install application code on that dir"
cd ${dirname}
read  application_code
git clone ${application_code}
echo "application code downloaded successfully"
echo "************************************************"
echo "install software dependencies for the application"
echo "install dockr container for  runing the application"
read platform
if [ ${platform} == "ubuntu" ]; then
    sudo apt-get update
    sudo apt-get install docker.io -y
    sudo systemctl start docker
    sudo systemctl enable docker
    echo "docker installed successfully"
elif [ ${platform} == "centos" ]; then
    sudo yum update -y
    sudo yum install docker -y
    sudo systemctl start docker
    sudo systemctl enable docker
else 
    echo "platform not supported"
fi

read docker_imge
read port_number
docker run -d -p ${port_number}:${port_number} ${docker_imge}
if [ $? -eq 0 ]; then
    echo "docker container started successfully"
else
    echo "docker container failed to start"
fi

# install  python programing language dependencies for the application
echo "install python and pip for the application"
read platform
if [ ${platform} == "ubuntu" ]; then
    sudo apt-get install python3 -y
    sudo apt-get install python3-pip -y
    echo "python3 and pip installed successfully"
elif [ ${platform} == "centos" ]; then
    sudo yum install python3 -y
    sudo yum install python3-pip -y
    echo "python3 and pip installed successfully"
else 
    echo "platform not supported"
fi
