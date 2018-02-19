" I used to use the plugin kien/ctrp.vim, so I'm used to the <C-p> mapping, so
" I want to use it for fzf.vim as well.
" Usually I am working in git repositories, and then I don't want to open
" files that are ignored by git, so that is why my most common mapping is to
" :GitFiles.
nmap <C-p> :GitFiles<CR>

" Imitate mappings from ctrp.vim.
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-s': 'split',
    \ 'ctrl-v': 'vsplit' }

" Since this plugin can directly call ag and navigate between the results, it
" kind of makes sense to have <C-f> as project-wide regex search (note the
" trailing space that is needed).
nmap <C-f> :Ag 

" F1 is a common keymap for finding help in many programs, so I use it to
" launch the :Helptags command from fzf.vim, that is way better than the
" ordinary :help command.
nmap <F1> :Helptags<CR>
