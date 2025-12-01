# 🐧 Linux – Server Setup & Automation

## DevOps Learning Roadmap (With Hyperlinks)

### 📘 **Levels Overview**

* [Level 1 – Basic (Foundational Skills)](#level-1--basic-foundational-skills)
* [Level 2 – Intermediate (Daily-devops-tasks)](#level-2--intermediate-daily-devops-tasks)
* [Level 3 – Advanced (Production-ready-linux-admin)](#level-3--advanced-production-ready-linux-admin)

---

---

## 🔹 **Level 1 – Basic (Foundational Skills)**

<a id="level-1--basic-foundational-skills"></a>

### ✔️ Set up Users & Groups

```bash
sudo groupadd devteam
sudo useradd -m -g devteam devuser1
sudo passwd devuser1
```

### ✔️ Manage Project Directory Permissions

```bash
sudo mkdir -p /opt/myapp
sudo chown -R devuser1:devteam /opt/myapp
sudo chmod -R 770 /opt/myapp
```

### ✔️ Install Required Packages

```bash
sudo apt update
sudo apt install -y git nginx default-jdk
```

### ✔️ Check System Info

```bash
free -h        # Memory
lscpu          # CPU
df -h          # Disk
```

---

---

## 🔹 **Level 2 – Intermediate (Daily DevOps Tasks)**

<a id="level-2--intermediate-daily-devops-tasks"></a>

### ✔️ Cron Backup Automation

```bash
crontab -e
# Daily backup at 1 AM
0 1 * * * tar -czf /backup/app_$(date +\%F).tar.gz /opt/myapp
```

### ✔️ Shell Scripts

**log_cleanup.sh**

```bash
#!/bin/bash
find /var/log/myapp/ -type f -name "*.log" -mtime +7 -delete
```

**service_restart.sh**

```bash
#!/bin/bash
sudo systemctl restart nginx
```

**health_check.sh**

```bash
#!/bin/bash
systemctl is-active nginx
df -h | grep "/dev/sda1"
```

### ✔️ Manage Logs Under `/var/log`

```bash
sudo ls -lh /var/log
sudo tail -f /var/log/syslog
```

### ✔️ Monitor System Performance

```bash
top
htop
journalctl -u nginx --since "10 min ago"
```

---

---

## 🔹 **Level 3 – Advanced (Production-Ready Linux Admin)**

<a id="level-3--advanced-production-ready-linux-admin"></a>

### ✔️ Custom Systemd Service

`/etc/systemd/system/myapp.service`

```ini
[Unit]
Description=My Application
After=network.target

[Service]
ExecStart=/usr/bin/java -jar /opt/myapp/app.jar
User=devuser1
Restart=always

[Install]
WantedBy=multi-user.target
```

```bash
sudo systemctl daemon-reload
sudo systemctl enable --now myapp
```

### ✔️ SSH Hardening

```bash
sudo nano /etc/ssh/sshd_config
# Disable root login
PermitRootLogin no
# Disable password auth
PasswordAuthentication no
```

### ✔️ LVM Setup

```bash
sudo pvcreate /dev/sdb
sudo vgcreate appvg /dev/sdb
sudo lvcreate -L 20G -n applv appvg
sudo mkfs.ext4 /dev/appvg/applv
sudo mount /dev/appvg/applv /opt/myapp
```

### ✔️ Firewall Rules

```bash
sudo ufw allow 22
sudo ufw allow 80
sudo ufw allow 443
sudo ufw enable
```

### ✔️ Logrotate for App Logs

`/etc/logrotate.d/myapp`

```conf
/var/log/myapp/*.log {
    daily
    rotate 7
    compress
    missingok
    notifempty
}
```

---


