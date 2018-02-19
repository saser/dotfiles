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

" --- LANGUAGE SPECIFIC PLUGINS ---

" A good plugin for editing LaTeX, featuring continuous compilation and other
" stuff.
Plug 'lervag/vimtex'

" Finalize vim-plug, causing the plugins to actually be loaded and managed by
" vim-plug.
call plug#end()
