#!/bin/bash
set -e
UV_DIR=~/project-tools/uv
TARGET_UV_DIR=~/.local/share/uv/tools
PROTO_DIR=~/project-tools/proto
TARGET_PROTO_DIR=~/.proto

. $(dirname ${0})/common.lib
ensure_directories_exists "${UV_DIR}" "${PROTO_DIR}"
setup_link "${UV_DIR}" "${TARGET_UV_DIR}"
setup_link "${PROTO_DIR}" "${TARGET_PROTO_DIR}"
