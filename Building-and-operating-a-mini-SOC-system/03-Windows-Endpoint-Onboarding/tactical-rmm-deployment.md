# Deploying Wazuh Agents via Tactical RMM

Tactical RMM is used here to push the Wazuh agent to multiple Windows endpoints at once instead of installing manually on each machine — critical when onboarding a fleet (~300+ endpoints).

## Steps

1. **Upload the script**
   Add `wazuh-agent-deployment.ps1` (from this folder) as a new PowerShell script in Tactical RMM under *Scripts*.

2. **Set script arguments**
   Pass the manager IP and target agent group as arguments, e.g.:
   ```
   -ManagerIP 10.0.0.10 -AgentGroup windows-endpoints
   ```

3. **Target a client/site/group**
   Run the script against a policy or a selected group of agents (bulk run) rather than one host at a time.

4. **Run as SYSTEM**
   Ensure the script executes with SYSTEM privileges (required for MSI install + service registration).

5. **Verify success**
   Check the script output log in Tactical RMM for each endpoint, then confirm the endpoint shows up as **Active** in the Wazuh Dashboard (*Agents management → Endpoints summary*).

## Automating Re-Enrollment

For endpoints that go stale (e.g., after a manager IP change or certificate rotation), the same script can be re-run — the installer safely reinstalls/reconfigures the existing agent.

## Notes

- Tactical RMM policies can be scheduled to periodically check-in and re-push the script to any endpoint missing the `WazuhSvc` service, keeping fleet coverage consistent as new machines join the domain.
- Combine with Tactical RMM's patch management to keep the underlying OS current alongside SIEM coverage.
