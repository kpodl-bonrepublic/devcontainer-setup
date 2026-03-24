#!/bin/bash
set -e

KIROCLI_BIN_DIR=~/kirocli
KIROCLI_DATA_DIR=~/kirocli-data

KIROCLI_DATA_TARGET_DIR=~/.local/share/kiro-cli

. $(dirname ${0})/common.lib

ensure_directories_exists "${KIROCLI_BIN_DIR}" "${KIROCLI_DATA_DIR}"
setup_link "${KIROCLI_DATA_DIR}" "${KIROCLI_DATA_TARGET_DIR}"
