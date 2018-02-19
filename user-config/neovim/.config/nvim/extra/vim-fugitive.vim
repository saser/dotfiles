" Open the Gstatus window.
map <silent> <leader>gs :Gstatus<CR>

" Add the current file (just like `git add`).
map <silent> <leader>ga :Gwrite<CR>

" Commit what is currently staged.
map <silent> <leader>gc :Gcommit<CR>

" View a vertical diff against the currently staged version of this file.
map <silent> <leader>gd :Gvdiff<CR>

" Perform a push. 'pu' is for 'push up'.
map <silent> <leader>gpu :Gpush<CR>

" Perform a pull. 'pd' is for 'pull down'.
map <silent> <leader>gpd :Gpull<CR>
