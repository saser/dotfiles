" Set up which linters to use. Note that there are a bunch of default linters
" that are used as well, in addition to the ones specified here. See the help
" section for `g:ale_linters` for more details.
"
" Installation:
" * `rls`: `cargo component add rls`
let g:ale_linters = {
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
\   'rust': ['rustfmt'],
\}

" Run fixers on each save of a file. Since I mostly use fixers for
" autoformatting, such as `rustfmt`, this is harmless.
let g:ale_fix_on_save = 1

" By default, Ale runs `rls` with the `nightly` toolchain. However, this
" causes the `rls` integration to not work when editing a project using the
" `stable` toolchain, so by setting this variable to an empty string, it seems
" to work with the `stable` toolchain. However, I have not yet determined how
" well this works when using different toolchains for different projects -- I
" tend to mostly use the `stable` toolchain.
let g:ale_rust_rls_toolchain = ''
