# FIM Detection Examples

## Example 1 — Unauthorized Hosts File Modification

**Scenario:** A test payload modified `C:\Windows\System32\drivers\etc\hosts` to redirect a domain to an attacker-controlled IP (simulated DNS hijack).

```
Rule: Syscheck - File modified
File: C:\Windows\System32\drivers\etc\hosts
MITRE: T1565.001 (Stored Data Manipulation)
Severity: High
```

📸 *Insert screenshot: FIM alert for hosts file change*

## Example 2 — New Executable Dropped in Downloads

**Scenario:** An unsigned `.exe` was created in the Downloads folder, immediately followed by a Sysmon Event ID 1 execution from the same path — correlated in a custom Wazuh rule (see `09-Detection-Engineering/malware-execution.md`).

```
Rule: Syscheck - File added
Path: C:\Users\<user>\Downloads\update.exe
Correlated with: Sysmon Event ID 1 (process creation, same path)
MITRE: T1204 (User Execution)
```

## Example 3 — Web Root Tampering

**Scenario:** A file was written to `/var/www/html/` outside of the normal deployment process, flagging a potential web shell drop.

```
Rule: Syscheck - File added
Path: /var/www/html/shell.php
MITRE: T1505.003 (Web Shell)
```

## Analyst Notes

Each FIM alert is cross-checked against the deployment/change log first (was this an authorized update?) before escalating — see `10-Incident-Response/alert-triage.md` for the full triage decision tree.
