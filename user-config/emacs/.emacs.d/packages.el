; `use-package' is a package itself. It provides a nicer way to define packages,
; handle their installation (using the `:straight' keyword), and define settings
; and keybindings related to those packages.
(straight-use-package 'use-package)

;;; Keybindings

; `general' provides convenient functions for defining keybinds. It also has
; deep integration with `evil', with pre-existing functions for defining
; keybinds for different `evil' states.
(use-package general
  :straight t
  :config
  ;;; `general' setup.
  ; Set up special definers for evil mode.
  (general-evil-setup)
  ; Create a definer for my global leader key, `SPC'. I intend to somewhat
  ; imitate the keybinds of Spacemacs, and there `SPC' is the "global" leader
  ; key. The `motion' state is inherited by the `normal', `visual', and
  ; `operator' states.
  (general-create-definer leader-def
    :states 'motion
    :prefix "SPC")
  ; Unbind any previously bound `SPC' key. (By default, this is bound
  ; in `evil' in the same way as it is in vim, which is like "move one character
  ; forward" or something like that.
  (leader-def "" nil)

  ;;; `general' keybinds.
  ; Set up `SPC h' to be the new `help-command' binding.
  (leader-def "h" 'help-command)
  )

; `evil' provides Vim emulation for Emacs. Many keybindings from Vim exist in
; `evil' as well, but many that I like do not. Thus, I add them here.
(use-package evil
  :straight t

  :init
  ; Have `Y' yank to the end of the line, like `y$' does in vim. This has to be
  ; set before `evil-mode' is enabled, for some reason.
  (setq evil-want-Y-yank-to-eol t)

  :config
  ; Enable `evil' mode.
  (evil-mode 1)

  ;;; `evil' options.
  ; Use vim-style searching and replacing.
  (evil-select-search-module 'evil-search-module 'evil-search)
  (setq evil-ex-search-vim-style-regexp t)

  ;;; `evil'-specific keybinds.
  ; Provide shorthands for the `:w' and `:q' commands.
  (general-mmap "W" 'evil-write)
  (general-mmap "Q" 'evil-quit)
  ; Use my usual window movement keys. Note that this overrides the default
  ; bindings, which most importantly overrides the `C-h' binding for
  ; `help-command'. I have replaced that binding with `SPC h', which can be
  ; found in the configuration of `general' above.
  (general-mmap "C-h" 'evil-window-left)
  (general-mmap "C-j" 'evil-window-down)
  (general-mmap "C-k" 'evil-window-up)
  (general-mmap "C-l" 'evil-window-right)
  ; Keep the selection when doing indents in visual mode. Taken from
  ; https://superuser.com/a/1194875.
  (general-vmap "<" 'evil-private/visual-shift-left)
  (general-vmap ">" 'evil-private/visual-shift-right)
  (defun evil-private/visual-shift-left ()
    (interactive)
    (call-interactively 'evil-shift-left)
    (evil-normal-state)
    (evil-visual-restore))
  (defun evil-private/visual-shift-right ()
    (interactive)
    (call-interactively 'evil-shift-right)
    (evil-normal-state)
    (evil-visual-restore))
  )

;;; Visual packages

; I mainly use the Solarized (https://ethanschoonover.com/solarized/) color
; scheme, so I want to use that in Emacs as well.
(use-package color-theme-solarized
  :straight t
  :config
  (load-theme 'solarized t))

;;; Language packages/modes

; Intero is a fully-fledged Haskell development environment, with many nice
; features such as "type of selection", a REPL, and specifically, integration
; with `stack'.
(use-package intero
  :straight t
  ; Intero should be hooked into `haskell-mode', in order to activate.
  :hook (haskell-mode . intero-mode))
