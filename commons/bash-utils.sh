#!/bin/bash

SCRIPT_PATH=$(dirname "$(realpath "${BASH_SOURCE[0]}")")

CACHE_PATH="${SCRIPT_PATH}/.cache"
BASH_UTILS="${CACHE_PATH}/bash-utils.sh"
if [ ! -f "$BASH_UTILS" ]; then
  mkdir -p "${CACHE_PATH}"
  curl -s "https://raw.githubusercontent.com/danielaauriema/cloud-utils/refs/heads/main/bash/src/bash-utils.sh" > "${BASH_UTILS}"
fi
