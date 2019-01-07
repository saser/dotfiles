" Since the terminal I mostly use, urxvt, does not report focus events, we
" switch this option off.
let g:gitgutter_terminal_reports_focus = 0

" Set up an additional autocommand, so that the gutter signs are updated when
" a buffer is written.
autocmd BufWritePost,FileWritePost * call gitgutter#all(1)

map <A-]> <Plug>GitGutterNextHunk
map <A-[> <Plug>GitGutterPrevHunk
