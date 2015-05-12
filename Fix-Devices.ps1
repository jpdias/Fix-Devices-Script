#Fix Devices Powershell Script
#Developed by jpdias

Import-Module .\Modules\DeviceManagement.psd1 

Write-Host "----------------------------"
Write-Host "-Fix Device Problems Script-"
Write-Host "---------By JP Dias---------"
Write-Host "Checking Devices"

Foreach ($i in Get-Device)
{
 if($i.HasProblem){
	Write-Host "Problem found at $i.Name"
	$deviceName = $i.Name; 
	Get-Device | Where-Object -Property Name -Like $deviceName | Disable-Device
	Get-Device | Where-Object -Property Name -Like $deviceName | Enable-Device
	Write-Host "Fixed $deviceName"
 }
}


## If there is still some problem, try to reinstall (experimental feature)
Foreach ($i in Get-Device)
{
 if($i.HasProblem){
	Write-Host "Problem still found at $i.Name"
	$deviceName = $i.Name; 
	Get-Device | Where-Object -Property Name -Like $deviceName | Disable-Device
	Get-Device | Where-Object -Property Name -Like $deviceName | Enable-Device
	Get-Device | Where-Object -Property Name -Like $deviceName | Install-DeviceDriver
	Write-Host "Fixed $i.Name"
 }
}

Write-Host "----------------------------"
Write-Host "Done!"
