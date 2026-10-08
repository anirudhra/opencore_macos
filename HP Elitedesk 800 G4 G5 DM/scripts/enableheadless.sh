#!/bin/bash
set -euo pipefail

DOMAIN="com.apple.AppleGVA"
MODE="${1:-}"
DEFAULTS="/usr/bin/defaults"

case "$MODE" in
intel | amd | status) ;;
*)
  printf 'Usage: %s {intel|amd|status}\n' "$0"
  exit 1
  ;;
esac

if [ "$EUID" -eq 0 ]; then
  printf 'Run as your normal user, not with sudo.\n' >&2
  exit 1
fi

if [ "$MODE" = "status" ]; then
  "$DEFAULTS" read "$DOMAIN" || true
  exit 0
fi

BACKUP_DIR="$HOME/Library/Application Support/VideoCodecSwitch/backups"
/bin/mkdir -p "$BACKUP_DIR"

BACKUP_RUN=$(/usr/bin/mktemp -d "$BACKUP_DIR/change.XXXXXX")
BACKUP="$BACKUP_RUN/AppleGVA.plist"

if ! "$DEFAULTS" export "$DOMAIN" "$BACKUP"; then
  printf 'Backup failed. No settings were changed.\n' >&2
  exit 1
fi

on_error() {
  printf '\nA command failed; settings may be partially changed.\n' >&2
  printf 'Restore with:\n' >&2
  printf '  /usr/bin/defaults import %s "%s"\n' "$DOMAIN" "$BACKUP" >&2
}
trap on_error ERR

delete_if_present() {
  local key="$1"
  if "$DEFAULTS" read "$DOMAIN" "$key" >/dev/null 2>&1; then
    "$DEFAULTS" delete "$DOMAIN" "$key"
  fi
}

if [ "$MODE" = "intel" ]; then
  for KEY in \
    gvaForceAMDAVCDecode \
    gvaForceAMDAVCEncode \
    gvaForceAMDHEVCDecode \
    gvaForceAMDKE; do
    delete_if_present "$KEY"
  done

  "$DEFAULTS" write "$DOMAIN" forceIntel -boolean true
else
  "$DEFAULTS" write "$DOMAIN" forceIntel -boolean false
  "$DEFAULTS" write "$DOMAIN" gvaForceAMDAVCDecode -boolean true
  "$DEFAULTS" write "$DOMAIN" gvaForceAMDAVCEncode -boolean true
  "$DEFAULTS" write "$DOMAIN" gvaForceAMDHEVCDecode -boolean true
  "$DEFAULTS" write "$DOMAIN" gvaForceAMDKE -boolean false
fi

printf '\nRequested codec preference: %s\n' "$MODE"
printf 'Backup: %s\n\n' "$BACKUP"
"$DEFAULTS" read "$DOMAIN"

printf '\nReboot manually before testing the new selection.\n'
printf 'Preferences changed; GPU hardware was not disabled.\n'
