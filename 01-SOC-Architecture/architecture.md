# SOC Architecture

## Overview

This document describes the topology of the Mini-SOC lab: how endpoints, the SIEM stack, and network sensors are connected and how data flows from raw event to actionable alert.

## Components

| Component            | Role                                              | OS / Platform        |
| --------------------- | -------------------------------------------------- | ---------------------- |
| Wazuh Manager          | Central log analysis, rule correlation, alerting  | Ubuntu Server         |
| Wazuh Indexer          | Stores and indexes events (OpenSearch-based)       | Ubuntu Server         |
| Wazuh Dashboard        | Visualization / analyst console                    | Ubuntu Server         |
| Windows Endpoint(s)    | Domain-joined workstation generating telemetry     | Windows 10/11         |
| Linux Endpoint(s)      | Server/workstation generating syslog + FIM events  | Ubuntu Desktop/Server |
| Suricata Sensor        | Network IDS, span/mirror port or inline            | Ubuntu Server         |
| Tactical RMM           | Bulk agent deployment / endpoint management        | Cloud/self-hosted     |

## Data Flow

```
Endpoint (Windows/Linux)
   │  Sysmon + Windows Event Log / syslog + Syscheck (FIM)
   ▼
Wazuh Agent
   │  Encrypted agent-manager protocol (port 1514/1515)
   ▼
Wazuh Manager  ── Suricata eve.json ──▶ (ossec.conf localfile)
   │  Rule correlation + decoders + active response
   │  YARA scan trigger (on FIM alert) → VirusTotal hash lookup
   ▼
Wazuh Indexer
   ▼
Wazuh Dashboard  → Analyst triage → Incident Response playbook
```

## Network Segmentation (lab)

- **Management segment:** Wazuh Manager, Indexer, Dashboard
- **Endpoint segment:** Windows + Linux monitored hosts
- **Sensor segment:** Suricata on a span/mirror port to observe inter-segment traffic

## Diagram

📸 *Insert `architecture-diagram.png` here (exported from draw.io / diagrams.net) showing the flow above.*
