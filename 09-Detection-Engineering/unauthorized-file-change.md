# Detection: Unauthorized File Change (T1565.001 / T1505.003)

## Trigger Condition

A Syscheck alert (file added, modified, or deleted) on a monitored critical path — outside of a known/scheduled maintenance window.

## Custom Wazuh Rule

```xml
<rule id="100040" level="12">
  <if_sid>550,554,553</if_sid> <!-- syscheck: modified/added/deleted -->
  <field name="file" type="pcre2">(?i)(hosts|/var/www/html/|/etc/passwd|/etc/shadow)</field>
  <description>Unauthorized modification to a critical monitored path</description>
  <mitre>
    <id>T1565.001</id>
  </mitre>
</rule>
```

## Examples Observed

| Path                                     | Change Type | Verdict                                    |
| ------------------------------------------- | ------------- | --------------------------------------------- |
| `C:\Windows\System32\drivers\etc\hosts`    | Modified       | Confirmed test/simulated tampering             |
| `/var/www/html/shell.php`                  | Added          | Confirmed web shell drop (lab simulation)      |
| `/etc/passwd`                              | Modified       | False positive — authorized user provisioning |

## Triage Question First

For every alert in this category, the first analyst question is: **"Is there a matching authorized change record (deployment, patch, admin action) for this timestamp?"** If yes, close as benign with a note; if no, escalate immediately per `10-Incident-Response/alert-triage.md`.

📸 *Insert screenshot: unauthorized file change alert*
