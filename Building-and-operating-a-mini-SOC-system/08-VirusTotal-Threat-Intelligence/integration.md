# VirusTotal Integration

## Purpose

Automatically enrich file-hash-based alerts (from FIM/YARA) with VirusTotal's multi-engine detection verdict, so analysts see a reputation score directly inside the Wazuh alert without a manual lookup.

## `ossec.conf` Integration Block

```xml
<integration>
  <name>virustotal</name>
  <api_key>YOUR_VT_API_KEY</api_key>
  <group>syscheck</group>
  <alert_format>json</alert_format>
</integration>
```

This tells the manager to send any Syscheck alert (file added/modified) to the built-in VirusTotal integration script, which hashes the file and queries the VT API.

## Resulting Alert Fields

Once enriched, the alert includes:

- `virustotal.malicious` — number of engines flagging the hash as malicious
- `virustotal.total` — total engines queried
- `virustotal.permalink` — link to the full VT report

## Alerting Threshold

A custom Wazuh rule escalates severity when `virustotal.malicious > 0`, ensuring any positive hit — even from a single engine — surfaces as a high-priority alert for analyst review.

📸 *Insert screenshot: VirusTotal enrichment result in a Wazuh alert*
