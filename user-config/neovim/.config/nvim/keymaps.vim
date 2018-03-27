" Basic keymaps for everyday use. These keymaps are independent of any
" installed plugins (with a single exception, see the <C-c> binding below).

" I really like having <leader> bound to backslash, since it is so
" conveniently reachable using my right pinky finger. At least on Swedish
" keyboard layouts (hardware layouts, not software layouts).
let mapleader = '\'

" Handy keymaps for quickly writing and closing buffers.
map <silent> W :w<CR>
map <silent> Q :q<CR>

" Make Y behave in the same way as the D, C, and S mappings.
map <silent> Y y$

" Window navigation. Allows for quick navigation between buffers, without
" having to press <C-w> all the time.
noremap <silent> <C-h> <C-w><C-h>
noremap <silent> <C-j> <C-w><C-j>
noremap <silent> <C-k> <C-w><C-k>
noremap <silent> <C-l> <C-w><C-l>

" Map <C-c> to clear the highlighting of searches and perform a diffupdate.
" This was yanked from Tim Pope's 'vim-sensible' plugin (more specifically,
" the version found here:
" https://github.com/tpope/vim-sensible/blob/9e91be7e0fb42949831fe3161ef583363648aa58/plugin/sensible.vim).
" Some slight modifications by me:
" - I use <C-c> instead of <C-L>, since the latter is already mapped for
"   window navigation
" - I have removed the last <C-c>, since I do not want to perform a 'normal'
"   <C-c> after clearing and updating (since nvim thinks I'm trying to use
"   <C-c> to exit, so it plays a bell and displays a message)
if maparg('<C-c>', 'n') ==# ''
  nnoremap <silent> <C-c> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR>
endif
