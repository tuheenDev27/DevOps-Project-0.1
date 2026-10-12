# using journalctl command to manage system logs and view logs for specific services
#!/bin/bash
echo "this script will help you manage system logs using journalctl command"
echo "print all logs"
journalctl
echo "print logs for a specific service"
echo "what service do you want to view logs for?"
read service_name
journalctl -u $service_name
echo "print logs for a specific time range"
echo "enter the start time (format: YYYY-MM-DD HH:MM:SS)"
read start_time
echo "enter the end time (format: YYYY-MM-DD HH:MM:SS)"
read end_time
journalctl --since "$start_time" --until "$end_time"
echo "filter logs by priority level"
echo "enter the priority level (0-7, where 0 is emerg and 7 is debug)"
read priority_level
journalctl -p $priority_level   
echo "filter logs by boot session"
journalctl -b
