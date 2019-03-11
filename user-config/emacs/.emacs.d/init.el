; Load the `straight.el` package manager.
(load (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))

; `use-package` is a package itself. It provides a nicer way to define
; packages, handle their installation (using the `:straight` keyword), and
; define settings and keybindings related to those packages.
(straight-use-package 'use-package)

; `evil` provides Vim emulation for Emacs. Many keybindings from Vim exist in
; `evil` as well.
(use-package evil
  :straight t
  :config
  (evil-mode 1))
