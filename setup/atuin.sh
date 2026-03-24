#!/bin/bash
set -ex
ATUIN_BIN_DIR=~/.atuin
ATUIN_CONFIG_DIR=~/atuin/config
ATUIN_CONFIG_TARGET_DIR=~/.config/atuin
ATUIN_DATA_DIR=~/atuin/data
ATUIN_DATA_TARGET_DIR=~/.local/share/atuin

. $(dirname ${0})/common.sh

if [ ! -d "${ATUIN_BIN_DIR}" -o ! -d "${ATUIN_CONFIG_DIR}" -o ! -d "${ATUIN_DATA_DIR}" ]; then
    echo "Expected directories ${ATUIN_BIN_DIR}, ${ATUIN_CONFIG_DIR}, and ${ATUIN_DATA_DIR} do not exist!" 1>&2
    exit 1 
fi

setup_link "${ATUIN_DATA_DIR}" "${ATUIN_DATA_TARGET_DIR}"
setup_link "${ATUIN_CONFIG_DIR}" "${ATUIN_CONFIG_TARGET_DIR}"
