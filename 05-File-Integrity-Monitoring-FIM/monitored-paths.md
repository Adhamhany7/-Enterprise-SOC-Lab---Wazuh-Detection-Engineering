# Monitored Paths

## Linux

| Path                 | Reason                                             |
| ---------------------- | ----------------------------------------------------- |
| `/etc`                 | System/service configuration — persistence, tampering |
| `/usr/bin`, `/usr/sbin` | Binary replacement / trojanized system tools           |
| `/var/www/html`        | Web shell drops, defacement                            |
| `/root/.ssh`            | Authorized_keys tampering for persistence               |

## Windows

| Path                                        | Reason                                        |
| ---------------------------------------------- | ------------------------------------------------ |
| `C:\Windows\System32\drivers\etc`               | Hosts file tampering (DNS redirection)           |
| `C:\Users\%USERNAME%\Downloads`                 | Payload staging area                              |
| `C:\Program Files`                              | Unauthorized software installation                |
| `C:\Windows\System32\Tasks`                     | Scheduled task persistence                        |

## Exclusions

Paths excluded from FIM to reduce noise: package manager caches (`apt`/`dnf`), browser profile temp directories, log rotation working files, and Windows Update staging folders.

## Review Cadence

Monitored-path list is reviewed periodically as the lab evolves — new services or applications deployed to endpoints get their config/binary paths added here before go-live.
