# Enterprise SOC Lab - Wazuh Detection Engineering

## Overview

A complete SOC monitoring environment built using Wazuh SIEM running on Ubuntu Server.

The lab demonstrates endpoint monitoring, network threat detection, malware analysis,
and threat intelligence integration.

## Architecture

Components:

- Wazuh Manager on Ubuntu Server
- Windows 10/11 endpoints
- Linux endpoint
- Wazuh Agents
- Sysmon telemetry collection
- File Integrity Monitoring (FIM)
- Suricata IDS
- YARA malware detection
- VirusTotal Threat Intelligence Integration
- Tactical RMM automation

## Features

### Endpoint Monitoring
- Windows Event Log collection
- Process monitoring using Sysmon
- Endpoint security visibility

### File Integrity Monitoring
- Detect unauthorized file changes
- Monitor critical system directories
- Generate security alerts

### Malware Detection
- YARA rule-based file scanning
- VirusTotal reputation checking
- Malware investigation workflow

### Network Detection
- Suricata IDS deployment
- Network traffic analysis
- Signature-based threat detection
