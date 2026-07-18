# Suricata Network IDS — Installation

## Install

```bash
sudo add-apt-repository ppa:oisf/suricata-stable -y
sudo apt update
sudo apt install suricata -y
```

## Configure Monitoring Interface

Edit `/etc/suricata/suricata.yaml` to set the interface Suricata listens on (span/mirror port or the sensor's monitoring NIC):

```yaml
af-packet:
  - interface: eth1
    cluster-id: 99
    cluster-type: cluster_flow
```

## Update Rule Sources

```bash
sudo suricata-update
```

## Enable and Start

```bash
sudo systemctl enable suricata --now
sudo systemctl status suricata
```

## Validate Config

```bash
sudo suricata -T -c /etc/suricata/suricata.yaml -v
```

## Forward eve.json to Wazuh

On the Wazuh agent/manager reading Suricata's output, add:

```xml
<localfile>
  <log_format>json</log_format>
  <location>/var/log/suricata/eve.json</location>
</localfile>
```

📸 *Insert screenshot: Suricata service running / eve.json populating*
