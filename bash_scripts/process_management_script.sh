# write a script check process and manage them 
!/bin/bash
echo "this is a process management script"
# print the processes base on user input
echo "Enter the process name to check with detailed information:"
read process_name
echo "detail information of the process $process_name is:"
ps -ef | grep $process_name
echo "Do you want to kill the process? (y/n)"
read answer
if [ "$answer" == "y" ]; then
    echo "Killing the process $process_name"
    pkill $process_name
    echo "Process $process_name has been killed."
else
    echo "Process $process_name will not be killed."
fi
# control the process based on user input
echo "you can  prioritize the process by changing its nice value"
echo "enter the process name again to change its nice value:"
read process_name
echo "enter the new nice value (between -20 to 19):"
read nice_value
if [[ $nice_value -ge -20 && $nice_value -le 19 ]]; then
    renice $nice_value -p $(pgrep $process_name)
    echo "Nice value of process $process_name has been changed to $nice_value."
else
    echo "Invalid nice value. Please enter a value between -20 and 19."
fi
# after comple script  curenet system status
echo "Current system status:"
htop -d 5

