# create a corn job for perform backup_script.sh every week sunday at 2:00 AM
#!/bin/bash
echo "Creating cron job for backup_script.sh..."
# Add the cron job to the crontab
(crontab -l 2>/dev/null; echo "0 2 * *
    0 /") | crontab -
echo "Cron job created successfully. Backup will run every Sunday at 2:00 AM."
