# Incident Response Playbooks

## Playbook 1 — Brute Force (T1110)

1. Identify source IP and targeted account(s)
2. Check whether any attempt succeeded (successful logon following failed burst)
3. Block source IP at the firewall / fail2ban
4. If a successful logon occurred: force password reset, review account activity, check for lateral movement
5. Close ticket with source IP, account, and action taken documented

## Playbook 2 — Confirmed Malware Execution (T1204 / T1105)

1. **Isolate** the affected host (network isolation via EDR/firewall rule or physical disconnect in lab)
2. **Preserve evidence** — snapshot/export the relevant Wazuh alerts, Sysmon events, and the malicious file/hash
3. **Identify persistence** — check Sysmon Event ID 13 / scheduled tasks for Run key or task-based persistence, remove it
4. **Scope** — search the fleet for the same file hash or C2 indicator
5. **Remediate** — remove the malicious file, reset credentials used on the host, re-image if compromise is deep/uncertain
6. **Recover** — reconnect host only after verification scan is clean
7. **Document** — full timeline, IOC list, and lessons learned

## Playbook 3 — Unauthorized File/Config Change (T1565.001 / T1505.003)

1. Confirm no authorized change record matches
2. Review the change diff (what exactly was modified/added)
3. Revert the unauthorized change
4. If a web shell or backdoor file: isolate host, preserve the file for analysis, check web server logs for the access vector
5. Patch the entry vector if identified (e.g., vulnerable web app)
6. Document

## Playbook 4 — Network Intrusion Attempt (T1190 / Suricata alert)

1. Validate the alert against `eve.json` full payload
2. Check if the targeted application logged any corresponding activity (e.g., web server access log)
3. Block source IP if attack is ongoing
4. If successful exploitation is suspected, escalate to Playbook 2 (malware execution) for the targeted host
5. Document

## Communication

For any P1/P2 incident, the analyst notifies the on-call lead immediately with a short summary (what, where, current status) before deep investigation continues — per the SLA table in `alert-triage.md`.
