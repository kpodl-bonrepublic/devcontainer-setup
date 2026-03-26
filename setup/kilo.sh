#!/bin/bash
set -ex
KILO_CONFIG_DIR=~/kilo/config
TARGET_KILO_CONFIG_DIR=~/.config/kilo
KILO_STATE_DIR=~/kilo/state
TARGET_KILO_STATE_DIR=~/.local/state/kilo
KILO_SHARE_DIR=~/kilo/share
TARGET_KILO_SHARE_DIR=~/.local/share/kilo

. $(dirname ${0})/common.lib
ensure_directories_exists "${KILO_CONFIG_DIR}" "${KILO_STATE_DIR}"
setup_link "${KILO_CONFIG_DIR}" "${TARGET_KILO_CONFIG_DIR}"
setup_link "${KILO_STATE_DIR}" "${TARGET_KILO_STATE_DIR}"
setup_link "${KILO_SHARE_DIR}" "${TARGET_KILO_SHARE_DIR}"