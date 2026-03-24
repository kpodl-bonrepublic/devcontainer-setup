# Shared tools. Needs to be sourced

function setup_link() {
    local SOURCE_DIR="${1}"
    local TARGET_DIR="${2}"
    if [ ! -d ${TARGET_DIR} ]; then
        mkdir -p "$(dirname ${TARGET_DIR})"
        ln -s "${SOURCE_DIR}" "${TARGET_DIR}"
    fi
}

function ensure_directories_exists() {
    local missing=()
    for dir in "$@"; do
        if [ ! -d "${dir}" ]; then
            missing+=("${dir}")
        fi
    done
    if [ ${#missing[@]} -gt 0 ]; then
        echo "Expected directories ${missing[*]} but they don't exist" >&2
        exit 1
    fi
}
