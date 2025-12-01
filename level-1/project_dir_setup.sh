#!/usr/bin/env bash
#
# project_dir_setup.sh
# Sets up project directories with proper ownership & permissions.
# Usage: sudo ./project_dir_setup.sh

set -euo pipefail

PROJECT_ROOT="/srv/myapp"
DEV_GROUP="devteam"

main() {
  if [[ $EUID -ne 0 ]]; then
    echo "Please run as root (sudo)." >&2
    exit 1
  fi

  mkdir -p "$PROJECT_ROOT"/{code,logs,data,tmp}

  chown -R root:"$DEV_GROUP" "$PROJECT_ROOT"
  chmod -R 2775 "$PROJECT_ROOT"  # setgid bit on dirs; group inherits

  find "$PROJECT_ROOT" -type d -exec chmod 2775 {} \;
  find "$PROJECT_ROOT" -type f -exec chmod 664 {} \;

  echo "Project directory setup done at $PROJECT_ROOT."
}

main "$@"

