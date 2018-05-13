" These are any kinds of settings that affect how Neovim functions, which are
" not keymaps nor visual settings.

" Integrate with the system clipboard, meaning that any yank, paste, delete
" etc commands interact with the same clipboard as the rest of the system. The
" exception is when you explicitly specify a register other than the default
" register used by vim, namely the " register.
set clipboard=unnamedplus

" Tab settings.
" - I want to expand tab to spaces.
" - I want to use 4 spaces as indent levels.
" - I want to let a single backspace remove an entire indent level.
" These settings enable the above behaviour.
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Enable mouse interaction by default.
set mouse+=a
