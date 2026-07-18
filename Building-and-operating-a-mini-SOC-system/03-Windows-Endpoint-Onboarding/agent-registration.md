# Agent Registration & Verification

## Manual Enrollment (single host)

```powershell
& "C:\Program Files (x86)\ossec-agent\agent-auth.exe" -m <MANAGER_IP>
Restart-Service WazuhSvc
```

## Verifying Enrollment from the Manager

```bash
sudo /var/ossec/bin/agent_control -l
```

Or via the Wazuh API:

```bash
curl -k -u wazuh-wui:<password> -X GET "https://<MANAGER_IP>:55000/agents?status=active" -H "Content-Type: application/json"
```

## Dashboard Check

Navigate to **Agents management → Endpoints summary** and confirm the new host shows:

- Status: **Active**
- OS: correctly detected (Windows build)
- Last keep-alive: recent (within the agent's configured interval)

📸 *Insert screenshot: agent list showing Active status*

## Common Registration Issues

| Symptom                     | Likely Cause                                  | Fix                                                        |
| ----------------------------- | ------------------------------------------------ | -------------------------------------------------------------- |
| Agent shows "Never connected" | Firewall blocking 1514/1515                     | Open ports on manager and endpoint                            |
| Agent shows "Disconnected"    | Manager IP changed / clock skew                 | Re-run agent-auth, verify NTP sync                              |
| Duplicate agent ID            | Cloned VM image reused without resetting agent ID | Remove agent, run `agent-auth.exe -m <IP>` again to re-register |
