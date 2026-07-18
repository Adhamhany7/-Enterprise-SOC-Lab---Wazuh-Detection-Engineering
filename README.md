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
