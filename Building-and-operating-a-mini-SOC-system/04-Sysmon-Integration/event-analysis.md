# Sysmon Event Analysis

## Key Event IDs Used in This Lab

| Event ID | Description        | Detection Use Case                                   |
| -------- | -------------------- | -------------------------------------------------------- |
| 1        | Process creation     | Suspicious parent/child process chains, LOLBins           |
| 3        | Network connection   | Beaconing, unusual outbound ports                          |
| 7        | Image/DLL loaded     | Unsigned DLL side-loading                                   |
| 11       | File created          | Dropped payloads in user-writable paths                     |
| 13       | Registry value set   | Persistence via Run/RunOnce keys                             |
| 22       | DNS query             | DGA-like domains, known-bad C2 lookups                       |

## Wazuh Ingestion

The Windows agent forwards the Sysmon channel via `eventchannel` log format:

```xml
<localfile>
  <location>Microsoft-Windows-Sysmon/Operational</location>
  <log_format>eventchannel</log_format>
</localfile>
```

## Sample Query (Wazuh Discover / KQL-style)

```
data.win.system.eventID:1 AND data.win.eventdata.image:*powershell.exe* AND data.win.eventdata.parentImage:*winword.exe*
```
This flags PowerShell spawned from Word — a common macro-malware pattern.

## Baseline vs Anomaly

Before writing detection rules, a short baselining period was used to identify normal process trees on lab endpoints (browsers, Office, RMM agent, standard services) to reduce false positives once custom Wazuh rules were enabled (see `09-Detection-Engineering/suspicious-powershell.md`).

📸 *Insert screenshots of Sysmon events appearing in Wazuh Discover*
