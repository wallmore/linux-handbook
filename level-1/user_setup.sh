#!/usr/bin/env bash
#
# user_setup.sh
# Idempotent script to create dev group and users, and set up SSH access.
# Usage: sudo ./user_setup.sh

set -euo pipefail

DEV_GROUP="devteam"
USER_LIST=("alice" "bob" "charlie")  # change as needed
DEFAULT_SHELL="/bin/bash"

create_group() {
  if getent group "$DEV_GROUP" >/dev/null; then
    echo "Group $DEV_GROUP already exists"
  else
    echo "Creating group: $DEV_GROUP"
    groupadd "$DEV_GROUP"
  fi
}

create_user() {
  local user="$1"

  if id "$user" >/dev/null 2>&1; then
    echo "User $user already exists, ensuring group membership..."
    usermod -aG "$DEV_GROUP" "$user"
  else
    echo "Creating user: $user"
    useradd -m -s "$DEFAULT_SHELL" -G "$DEV_GROUP" "$user"
    passwd -l "$user"  # lock password; SSH key-based auth only (you can remove if not desired)
  fi

  local ssh_dir="/home/$user/.ssh"
  if [[ ! -d "$ssh_dir" ]]; then
    mkdir -p "$ssh_dir"
    chmod 700 "$ssh_dir"
    chown "$user:$user" "$ssh_dir"
  fi

  # Optional: drop a default authorized_keys file
  local auth_keys="$ssh_dir/authorized_keys"
  if [[ ! -f "$auth_keys" ]]; then
    touch "$auth_keys"
    chmod 600 "$auth_keys"
    chown "$user:$user" "$auth_keys"
    echo "# Add $user's SSH public key here" >> "$auth_keys"
  fi
}

main() {
  if [[ $EUID -ne 0 ]]; then
    echo "Please run as root (sudo)." >&2
    exit 1
  fi

  create_group

  for u in "${USER_LIST[@]}"; do
    create_user "$u"
  done

  echo "User & group setup complete."
}

main "$@"

