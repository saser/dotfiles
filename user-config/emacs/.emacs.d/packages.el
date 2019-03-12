; `use-package` is a package itself. It provides a nicer way to define packages,
; handle their installation (using the `:straight` keyword), and define settings
; and keybindings related to those packages.
(straight-use-package 'use-package)

;;; Editing packages

; `evil` provides Vim emulation for Emacs. Many keybindings from Vim exist in
; `evil` as well.
(use-package evil
  :straight t
  :config
  ; `evil-mode` needs to be enabled after `evil` is loaded.
  (evil-mode 1))

;;; Language packages/modes

; Intero is a fully-fledged Haskell development environment, with many nice
; features such as "type of selection", a REPL, and specifically, integration
; with `stack`.
(use-package intero
  :straight t
  ; Intero should be hooked into `haskell-mode`, in order to activate.
  :hook (haskell-mode . intero-mode))
