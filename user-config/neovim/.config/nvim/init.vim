" Initialize Neovim on startup. Delegates to loading plugins, loading additional
" settings for plugins, and generally configuring Neovim with keymaps and other
" settings.

" First of all, to manage plugins at all, vim-plug must be loaded. It is
" contained within this repository as a git submodule.
runtime bundle/vim-plug/plug.vim

" Delegate to another script that will define and load the plugins.
runtime plugins.vim

" Load any extra configuration for plugins, such as plugin-specific keymaps.
runtime! extra/*.vim

" Load my custom functionality settings.
runtime settings.vim

" Load keymaps that are plugin-agnostic, i.e. that can be used without any
" plugins installed whatsoever.
runtime keymaps.vim
