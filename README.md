##Fix-Devices Script

Powershell script for fixing devices in Windows System.

Developed to fix a recorrent problem on my Asus N53SV USB ports device.

##Credits

Developed using [Device Management PowerShell Cmdlets](https://gallery.technet.microsoft.com/Device-Management-7fad2388) by Ricardo Mendes - MSFT

##Disclaimer 

This script take use of some experimental features so it can crash and/or not work as pretended, tested on Windows 10 and Windows 8/8.1

##Problems

Error: *Could not load file or assembly HRESULT: 0x80131515*

Solution: Verify if you got the files in Modules folder and the script itself "Unlocked". This option shows up in the file properties dialog.


Error: *Execution of scripts is disabled on this system*

Solution: Run the command ``` Set-ExecutionPolicy RemoteSigned ```