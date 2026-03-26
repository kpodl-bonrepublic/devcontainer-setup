#!/bin/bash
set -e
OPENCODE_CONFIG_DIR=~/opencode/config
TARGET_OPENCODE_CONFIG_DIR=~/.config/opencode
OPENCODE_STATE_DIR=~/opencode/state
TARGET_OPENCODE_STATE_DIR=~/.local/state/opencode
OPENCODE_SHARE_DIR=~/opencode/share
TARGET_OPENCODE_SHARE_DIR=~/.local/share/opencode

. $(dirname ${0})/common.lib
ensure_directories_exists "${OPENCODE_CONFIG_DIR}" "${OPENCODE_STATE_DIR}"
setup_link "${OPENCODE_CONFIG_DIR}" "${TARGET_OPENCODE_CONFIG_DIR}"
setup_link "${OPENCODE_STATE_DIR}" "${TARGET_OPENCODE_STATE_DIR}"
setup_link "${OPENCODE_SHARE_DIR}" "${TARGET_OPENCODE_SHARE_DIR}"