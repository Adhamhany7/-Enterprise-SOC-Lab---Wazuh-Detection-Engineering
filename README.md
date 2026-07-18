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
