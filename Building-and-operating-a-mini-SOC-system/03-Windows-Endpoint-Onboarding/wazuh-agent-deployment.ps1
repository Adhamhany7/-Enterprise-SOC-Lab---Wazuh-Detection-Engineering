<#
.SYNOPSIS
    Silent deployment of the Wazuh agent on Windows endpoints.
.DESCRIPTION
    Downloads and installs the Wazuh agent MSI, registers it with the
    Wazuh Manager, and starts the service. Intended for manual runs
    or push deployment via Tactical RMM.
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$ManagerIP,

    [string]$AgentGroup = "windows-endpoints",
    [string]$WazuhVersion = "4.9.0-1"
)

$ProgressPreference = 'SilentlyContinue'
$installer = "$env:TEMP\wazuh-agent.msi"
$url = "https://packages.wazuh.com/4.x/windows/wazuh-agent-$WazuhVersion.msi"

Write-Host "[*] Downloading Wazuh agent $WazuhVersion ..."
Invoke-WebRequest -Uri $url -OutFile $installer

Write-Host "[*] Installing agent (manager: $ManagerIP, group: $AgentGroup) ..."
Start-Process msiexec.exe -ArgumentList "/i `"$installer`" /q WAZUH_MANAGER='$ManagerIP' WAZUH_AGENT_GROUP='$AgentGroup'" -Wait

Write-Host "[*] Starting WazuhSvc ..."
Set-Service -Name WazuhSvc -StartupType Automatic
Start-Service -Name WazuhSvc

Write-Host "[+] Wazuh agent installed and started. Verify status:"
Get-Service WazuhSvc | Format-Table -AutoSize

Write-Host "[*] Cleaning up installer ..."
Remove-Item $installer -Force
