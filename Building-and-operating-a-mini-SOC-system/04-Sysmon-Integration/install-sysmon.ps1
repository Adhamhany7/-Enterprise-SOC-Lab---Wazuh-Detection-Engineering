<#
.SYNOPSIS
    Installs Sysmon with the hardened config used in this lab.
#>

$ProgressPreference = 'SilentlyContinue'
$dest = "$env:TEMP\Sysmon"
New-Item -ItemType Directory -Force -Path $dest | Out-Null

Write-Host "[*] Downloading Sysmon ..."
Invoke-WebRequest -Uri "https://download.sysinternals.com/files/Sysmon.zip" -OutFile "$dest\Sysmon.zip"
Expand-Archive "$dest\Sysmon.zip" -DestinationPath $dest -Force

Write-Host "[*] Copying config ..."
Copy-Item ".\sysmonconfig.xml" "$dest\sysmonconfig.xml" -Force

Write-Host "[*] Installing Sysmon64 with lab config ..."
& "$dest\Sysmon64.exe" -accepteula -i "$dest\sysmonconfig.xml"

Write-Host "[+] Sysmon installed. Verifying service ..."
Get-Service Sysmon64 | Format-Table -AutoSize

Write-Host "[*] Confirming Wazuh agent is set to collect the Sysmon channel ..."
Write-Host "    Ensure ossec.conf on the agent includes:"
Write-Host '    <localfile><location>Microsoft-Windows-Sysmon/Operational</location><log_format>eventchannel</log_format></localfile>'
