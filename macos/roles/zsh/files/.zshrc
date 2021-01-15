_PATH="$("$HOME/.pathensure/pathensure.sh" "$HOME/.pathensure/entries.txt")"
echo 'Setting $PATH to '"${_PATH}"
export PATH="${_PATH}"
