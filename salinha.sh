#!/bin/bash
set -e

EXTRA_ARGS=()

if [[ "${XDG_SESSION_TYPE}" == "wayland" ]]; then
  EXTRA_ARGS+=(
    "--ozone-platform-hint=auto"
    "--enable-features=WaylandWindowDecorations,WebRTCPipeWireCapturer"
  )
fi

exec zypak-wrapper /app/extra/salinha/salinha "${EXTRA_ARGS[@]}" "$@"