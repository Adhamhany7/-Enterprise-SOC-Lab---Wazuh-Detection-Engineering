# Threat Intelligence Investigation Workflow

## When VirusTotal Enrichment Fires

1. FIM/YARA alert is generated for a file
2. Wazuh's VirusTotal integration automatically hashes and queries the file
3. If `virustotal.malicious > 0`, the alert severity is escalated

## Analyst Steps

1. **Confirm the hit** — open `virustotal.permalink` and review which engines flagged it and under what family/classification
2. **Correlate** — check Sysmon (Event ID 1/3) for whether the file executed and made any network connections
3. **Scope** — search across the fleet for the same file hash to determine how many endpoints are affected
4. **Contain** — isolate the affected host(s) per `10-Incident-Response/response-playbooks.md`
5. **Document** — record the hash, VT verdict, affected hosts, and timeline in the incident ticket

## Example: Full Chain

```
FIM alert          → new file: update.ps1
YARA match          → Suspicious_PowerShell_Encoded_Command (T1059.001)
VirusTotal verdict  → 18/70 engines flagged as malicious (Trojan.PowerShell.Agent)
Sysmon correlation  → Event ID 1: powershell.exe executed the file 40s after creation
Action              → Host isolated, hash added to blocklist, credentials on host reset
```

## False Positive Handling

If VT returns 0/70 or only obscure/low-reputation engines flag a hash, the alert is downgraded and the file is reviewed manually (internal tooling, custom scripts, or signed-but-unrecognized binaries are common false positives in a lab environment).
