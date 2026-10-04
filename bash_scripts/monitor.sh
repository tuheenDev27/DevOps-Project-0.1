# write a script that monitor the system and create report 
#!/bin/bash
echo "this script will monitor the system and create report"

# Create a report file
report_file="system_report_$(date +%Y-%m-%d).txt"
echo "System Report - $(date)" > $report_file
echo "=========================================" >> $report_file

# Monitor system resources
echo "CPU Usage: $(top -bn1 | grep "Cpu(s)" | awk '{print $2}')" >> $report_file
echo "Memory Usage: $(free -h | awk '/^Mem:/ {print $3}')" >> $report_file
echo "Disk Usage: $(df -h / | awk 'NR==2 {print $5}')" >> $report_file