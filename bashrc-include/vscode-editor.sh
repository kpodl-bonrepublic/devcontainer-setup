# Use latest created IPC socket
_latest_ipc_socket=$(ls -t /tmp/vscode-ipc-* | head -1)

if [ -n "${_latest_ipc_socket}" -a ! -v VSCODE_IPC_HOOK_CLI ]; then
    _latest_vscode_dir=$(find -L ~/.vscode-server/bin/ -maxdepth 1 -mindepth 1 -type d | xargs ls -dt)
    _code_binary="${_latest_vscode_dir}/bin/remote-cli/code"
    if [ -x "${_code_binary}" ]; then
        export VSCODE_IPC_HOOK_CLI="${_latest_ipc_socket}"
        export EDITOR="${_code_binary} --wait"
    fi
    unset _latest_vscode_dir _code_binary
fi

unset _latest_ipc_socket
