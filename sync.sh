#!/bin/bash
sudo echo "Start!"
echo ""
echo "<course>"
rclone sync ~/Desktop/course drive_50G:course --progress --track-renames
echo ""
echo "<data>"
rclone sync ~/Desktop/data drive_50G:data --progress --track-renames
echo ""
echo "<upgrade>"
sudo dnf upgrade
echo ""
echo "Finished!"
