# NetSupportRemover
This repository contains two Windows batch scripts designed for system administrators or users who need to terminate specific processes and uninstall NetSupport efficiently. These scripts are particularly useful for automating the process of uninstalling NetSupport. This involves ending certain tasks, attempting to remove the folder housing NetSupport, and then executing the uninstallation command using the uninstallation string obtained from the registry.
# Prerequisites
Windows operating system.
Administrative privileges on the system where the scripts will be executed.
# Scripts Overview
killtasks.bat: A script to forcefully terminate a predefined list of processes if they are running.
remove.bat: A script that uninstalls NetSupport software from the system after terminating related processes using killtasks.bat.
# Usage
killtasks.bat
This script checks and terminates several processes if they are found running on the system. The targeted processes include client applications, service processes, and more, specifically(for now):
1. client32.exe
2. RevitAccelerator.exe
3. Runplugin64.exe
4. runplugin.exe
5. node.exe
6. msedge.exe
7. smartscreen.exe
8. CollaborationKeysController.exe
# Caution
Use these scripts with caution. Terminating processes and uninstalling software can affect system operations and user experience. It is recommended to thoroughly test these scripts in a non-production environment before widespread use.

