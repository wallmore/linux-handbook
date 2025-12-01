#!/usr/bin/env bash
#
# install_packages.sh
# Installs basic packages for the app.
# Usage: sudo ./install_packages.sh

set -euo pipefail

detect_os() {
  if [[ -f /etc/os-release ]]; then
    . /etc/os-release
    echo "$ID"
  else
    echo "unknown"
  fi
}

install_debian() {
  apt-get update -y
  apt-get install -y git nginx openjdk-11-jdk
}

install_rhel() {
  yum install -y epel-release || true
  yum install -y git nginx java-11-openjdk-devel
}

main() {
  if [[ $EUID -ne 0 ]]; then
    echo "Please run as root (sudo)." >&2
    exit 1
  fi

  os_id=$(detect_os)
  case "$os_id" in
    ubuntu|debian)
      install_debian
      ;;
    centos|rhel|rocky|almalinux)
      install_rhel
      ;;
    *)
      echo "Unsupported OS: $os_id"
      exit 1
      ;;
  esac

  echo "Package installation complete."
}

main "$@"

