# EVE JSON Analysis

Suricata's `eve.json` is the single structured log Wazuh ingests for all network-layer events (`alert`, `http`, `dns`, `tls`, `flow`).

## Sample Alert Record

```json
{
  "timestamp": "2026-05-18T10:22:41.112Z",
  "event_type": "alert",
  "src_ip": "102.47.78.221",
  "dest_ip": "10.0.0.10",
  "dest_port": 22,
  "alert": {
    "signature": "SSH Brute Force Attempt",
    "category": "Attempted Information Leak",
    "severity": 2
  }
}
```

## Wazuh Rule Mapping

A custom Wazuh decoder/rule parses `alert.signature` and `alert.severity` from the JSON payload to generate a correlated Wazuh alert, tagged with the matching MITRE technique (see `09-Detection-Engineering/MITRE-ATTACK-Mapping.md`).

## Real Detections Captured in This Lab

| Date       | Signature                | Source IP        | Severity | MITRE      |
| ------------ | --------------------------- | ------------------- | ---------- | ------------ |
| 2026-05-18 | SSH Brute Force Attempt     | 102.47.78.221        | High       | T1110.004    |
| —          | Possible SQL Injection      | (internal test host) | High       | T1190        |

📸 *Insert screenshot: Suricata alert flowing into Wazuh/Kibana dashboard*

## Tuning Notes

Initial deployment produced noisy `flow` events; the `eve-log` output was scoped down to `alert`, `http`, `dns`, `tls`, and `flow` only, and default community rules were trimmed to reduce false-positive volume before enabling `custom.rules`.
