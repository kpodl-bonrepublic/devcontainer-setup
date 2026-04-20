#!/bin/bash
set -euo pipefail
UV_DIR=~/project-tools/uv
TARGET_UV_DIR=~/.local/share/uv/tools
PROTO_DIR=~/project-tools/proto
TARGET_PROTO_DIR=~/.proto

. $(dirname ${0})/common.lib
ensure_directories_exists "${UV_DIR}" "${PROTO_DIR}"
setup_link "${UV_DIR}" "${TARGET_UV_DIR}"
setup_link "${PROTO_DIR}" "${TARGET_PROTO_DIR}"

# Link uv tool binaries to ~/.local/bin
# Reinstall binaries for all uv tools by re-exposing their entry points

UV_BIN_DIR=~/.local/bin
UV_TOOL_DIR=~/.local/share/uv/tools

[[ ! -d "${UV_BIN_DIR}" ]] && mkdir -p "${UV_BIN_DIR}"

while IFS= read -r tool; do
    tool_dir="$UV_TOOL_DIR/$tool"
    [[ ! -d "$UV_TOOL_DIR/$tool" ]] && continue

    echo "Processing: $tool"

    # Find the tool's venv bin dir
    tool_bin="$tool_dir/bin"

    if [[ ! -d "$tool_bin" ]]; then
        echo "  WARNING: bin dir not found for $tool, skipping"
        continue
    fi

    # Re-link all executables
    for exe in "$tool_bin"/*; do
        name="$(basename "$exe")"
        link="$UV_BIN_DIR/$name"

        # Skip non-executable files (e.g. activate scripts, .py files) and symlinks
        [[ -x "$exe" ]] || continue
        [[ "$name" == python* ]] && continue
        [[ "$name" == activate* ]] && continue
        [[ -L "$exe" ]] && continue

        echo "  Linking: $name -> $exe"
        ln -sf "$exe" "$link"
    done

done < <(ls "${UV_TOOL_DIR}")

echo "Done."

