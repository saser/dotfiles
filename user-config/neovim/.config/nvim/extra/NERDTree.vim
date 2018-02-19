" Use <Leader><Tab> as a quick keymap to open NERDTree.
" focusing on the current file.
map <silent> <leader><Tab> :NERDTreeToggle<CR>

" Use <Leader>f<Tab> to do the same as above, but instantly find and focus on
" the file from the current vim buffer.
map <silent> <leader>f<Tab> :NERDTreeFind<CR>
