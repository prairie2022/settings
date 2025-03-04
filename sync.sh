#!/bin/bash
sudo echo "Start!"
echo ""
echo "<course>"
rclone sync ~/Desktop/course/113-2 drive_50G:course/113-2 --progress --track-renames --skip-links
echo ""
echo "<data>"
rclone sync ~/Desktop/data drive_50G:data --progress --track-renames --skip-links
echo ""
echo "<upgrade>"
sudo dnf upgrade
echo ""
echo "Finished!"
