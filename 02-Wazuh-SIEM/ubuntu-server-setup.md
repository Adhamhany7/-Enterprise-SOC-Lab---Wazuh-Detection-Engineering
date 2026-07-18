# Ubuntu Server Setup for Wazuh

## Base OS Preparation

```bash
sudo apt update && sudo apt upgrade -y
sudo hostnamectl set-hostname wazuh-manager
sudo timedatectl set-ntp true
```

## Kernel / System Tuning

Wazuh's indexer (OpenSearch-based) requires the same `vm.max_map_count` tuning as Elasticsearch:

```bash
sudo sysctl -w vm.max_map_count=262144
echo "vm.max_map_count=262144" | sudo tee -a /etc/sysctl.conf
```

## Disable Swap (recommended for indexer nodes)

```bash
sudo swapoff -a
sudo sed -i '/ swap / s/^/#/' /etc/fstab
```

## Firewall Rules (ufw example)

```bash
sudo ufw allow 1514/tcp   # Agent data
sudo ufw allow 1515/tcp   # Agent enrollment
sudo ufw allow 55000/tcp  # Wazuh API
sudo ufw allow 9200/tcp   # Indexer (restrict to manager/cluster nodes only)
sudo ufw allow 443/tcp    # Dashboard
sudo ufw enable
```

## Storage Planning

For ~300–350 endpoints, plan indexer storage based on expected events/day per agent (Sysmon-heavy endpoints generate significantly more volume than baseline). Budget disk with headroom for the configured retention period and enable ILM to roll/delete old indices automatically.

## Time Sync

Accurate time is critical for correlation across the fleet — misaligned clocks break brute-force/threshold-based detection rules.

```bash
sudo apt install chrony -y
sudo systemctl enable chrony --now
chronyc tracking
```
