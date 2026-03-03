#!/bin/bash
set -e

KIROCLI_BIN_DIR=~/kirocli
KIROCLI_DATA_DIR=~/kirocli-data

KIROCLI_DATA_TARGET_DIR=~/.local/share/kiro-cli

if [ ! -d "${KIROCLI_BIN_DIR}" -o ! -d "${KIROCLI_DATA_DIR}" ]; then
    echo "Expected directories ${KIROCLI_BIN_DIR} and ${KIROCLI_DATA_DIR} do not exist!" 1>&2
    exit 1 
fi

if [ ! -d "${KIROCLI_DATA_TARGET_DIR}" ]; then
    mkdir -p ~/.local/share
    ln -s "${KIROCLI_DATA_DIR}" "${KIROCLI_DATA_TARGET_DIR}"
fi
