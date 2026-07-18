# 🛡️ Building & Operating a Mini-SOC System

### End-to-End Security Operations Center Lab — Detection, Monitoring & Incident Response

[![Wazuh](https://img.shields.io/badge/SIEM-Wazuh-blue)](https://wazuh.com)
[![ELK Stack](https://img.shields.io/badge/Log%20Management-ELK%20Stack-yellow)](https://www.elastic.co)
[![MITRE ATT&CK](https://img.shields.io/badge/MITRE-ATT%26CK-red)](https://attack.mitre.org)
[![Suricata](https://img.shields.io/badge/NIDS-Suricata-orange)](https://suricata.io)
[![YARA](https://img.shields.io/badge/Malware%20Detection-YARA-purple)](https://virustotal.github.io/yara/)
[![License](https://img.shields.io/badge/license-MIT-blue)](#)

---

## 📖 Table of Contents

- [Project Overview](#-project-overview)
- [Architecture](#️-architecture)
- [Technology Stack](#️-technology-stack)
- [Repository Structure](#-repository-structure)
- [01 · SOC Architecture](#01--soc-architecture)
- [02 · Wazuh SIEM](#02--wazuh-siem)
- [03 · Windows Endpoint Onboarding](#03--windows-endpoint-onboarding)
- [04 · Sysmon Integration](#04--sysmon-integration)
- [05 · File Integrity Monitoring (FIM)](#05--file-integrity-monitoring-fim)
- [06 · Suricata Network IDS](#06--suricata-network-ids)
- [07 · YARA Malware Detection](#07--yara-malware-detection)
- [08 · VirusTotal Threat Intelligence](#08--virustotal-threat-intelligence)
- [09 · Detection Engineering](#09--detection-engineering)
- [10 · Incident Response](#10--incident-response)
- [Detection Coverage (MITRE ATT&CK)](#-detection-coverage-mitre-attck)
- [Results](#-results)
- [Troubleshooting](#-troubleshooting)
- [References](#-references)

---

## 📌 Project Overview

This repository documents the design, deployment, and operation of a **self-built Mini Security Operations Center (SOC)** — a hands-on lab that simulates real enterprise detection and response workflows using open-source tooling. It was built to develop and demonstrate practical **SOC Tier 1 Analyst** skills: SIEM monitoring, log analysis, endpoint telemetry, network intrusion detection, malware triage, and incident documentation.

The lab covers the full detection stack:

- ✅ Centralized SIEM with **Wazuh** (HIDS, log analysis, alerting, compliance)
- ✅ Endpoint telemetry via **Sysmon** on Windows
- ✅ **File Integrity Monitoring (FIM)** for critical paths
- ✅ Network-based intrusion detection with **Suricata**
- ✅ Malware detection with **YARA** rules integrated into Wazuh
- ✅ Threat enrichment via **VirusTotal** API
- ✅ Detection engineering mapped to **MITRE ATT&CK**
- ✅ Structured **incident response** playbooks and triage documentation

---

## 🏗️ Architecture

`01-SOC-Architecture/architecture-diagram.png`

> High-level flow: endpoints (Windows/Linux) → Wazuh Agents → Wazuh Manager → Wazuh Indexer/Dashboard, with Suricata feeding network alerts and YARA/VirusTotal enriching file-based detections.

*(Insert `architecture-diagram.png` here — exported from draw.io / diagrams.net)*

---

## 🛠️ Technology Stack

| Component               | Technology                          |
| ------------------------ | ------------------------------------ |
| **SIEM / HIDS**          | Wazuh (Manager + Indexer + Dashboard) |
| **Endpoint Telemetry**   | Sysmon                               |
| **File Integrity**       | Wazuh FIM (Syscheck)                 |
| **Network IDS**          | Suricata (EVE JSON)                  |
| **Malware Detection**    | YARA rules + Wazuh integration       |
| **Threat Intelligence**  | VirusTotal API                       |
| **Endpoint Management**  | Tactical RMM                         |
| **OS Base**              | Ubuntu Server (Wazuh host) + Windows endpoints |
| **Detection Framework**  | MITRE ATT&CK                         |

---

## 📁 Repository Structure

```
Building-and-operating-a-mini-SOC-system/
│
├── README.md
│
├── 01-SOC-Architecture/
│   ├── architecture-diagram.png
│   └── architecture.md
│
├── 02-Wazuh-SIEM/
│   ├── installation.md
│   ├── ubuntu-server-setup.md
│   ├── wazuh-configuration.md
│   └── screenshots/
│       ├── wazuh-dashboard.png
│       └── manager-status.png
│
├── 03-Windows-Endpoint-Onboarding/
│   ├── wazuh-agent-deployment.ps1
│   ├── tactical-rmm-deployment.md
│   └── agent-registration.md
│
├── 04-Sysmon-Integration/
│   ├── install-sysmon.ps1
│   ├── sysmonconfig.xml
│   ├── event-analysis.md
│   └── screenshots/
│
├── 05-File-Integrity-Monitoring-FIM/
│   ├── fim-configuration.md
│   ├── monitored-paths.md
│   ├── detection-examples.md
│   └── screenshots/
│
├── 06-Suricata-Network-IDS/
│   ├── installation.md
│   ├── suricata.yaml
│   ├── rules/
│   │   └── custom.rules
│   ├── eve-json-analysis.md
│   └── screenshots/
│
├── 07-YARA-Malware-Detection/
│   ├── yara-installation.md
│   ├── rules/
│   │   └── malware_rules.yar
│   ├── wazuh-integration.md
│   └── detection-example.md
│
├── 08-VirusTotal-Threat-Intelligence/
│   ├── integration.md
│   ├── api-setup.md
│   └── investigation-workflow.md
│
├── 09-Detection-Engineering/
│   ├── MITRE-ATTACK-Mapping.md
│   ├── brute-force-detection.md
│   ├── suspicious-powershell.md
│   ├── malware-execution.md
│   └── unauthorized-file-change.md
│
├── 10-Incident-Response/
│   ├── alert-triage.md
│   ├── investigation-process.md
│   └── response-playbooks.md
│
└── Screenshots/
    ├── alerts/
    ├── dashboards/
    └── investigations/
```

---

## 01 · SOC Architecture

**Files:** `01-SOC-Architecture/architecture.md`, `architecture-diagram.png`

Documents the overall lab topology: how endpoints, the Wazuh manager, network sensors, and threat-intel sources connect. Include:

- Network diagram (VLANs / segments if applicable)
- Data flow: Agent → Manager → Indexer → Dashboard
- List of components and their IPs/roles

📸 *Insert `architecture-diagram.png`*

---

## 02 · Wazuh SIEM

**Files:** `installation.md`, `ubuntu-server-setup.md`, `wazuh-configuration.md`

### Installation Steps

```
# Wazuh all-in-one install
curl -sO https://packages.wazuh.com/4.x/wazuh-install.sh
sudo bash ./wazuh-install.sh -a
```

📸 *Insert `screenshots/wazuh-dashboard.png` — Wazuh Dashboard overview*
📸 *Insert `screenshots/manager-status.png` — `systemctl status wazuh-manager`*

### Key Configuration

Document JVM/indexer tuning, retention policy, and any custom `ossec.conf` changes made for this lab (log collection sources, active response, etc.).

---

## 03 · Windows Endpoint Onboarding

**Files:** `wazuh-agent-deployment.ps1`, `tactical-rmm-deployment.md`, `agent-registration.md`

Covers deploying the Wazuh agent to Windows endpoints — either manually or pushed via **Tactical RMM** for scale. Include the enrollment command and a screenshot of the agent showing **Active** status in the Wazuh dashboard.

```powershell
# Example agent install (customize with your manager IP)
Invoke-WebRequest -Uri https://packages.wazuh.com/4.x/windows/wazuh-agent-4.x-1.msi -OutFile wazuh-agent.msi
msiexec.exe /i wazuh-agent.msi /q WAZUH_MANAGER='<MANAGER_IP>'
NET START WazuhSvc
```

📸 *Insert screenshot: agent list showing Active status*

---

## 04 · Sysmon Integration

**Files:** `install-sysmon.ps1`, `sysmonconfig.xml`, `event-analysis.md`

Deploys **Sysmon** with a hardened config (e.g., based on SwiftOnSecurity or Olaf Hartong's modular config) to generate rich process, network, and registry telemetry that Wazuh ingests via the Windows agent's `<log_format>eventchannel</log_format>`.

Document key Event IDs monitored:

| Event ID | Description               |
| -------- | -------------------------- |
| 1        | Process creation           |
| 3        | Network connection         |
| 7        | Image/DLL loaded           |
| 11       | File created                |
| 13       | Registry value set          |

📸 *Insert screenshots of Sysmon events appearing in Wazuh Discover*

---

## 05 · File Integrity Monitoring (FIM)

**Files:** `fim-configuration.md`, `monitored-paths.md`, `detection-examples.md`

Configures Wazuh **Syscheck** to monitor critical directories (e.g., `C:\Windows\System32\drivers\etc`, `/etc`, web app directories) for unauthorized creation/modification/deletion.

```xml
<syscheck>
  <directories check_all="yes" realtime="yes">/etc,/usr/bin,/usr/sbin</directories>
  <directories check_all="yes" realtime="yes">C:\Windows\System32\drivers\etc</directories>
</syscheck>
```

📸 *Insert screenshot: FIM alert for an unauthorized file change*

---

## 06 · Suricata Network IDS

**Files:** `installation.md`, `suricata.yaml`, `rules/custom.rules`, `eve-json-analysis.md`

Deploys **Suricata** in IDS mode on the lab network segment/span port, forwards `eve.json` to Wazuh for correlation, and documents custom detection rules.

```
sudo apt install suricata -y
sudo suricata-update
sudo systemctl enable suricata --now
```

Example custom rule (`rules/custom.rules`):

```
alert tcp any any -> $HOME_NET 22 (msg:"SSH Brute Force Attempt"; flow:to_server; threshold:type both, track by_src, count 5, seconds 60; sid:1000001; rev:1;)
```

📸 *Insert screenshot: Suricata alert flowing into Wazuh/Kibana*

---

## 07 · YARA Malware Detection

**Files:** `yara-installation.md`, `rules/malware_rules.yar`, `wazuh-integration.md`, `detection-example.md`

Integrates **YARA** with Wazuh's active response so that on-demand or scheduled scans flag files matching malware signatures.

```
sudo apt install yara -y
```

`wazuh-integration.md` documents wiring YARA into Wazuh's active-response scripts to auto-scan files flagged by FIM.

📸 *Insert screenshot: YARA match triggering a Wazuh alert*

---

## 08 · VirusTotal Threat Intelligence

**Files:** `integration.md`, `api-setup.md`, `investigation-workflow.md`

Documents integrating the **VirusTotal API** with Wazuh (via the built-in VirusTotal active response module) to automatically check file hashes flagged by FIM/YARA against VT's detection engines, plus the manual analyst investigation workflow for a suspicious hash.

```xml
<integration>
  <name>virustotal</name>
  <api_key>YOUR_VT_API_KEY</api_key>
  <group>syscheck</group>
  <alert_format>json</alert_format>
</integration>
```

📸 *Insert screenshot: VirusTotal enrichment result in a Wazuh alert*

---

## 09 · Detection Engineering

**Files:** `MITRE-ATTACK-Mapping.md`, `brute-force-detection.md`, `suspicious-powershell.md`, `malware-execution.md`, `unauthorized-file-change.md`

Custom Wazuh detection rules written and tuned for this lab, each mapped to a MITRE ATT&CK technique. Each `.md` file should include: the trigger condition, the raw log/event sample, the custom rule XML, and the resulting alert screenshot.

---

## 10 · Incident Response

**Files:** `alert-triage.md`, `investigation-process.md`, `response-playbooks.md`

Documents the analyst workflow applied to alerts generated by this lab — alert triage criteria, escalation thresholds, investigation steps, and response playbooks (e.g., isolate host, reset credentials, block IP) aligned with SOC SLAs.

---

## 🎯 Detection Coverage (MITRE ATT&CK)

| Technique ID | Technique Name                     | Data Source                  |
| ------------ | ----------------------------------- | ----------------------------- |
| T1110        | Brute Force                         | Auth logs / Event ID 4625     |
| T1110.004    | Credential Stuffing (SSH)           | Suricata + syslog             |
| T1059.001    | PowerShell Execution                | Sysmon Event ID 1              |
| T1105        | Ingress Tool Transfer                | Sysmon + FIM                  |
| T1204        | User Execution (Malware)            | YARA + VirusTotal              |
| T1565.001    | Stored Data Manipulation            | FIM (Syscheck)                |
| T1190        | Exploit Public-Facing Application   | Suricata (WAF-style rules)    |

---

## 📊 Results

- ✅ Wazuh Manager + Indexer + Dashboard deployed and healthy
- ✅ Windows & Linux endpoints enrolled with Active agent status
- ✅ Sysmon telemetry ingested and correlated in Wazuh
- ✅ FIM actively monitoring critical paths
- ✅ Suricata network alerts correlated with host-based detections
- ✅ YARA + VirusTotal enrichment wired into the alert pipeline
- ✅ Custom detection rules mapped to MITRE ATT&CK
- ✅ Documented incident response playbooks for common alert types

---

## 🔧 Troubleshooting

### Wazuh Agent Not Connecting

```
sudo systemctl restart wazuh-agent
tail -f /var/ossec/logs/ossec.log
```

### Wazuh Manager Not Starting

```
sudo systemctl status wazuh-manager
sudo journalctl -u wazuh-manager -f
```

### Suricata Not Generating Alerts

```
sudo suricata -T -c /etc/suricata/suricata.yaml -v
tail -f /var/log/suricata/eve.json
```

---

## 📚 References

- [Wazuh Documentation](https://documentation.wazuh.com)
- [MITRE ATT&CK Framework](https://attack.mitre.org)
- [Suricata Documentation](https://docs.suricata.io)
- [YARA Documentation](https://yara.readthedocs.io)
- [VirusTotal API Docs](https://docs.virustotal.com)
- [Sysmon (Microsoft Sysinternals)](https://learn.microsoft.com/sysinternals/downloads/sysmon)

---

> **Note:** This project was built as a personal home-lab for hands-on SOC Analyst skill development. Configurations use lab/test credentials and should not be reused as-is in production.
