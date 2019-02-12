" Always use the `-shell-escape` flag when compiling. This should probably not
" produce any issues when compiling LaTeX 'normally', but it is required for use
" with packages such as `minted`.
let g:vimtex_compiler_latexmk = {
\   'options': [
\       '-shell-escape',
\       '-verbose',
\       '-file-line-error',
\       '-synctex=1',
\       '-interaction=nonstopmode',
\   ],
\}
