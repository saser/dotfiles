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

" A good plugin for editing LaTeX, featuring continuous compilation and other
" stuff.
Plug 'lervag/vimtex'

" --- VISUAL PLUGINS ---

" I mostly use the base16 colorschemes, so I naturally want to use it for vim as
" well.
Plug 'chriskempson/base16-vim'

" A really nice statusline, along with its themes (for integrating with the
" `base16-vim` colorschemes that I use.
Plug 'vim-airline/vim-airline-themes' | Plug 'vim-airline/vim-airline'

" Finalize vim-plug, causing the plugins to actually be loaded and managed by
" vim-plug.
call plug#end()
