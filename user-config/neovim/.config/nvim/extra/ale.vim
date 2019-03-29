" Set up which linters to use. Note that there are a bunch of default linters
" that are used as well, in addition to the ones specified here. See the help
" section for `g:ale_linters` for more details.
"
" Installation:
" * `rls`: `cargo component add rls`
let g:ale_linters = {
\   'python': ['mypy'],
\   'rust': ['rls'],
\}

" Set up fixers.
"
" Installation:
" * `rustfmt`: `cargo component add rustfmt`. Note that this functionality is
"              also provided with the `rust.vim` plugin to Vim, but it seems
"              to interfere a bit with the linting provided by ALE. Hopefully
"              using `rustfmt` with ALE, instead of with `rust.vim`, resolves
"              this.
let g:ale_fixers = {
\   'python': ['black', 'isort'],
\   'rust': ['rustfmt'],
\}

" Run fixers on each save of a file. Since I mostly use fixers for
" autoformatting, such as `rustfmt`, this is harmless.
let g:ale_fix_on_save = 1
" ... except when I am in a fugitive buffer. Since a lot of fixers run on the
" event of a file being saved to disk, and fugitive buffers do not really have
" any underlying files, the fixers often fail and completely mess up e.g. the
" diff between the working directory and the index. In these buffers, a fixer
" can be run manually with `:ALEFix` (unless they require to be run on a file
" on disk, as some linters/fixers do).
autocmd BufEnter fugitive://* let b:ale_fix_on_save = 0

" By default, Ale runs `rls` with the `nightly` toolchain. However, this
" causes the `rls` integration to not work when editing a project using the
" `stable` toolchain, so by setting this variable to an empty string, it seems
" to work with the `stable` toolchain. However, I have not yet determined how
" well this works when using different toolchains for different projects -- I
" tend to mostly use the `stable` toolchain.
let g:ale_rust_rls_toolchain = ''
