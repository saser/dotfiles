" Initialize vim-plug. In order for this to work, vim-plug must be correctly
" loaded (which should be done by `init.vim`).
call plug#begin()

" Just basic, sensible vim settings.
Plug 'tpope/vim-sensible'

" --- LANGUAGE SPECIFIC PLUGINS ---

Plug 'lervag/vimtex'

" Finalize vim-plug, causing the plugins to actually be loaded and managed by
" vim-plug.
call plug#end()
