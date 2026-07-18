# Detection: Brute Force (T1110 / T1110.004)

## Trigger Condition

5 or more failed authentication attempts from the same source within a 60-second window.

## Data Sources

- Windows Security Event Log — Event ID 4625 (failed logon)
- Linux `auth.log` / `sshd` — failed password attempts
- Suricata custom rule (`custom.rules`, SID 1000001) for network-visible SSH brute force

## Windows Custom Wazuh Rule

```xml
<rule id="100010" level="10" frequency="5" timeframe="60">
  <if_matched_sid>60122</if_matched_sid> <!-- base 4625 rule -->
  <same_source_ip/>
  <description>Multiple failed logon attempts (possible brute force) from same source IP</description>
  <mitre>
    <id>T1110</id>
  </mitre>
</rule>
```

## Real Detection (SSH, VPS)

```
Attack:  Real SSH brute force from IP: 102.47.78.221
Alert:   High severity
Host:    lab VPS
Date:    2026-05-18
MITRE:   T1110.004
```

📸 *Insert screenshot: brute force alert in Wazuh Dashboard*

## Response

See `10-Incident-Response/response-playbooks.md` → "Brute Force" playbook (block source IP, review account lockout policy, check for successful logon following the failed attempts).
