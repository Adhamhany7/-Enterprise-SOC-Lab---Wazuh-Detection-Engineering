# Wazuh Configuration

## Core `ossec.conf` Adjustments

Key sections customized for this lab (path: `/var/ossec/etc/ossec.conf`):

```xml
<global>
  <jsonout_output>yes</jsonout_output>
  <alerts_log>yes</alerts_log>
  <logall>no</logall>
</global>

<remote>
  <connection>secure</connection>
  <port>1514</port>
  <protocol>tcp</protocol>
</remote>

<!-- Suricata eve.json ingestion -->
<localfile>
  <log_format>json</log_format>
  <location>/var/log/suricata/eve.json</location>
</localfile>
```

## Distributed Cluster Design (~300–350 endpoints)

For production scale, a single all-in-one node does not hold. Recommended layout:

| Tier                | Nodes | Notes                                                    |
| -------------------- | ----- | ---------------------------------------------------------- |
| Wazuh Indexer cluster | 3     | Odd number for quorum; dedicated master-eligible nodes    |
| Wazuh Manager cluster | 2+    | Master + worker(s), agents load-balanced across workers   |
| Wazuh Dashboard       | 1–2   | Behind a reverse proxy/load balancer with TLS termination |

Manager cluster config (`/var/ossec/etc/ossec.conf` on each manager node):

```xml
<cluster>
  <name>wazuh-cluster</name>
  <node_name>manager-01</node_name>
  <node_type>master</node_type>
  <key>CLUSTER_KEY_HERE</key>
  <port>1516</port>
  <bind_addr>0.0.0.0</bind_addr>
  <nodes>
    <node>10.0.0.11</node>
  </nodes>
  <hidden>no</hidden>
  <disabled>no</disabled>
</cluster>
```

## JVM / Indexer Heap Tuning

For indexer nodes with 16 GB RAM, set heap to ~50% of available RAM (never exceed 32 GB even on larger boxes):

```
# /etc/wazuh-indexer/jvm.options.d/heap.options
-Xms8g
-Xmx8g
```

## Log Retention

Configure Index State Management (ISM) policies on the indexer to roll over and delete indices past the retention window, keeping disk usage predictable at scale.

## Active Response

Active response is used to trigger YARA scans automatically when FIM detects a new/modified file (see `07-YARA-Malware-Detection/wazuh-integration.md`) and to enrich hits via the VirusTotal integration (see `08-VirusTotal-Threat-Intelligence/integration.md`).
