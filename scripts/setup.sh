#!/bin/bash

BASE_DIR="$(dirname $0)"
SETUP_DIR="$(realpath "${BASE_DIR}/../setup")"
INCLUDE_DIR="$(realpath "${BASE_DIR}/../bashrc-include")"

echo "Setup tools..."

for script in "${SETUP_DIR}"/*.sh; do
    [ -x "${script}" ] && ${script}
    if [ $? -eq 0 ]; then
        echo "✅ $(basename ${script})"
    else
        echo "❌ $(basename ${script})"
    fi
done

tools_in_bashrc () {
    grep -- '-- DEVCONTAINER TOOLS --' ~/.bashrc > /dev/null && return 1 || return 0
}

tools_in_bashrc && TOOLS_IN_BASHRC=1

if [ ! -f ~/.bashrc -o "${TOOLS_IN_BASHRC:-0}" == 1 ]; then
    cat <<EOF >> ~/.bashrc
# -- DEVCONTAINER TOOLS --
for _devcontainer_include_file in "${INCLUDE_DIR}/"*.sh; do
    . "\${_devcontainer_include_file}"
done
EOF
fi


echo "✅ Tool setup done."
