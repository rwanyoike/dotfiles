#!/usr/bin/env bash

set -euo pipefail

export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_DESKTOP=sway
export XDG_SESSION_TYPE=wayland

SESSION_TARGET=sway-session.target
SESSION_SHUTDOWN_TARGET=sway-session-shutdown.target
VARIABLES="DISPLAY SWAYSOCK WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_DESKTOP XDG_SESSION_TYPE"

if systemctl --user -q is-active ${SESSION_TARGET}; then
  echo "Another Sway session found; refusing to overwrite the variables"
  exit 1
fi

# shellcheck disable=SC2086
dbus-update-activation-environment --systemd ${VARIABLES}

systemctl --user reset-failed
# shellcheck disable=SC2086
systemctl --user import-environment ${VARIABLES}
systemctl --user start ${SESSION_TARGET}

function session_cleanup {
  systemctl --user start --job-mode=replace-irreversibly ${SESSION_SHUTDOWN_TARGET}
  # shellcheck disable=SC2086
  systemctl --user unset-environment ${VARIABLES}
}

trap session_cleanup INT TERM
swaymsg -t subscribe '["shutdown"]'
session_cleanup
