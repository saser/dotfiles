JOINED_PATH="$("$HOME/.joinpaths/joinpaths.sh" "$HOME/.joinpaths/paths.txt")"
echo 'Setting $PATH to '"${JOINED_PATH}"
export PATH="${JOINED_PATH}"
