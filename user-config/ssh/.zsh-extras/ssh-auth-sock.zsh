# This should be equivalent to the systemd service. The `%t` in the path of the
# systemd service is equivalent to `${XDG_RUNTIME_DIR}` when using the user
# manager of systemd (i.e. `systemd --user`).
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
