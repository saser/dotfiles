" Initialize vim-plug. In order for this to work, vim-plug must be correctly
" loaded (which should be done by `init.vim`).
call plug#begin()

" Just basic, sensible vim settings.
Plug 'tpope/vim-sensible'

" --- EDITOR PLUGINS ---

" Includes commands and keymaps for surrounding stuff with delimiters.
Plug 'tpope/vim-surround'

" Repeat plugin actions. I use it mostly for the actions provided by
" `vim-surround` above.
Plug 'tpope/vim-repeat'

" Plugin providing mappings for handling comments in code.
Plug 'tpope/vim-commentary'

" Do more intelligent editing with delimiters.
Plug 'Raimondi/delimitMate'

" Adds a lot of extra functionality for moving around buffers, by providing
" handy mappings and motions.
Plug 'easymotion/vim-easymotion'

" Detects and provides fixes for unneeded whitespace.
Plug 'ntpeters/vim-better-whitespace'

" Better pasting functionality, that tries its best to adjust the indentation
" of the pasted content to the surrounding context/code.
Plug 'sickill/vim-pasta'

" Aligning things around stuff. Useful for things like Haskell (where you
" often want to align things around '=' or '->'), or tables in LaTeX.
Plug 'junegunn/vim-easy-align'

" I often find myself wanting to swap things around, which this plugin
" provides mappings for.
Plug 'tommcdo/vim-exchange'

" --- FILE SYSTEM AND VERSION CONTROL PLUGINS ---

" A good vim plugin for the `fzf` fuzzy finder that I usually keep installed on
" my system anyway.
" NOTE: the `fzf.vim` plugin depends on the basic vim integration included with
" the `fzf` distribution itself. Thus we need to install the `fzf` binary
" itself, along with its vim integration, in a path where vim can find it. As
" stated above, I usually install `fzf` on my system anyway, so this results in
" two of that binary. It seems that the binary installed using Plug does not
" interfere with the system installation, however. Fingers crossed this keeps on
" working.
Plug 'junegunn/fzf', { 'do': './install --bin' } | Plug 'junegunn/fzf.vim'

" Really, really good Git integration for vim.
Plug 'tpope/vim-fugitive'

" Shows a gutter of changed hunks, and alos provides commands for staging and
" unstaging hunks.
Plug 'airblade/vim-gitgutter'

" NERDTree is a very nice file system tree explorer.
Plug 'scrooloose/NERDTree'

" --- LANGUAGE SPECIFIC PLUGINS ---

" Syntax checker plugin for vim. Does not do any actual syntax checking
" itself, but uses external tools.
Plug 'w0rp/ale'

" Completion engine, to actually provide some completion.
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" A good plugin for editing LaTeX, featuring continuous compilation and other
" stuff.
Plug 'lervag/vimtex'

" Plugin for the Rust programming language. Provides a few nice features such
" as auto-formatting files on save, etc.
Plug 'rust-lang/rust.vim'

" --- VISUAL PLUGINS ---

" I mostly use the base16 colorschemes, so I naturally want to use it for vim as
" well.
Plug 'chriskempson/base16-vim'

" Sometimes I like to use the Solarized colorschemes as well.
Plug 'altercation/vim-colors-solarized'

" A really nice statusline, along with its themes (for integrating with the
" `base16-vim` colorschemes that I use.
Plug 'vim-airline/vim-airline-themes' | Plug 'vim-airline/vim-airline'

" Finalize vim-plug, causing the plugins to actually be loaded and managed by
" vim-plug.
call plug#end()
