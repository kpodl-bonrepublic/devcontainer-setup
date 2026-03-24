# Shared tools. Needs to be sourced

function setup_link() {
    local SOURCE_DIR="${1}"
    local TARGET_DIR="${2}"
    if [ ! -d ${TARGET_DIR} ]; then
        mkdir -p "$(dirname ${TARGET_DIR})"
        ln -s "${SOURCE_DIR}" "${TARGET_DIR}"
    fi
}
