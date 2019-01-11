" Use the `rls` linter. Requires that rls in installed!
" To install, look at the instructions for rls, which can be found here:
" https://github.com/rust-lang-nursery/rls
let g:ale_linters = {'rust': ['rls']}

" By default, Ale runs `rls` with the `nightly` toolchain. However, this
" causes the `rls` integration to not work when editing a project using the
" `stable` toolchain, so by setting this variable to an empty string, it seems
" to work with the `stable` toolchain. However, I have not yet determined how
" well this works when using different toolchains for different projects -- I
" tend to mostly use the `stable` toolchain.
let g:ale_rust_rls_toolchain = ''
