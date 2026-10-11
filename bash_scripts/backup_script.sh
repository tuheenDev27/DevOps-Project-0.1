# write a script of entaire system backup and create tar file and  push  on private git repository.
#!/bin/bash
echo "Starting backup process..."
udo tar czf /backup.tar.gz \
    --exclude=/backup.tar.gz \
    --exclude=/dev \
    --exclude=/mnt \
    --exclude=/proc \
    --exclude=/sys \
    --exclude=/tmp \
    --exclude=/media \
    --exclude=/lost+found \
    /
echo "Backup completed. Pushing to private git repository..."
# Change to the directory where the backup file is located
cd /
# Initialize a new git repository if it doesn't exist
if [ ! -d ".git" ]; then
    git init
    git remote add origin <your-private-git-repo-url>
fi
# Add the backup file to the repository
git add backup.tar.gz
# Commit the changes
git commit -m "Backup on $(date)"
# Push to the private git repository
git push origin master  
