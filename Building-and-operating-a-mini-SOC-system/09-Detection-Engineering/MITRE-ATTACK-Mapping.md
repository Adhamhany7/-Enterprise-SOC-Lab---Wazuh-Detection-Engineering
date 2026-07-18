# MITRE ATT&CK Mapping

| Technique ID | Technique Name                     | Tactic              | Data Source          | Detection File                          |
| ------------ | ------------------------------------ | ---------------------- | ----------------------- | -------------------------------------------- |
| T1110        | Brute Force                          | Credential Access       | Windows Security 4625    | `brute-force-detection.md`                    |
| T1110.004    | Credential Stuffing (SSH)            | Credential Access       | Suricata + syslog         | `brute-force-detection.md`                    |
| T1059.001    | PowerShell Execution                 | Execution                | Sysmon Event ID 1          | `suspicious-powershell.md`                     |
| T1105        | Ingress Tool Transfer                | Command and Control      | Sysmon + FIM                | `malware-execution.md`                          |
| T1204        | User Execution                       | Execution                | FIM + Sysmon + YARA       | `malware-execution.md`                          |
| T1565.001    | Stored Data Manipulation             | Impact                   | FIM (Syscheck)              | `unauthorized-file-change.md`                   |
| T1190        | Exploit Public-Facing Application    | Initial Access            | Suricata                    | (see `06-Suricata-Network-IDS/eve-json-analysis.md`) |
| T1505.003    | Web Shell                            | Persistence               | FIM (Syscheck)              | `unauthorized-file-change.md`                   |
| T1547.001    | Registry Run Keys / Startup Folder   | Persistence               | Sysmon Event ID 13           | `malware-execution.md`                          |

## Coverage Philosophy

Rather than trying to cover the entire ATT&CK matrix, this lab prioritizes techniques that are:

1. **High-fidelity to detect** with the available data sources (auth logs, Sysmon, FIM, network IDS)
2. **Commonly seen in real-world SOC Tier 1 alert queues** — brute force, suspicious execution, unauthorized file changes
3. **Demonstrable end-to-end** — from raw log to correlated alert to a documented triage/response step

## Coverage Gaps (Known Limitations)

- No cloud-native data source (this is an on-prem/VM lab)
- No EDR-level memory inspection — detection relies on Sysmon + FIM + YARA rather than a full EDR agent
- Suricata coverage limited to the monitored segment (span port), not full east-west visibility
