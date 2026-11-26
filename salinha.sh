#!/bin/bash
set -e

export TMPDIR="${XDG_RUNTIME_DIR}/app/${FLATPAK_ID}"
mkdir -p "${TMPDIR}"

EXTRA_ARGS=()

if [[ "${XDG_SESSION_TYPE}" == "wayland" ]]; then
  EXTRA_ARGS+=(
    "--ozone-platform-hint=auto"
    "--enable-features=WaylandWindowDecorations,WebRTCPipeWireCapturer"
  )
fi

exec zypak-wrapper /app/salinha/salinha "${EXTRA_ARGS[@]}" "$@"