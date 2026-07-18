# VirusTotal API Setup

## Get an API Key

1. Create a free account at [virustotal.com](https://www.virustotal.com)
2. Navigate to your profile → **API Key**
3. Copy the key — the free tier is rate-limited (4 requests/minute), which is sufficient for lab-scale alert volume

## Store the Key Securely

Avoid committing the raw key to version control. In this lab it is referenced via the `ossec.conf` integration block on the manager only (not distributed to agents):

```xml
<integration>
  <name>virustotal</name>
  <api_key>YOUR_VT_API_KEY</api_key>
  <group>syscheck</group>
</integration>
```

For production use, consider storing the key in an environment variable or secrets manager and templating it into `ossec.conf` during deployment rather than hardcoding it.

## Rate Limit Considerations

The free API tier caps at 4 requests/minute and 500/day. At lab scale this is enough, but for a fleet of 300+ endpoints with active FIM, a paid tier (or restricting VT lookups to high-value paths only) would be required to avoid throttling.

## Manual Lookup (analyst workflow)

```bash
curl --request GET \
  --url "https://www.virustotal.com/api/v3/files/<SHA256_HASH>" \
  --header "x-apikey: YOUR_VT_API_KEY"
```
