# File Integrity Monitoring (FIM) Configuration

Wazuh's **Syscheck** module is used for FIM, watching critical paths for creation, modification, and deletion events on both Windows and Linux endpoints.

## Linux Agent Configuration

```xml
<syscheck>
  <disabled>no</disabled>
  <frequency>43200</frequency> <!-- scan every 12h -->

  <directories check_all="yes" realtime="yes">/etc</directories>
  <directories check_all="yes" realtime="yes">/usr/bin,/usr/sbin</directories>
  <directories check_all="yes" realtime="yes">/var/www/html</directories>

  <ignore>/etc/mtab</ignore>
  <ignore>/etc/hosts.deny</ignore>

  <alert_new_files>yes</alert_new_files>
</syscheck>
```

## Windows Agent Configuration

```xml
<syscheck>
  <disabled>no</disabled>
  <directories check_all="yes" realtime="yes">C:\Windows\System32\drivers\etc</directories>
  <directories check_all="yes" realtime="yes">C:\Users\%USERNAME%\Downloads</directories>
  <directories check_all="yes" realtime="yes">C:\Program Files</directories>
  <alert_new_files>yes</alert_new_files>
</syscheck>
```

## Real-Time vs Scheduled

`realtime="yes"` is used on high-value paths (system config, web root) for immediate alerting; less critical paths rely on the scheduled scan to limit resource overhead on endpoints.

## Tuning False Positives

Log rotation files, package manager caches, and browser profile temp files were added to `<ignore>` rules after an initial noisy baseline period.
