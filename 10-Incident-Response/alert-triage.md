# Alert Triage

## Triage Priority (by severity + confidence)

| Priority | Criteria                                                        | SLA (first response) |
| ---------- | ------------------------------------------------------------------ | ----------------------- |
| P1 — Critical | Confirmed malicious chain (drop → YARA/VT match → execution)     | 15 minutes             |
| P2 — High     | Single strong indicator (brute force success, unauthorized web root write) | 30 minutes             |
| P3 — Medium   | Suspicious but unconfirmed (single failed-logon burst, low-rep VT hit) | 2 hours                 |
| P4 — Low      | Informational / likely benign, needs review only                  | Next business day       |

## Triage Decision Tree

1. **Is there a matching authorized change/deployment record?**
   → Yes: close as benign, document
   → No: continue

2. **Is the indicator confirmed by a second data source?** (e.g., FIM + Sysmon + VT all agree)
   → Yes: escalate to P1/P2
   → No: continue

3. **Is the affected asset high-value?** (domain controller, external-facing host, admin workstation)
   → Yes: raise priority one tier
   → No: keep default priority

4. **Document and assign** per the standard incident ticket template (below)

## Incident Ticket Template

```
Title:
Detected:            <timestamp>
Source rule/alert:    <Wazuh rule ID / name>
Affected host(s):      
MITRE technique(s):    
Evidence:              <log excerpt / screenshot references>
Initial verdict:       True Positive / False Positive / Needs Investigation
Priority:               P1–P4
Actions taken:          
Escalated to:           
```

## Escalation Path

P1/P2 alerts are escalated immediately per `response-playbooks.md`; P3/P4 are logged and reviewed during the next shift handover.
