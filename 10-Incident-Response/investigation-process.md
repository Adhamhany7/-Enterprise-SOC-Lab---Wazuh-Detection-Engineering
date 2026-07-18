# Investigation Process

## Step 1 — Validate the Alert

- Confirm the raw log/event actually supports the alert (avoid acting on a mis-parsed or duplicate alert)
- Check for related alerts around the same timestamp on the same host

## Step 2 — Establish Scope

- Which host(s) are affected?
- Is the same indicator (hash, IP, rule) present on any other endpoint? (search across the fleet in the Wazuh dashboard)

## Step 3 — Build the Timeline

Pull together, in chronological order:

- Initial indicator (FIM/Suricata/auth log)
- Process execution (Sysmon Event ID 1/3)
- Persistence attempts (Sysmon Event ID 13)
- Any threat intel enrichment (VirusTotal verdict)

## Step 4 — Determine Verdict

- **True Positive** — proceed to containment (see `response-playbooks.md`)
- **False Positive** — document root cause (e.g., authorized change, benign tool) and tune the rule/exclusion to prevent recurrence
- **Needs more data** — escalate for deeper investigation or request additional logging

## Step 5 — Document

Every investigation is logged with: alert source, timeline, evidence, verdict, and any tuning changes made to detection rules as a result — feeding back into `09-Detection-Engineering/`.

## Step 6 — Post-Incident Review

For confirmed incidents (P1/P2), a short after-action note captures: what worked, what was missed, and any detection gap to close.
