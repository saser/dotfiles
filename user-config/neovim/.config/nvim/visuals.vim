" This file is for settings that (more or less) only affects how vim _looks_,
" and does not add any certain functionality.

" I always use dark terminals.
set background=dark

" The base16 set of colorschemes has some quirkiness around 256 color terminals
" that I have never understood. What I know is that I _do_ use the 256
" variations for my terminal colorschemes, and thus I follow the recommendations
" given in the README of the vim plugin for base16 (`chriskempson/base16-vim`).
let base16colorspace=256
colorscheme base16-materia
