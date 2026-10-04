# create corn job for runing  monitor.sh script every 2 hours each day
#!/bin/bash
echo "Creating cron job for running monitor.sh script every 2 hours each day"
# check if the monitor.sh script exists
if [ ! -f "bash_scripts/monitor.sh" ]; then
    echo "monitor.sh script does not exist, please create the script first"
    exit 1
fi
# check if the cron job already exists
if crontab -l | grep -q "bash_scripts/monitor.sh"; then
    echo "Cron job for monitor.sh script already exists"
else
    # create the cron job
    (crontab -l 2>/dev/null; echo "0 */2 *
    * * bash_scripts/monitor.sh") | crontab -
    echo "Cron job for monitor.sh script created successfully"

echo "Cron job for monitor.sh script will run every 2 hours each day"
fi
