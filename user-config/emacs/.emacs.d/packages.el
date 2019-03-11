; `use-package` is a package itself. It provides a nicer way to define
; packages, handle their installation (using the `:straight` keyword), and
; define settings and keybindings related to those packages.
(straight-use-package 'use-package)

;;; Editing packages

; `evil` provides Vim emulation for Emacs. Many keybindings from Vim exist in
; `evil` as well.
(use-package evil
  :straight t
  :config
  (evil-mode 1))

;;; Language packages/modes

; Haskell mode. Provides a few nice features such as type-on-hover and a way
; to easily launch a REPL.
(use-package haskell-mode
  :straight t)
