# Detection: Suspicious PowerShell Execution (T1059.001)

## Trigger Condition

PowerShell process creation (Sysmon Event ID 1) with obfuscation/download indicators: `-EncodedCommand`, `-enc`, `IEX`, `DownloadString`, `Invoke-WebRequest`, or execution spawned from a non-standard parent (e.g., `winword.exe`, `outlook.exe`).

## Custom Wazuh Rule

```xml
<rule id="100020" level="12">
  <if_sid>61603</if_sid> <!-- base Sysmon process-create rule -->
  <field name="win.eventdata.image">powershell.exe</field>
  <field name="win.eventdata.commandLine" type="pcre2">(?i)(-enc|-EncodedCommand|IEX|DownloadString)</field>
  <description>Suspicious obfuscated/download PowerShell command line</description>
  <mitre>
    <id>T1059.001</id>
  </mitre>
</rule>

<rule id="100021" level="13">
  <if_sid>61603</if_sid>
  <field name="win.eventdata.image">powershell.exe</field>
  <field name="win.eventdata.parentImage" type="pcre2">(?i)(winword|excel|outlook)\.exe</field>
  <description>PowerShell spawned from an Office application (possible macro malware)</description>
  <mitre>
    <id>T1059.001</id>
    <id>T1204</id>
  </mitre>
</rule>
```

## Analyst Triage

1. Decode the base64 command line (`[System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String($cmd))`) to inspect intent
2. Check Sysmon Event ID 3 for any network connection made shortly after
3. Cross-reference the file hash (if a script was dropped) against `08-VirusTotal-Threat-Intelligence`

📸 *Insert screenshot: suspicious PowerShell alert in Wazuh*
