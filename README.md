# linux-handbook

Here are Level-1 (Basic) tasks for a DevOps engineer automating Linux server setup, with clear command examples and explanation. 

---

# ✅ **Level 1 – Basic (Foundational Skills)**

### **1. Set up users and groups for the dev team**

#### ➤ Create a group

```bash
sudo groupadd devteam
```

#### ➤ Create users and add to group

```bash
sudo useradd -m -s /bin/bash alice
sudo useradd -m -s /bin/bash bob

sudo usermod -aG devteam alice
sudo usermod -aG devteam bob
```

#### ➤ Set passwords (interactive)

```bash
sudo passwd alice
sudo passwd bob
```

---

### **2. Manage permissions for project directories**

#### ➤ Create project directory

```bash
sudo mkdir -p /opt/projectX
```

#### ➤ Set group ownership to devteam

```bash
sudo chgrp -R devteam /opt/projectX
```

#### ➤ Give group read/write/execute access

```bash
sudo chmod -R 2775 /opt/projectX
```

Explanation:

* `2` → sets **setgid** so new files inherit the devteam group
* `775` → `rwx` for owner and group, read/execute for others

---

### **3. Install required packages (git, nginx, java)**

#### **Ubuntu/Debian**

```bash
sudo apt update
sudo apt install -y git nginx openjdk-17-jdk
```

#### **RHEL/CentOS/AlmaLinux**

```bash
sudo dnf install -y git nginx java-17-openjdk
```

#### **Check versions**

```bash
git --version
nginx -v
java -version
```

---

### **4. Check system information (memory, CPU, disk)**

#### ➤ Memory

```bash
free -h
```

#### ➤ CPU info

```bash
lscpu
```

#### ➤ Disk usage

```bash
df -h
```

#### ➤ Real-time performance

```bash
top
# or
htop
```


