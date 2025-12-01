✔️ Set up Users & Groups

sudo groupadd devteam

sudo useradd -m -g devteam devuser1

sudo passwd devuser1

✔️ Manage Project Directory Permissions

sudo mkdir -p /opt/myapp

sudo chown -R devuser1:devteam /opt/myapp

sudo chmod -R 770 /opt/myapp

✔️ Install Required Packages

sudo apt update

sudo apt install -y git nginx default-jdk

✔️ Check System Info

free -h        # Memory

lscpu          # CPU

df -h          # Disk
