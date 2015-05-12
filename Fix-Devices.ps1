
Import-Module .\Modules\DeviceManagement.psd1 

Write-Host "----------------------------"
Write-Host "-Fix Device Problems Script-"
Write-Host "---------By JP Dias---------"
Write-Host "Checking Devices"

Foreach ($i in Get-Device)
{
 if($i.HasProblem){
	Write-Host "Problem found at $i.Name"
	$i.Name; Get-Device | Where-Object -Property Name -Like $deviceName | Disable-Device
	$i.Name; Get-Device | Where-Object -Property Name -Like $deviceName | Enable-Device
	Write-Host "Fixed $i.Name"
 }
}

Foreach ($i in Get-Device)
{
 if($i.HasProblem){
	Write-Host "Problem still found at $i.Name"
	$i.Name; Get-Device | Where-Object -Property Name -Like $deviceName | Disable-Device
	$i.Name; Get-Device | Where-Object -Property Name -Like $deviceName | Enable-Device
	$i.Name; Get-Device | Where-Object -Property Name -Like $deviceName | Install-DeviceDriver
	Write-Host "Fixed $i.Name"
 }
}

Write-Host "----------------------------"
Write-Host "Done!"
