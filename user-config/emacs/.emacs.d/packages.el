;; `use-package' is a package itself. It provides a nicer way to define packages,
;; handle their installation (using the `:straight' keyword), and define settings
;; and keybindings related to those packages.
(straight-use-package 'use-package)

;;; Keybindings

;; `general' provides convenient functions for defining keybinds. It also has
;; deep integration with `evil', with pre-existing functions for defining
;; keybinds for different `evil' states.
(use-package general
  :straight t
  :config
  ;;; `general' setup.
  ;; Set up special definers for evil mode.
  (general-evil-setup)
  ;; Create a definer for my global leader key, `SPC'. I intend to somewhat
  ;; imitate the keybinds of Spacemacs, and there `SPC' is the "global" leader
  ;; key. The `motion' state is inherited by the `normal', `visual', and
  ;; `operator' states.
  (general-create-definer leader-def
    :states 'motion
    :prefix "SPC")
  ;; Unbind any previously bound `SPC' key. (By default, this is bound
  ;; in `evil' in the same way as it is in vim, which is like "move one character
  ;; forward" or something like that.
  (leader-def "" nil)

  ;;; `general' keybinds.
  ;; Set up `SPC h' to be the new `help-command' binding.
  (leader-def "h" 'help-command)
  ;; Also set up `<F1>' to be an escape-hatch `help-command', in case I am in
  ;; some major mode where `SPC h' does not work.
  (general-define-key "<F1>" 'help-command)
  )

;; `evil' provides Vim emulation for Emacs. Many keybindings from Vim exist in
;; `evil' as well, but many that I like do not. Thus, I add them here.
(use-package evil
  :straight t

  :init
  ;; Have `Y' yank to the end of the line, like `y$' does in vim. This has to be
  ;; set before `evil-mode' is enabled, for some reason.
  (setq evil-want-Y-yank-to-eol t)

  :config
  ;; Enable `evil' mode.
  (evil-mode 1)

  ;;; `evil' options.
  ;; Use vim-style searching and replacing.
  (evil-select-search-module 'evil-search-module 'evil-search)
  (setq evil-ex-search-vim-style-regexp t)

  ;;; `evil'-specific keybinds.
  ;; Make `<escape>' quit out from most minibuffer situations.
  (general-define-key
   :keymaps '(minibuffer-local-map
              minibuffer-local-ns-map
              minibuffer-completion-map
              minibuffer-must-match-map)
   "<escape>" 'keyboard-escape-quit)
  ;; Provide shorthands for the `:w' and `:q' commands.
  (general-mmap "W" 'evil-write)
  (general-mmap "Q" 'evil-quit)
  ;; Use my usual window movement keys. Note that this overrides the default
  ;; bindings, which most importantly overrides the `C-h' binding for
  ;; `help-command'. I have replaced that binding with `SPC h', which can be
  ;; found in the configuration of `general' above.
  (general-mmap "C-h" 'evil-window-left)
  (general-mmap "C-j" 'evil-window-down)
  (general-mmap "C-k" 'evil-window-up)
  (general-mmap "C-l" 'evil-window-right)
  ;; Keep the selection when doing indents in visual mode. Taken from
  ;; https://superuser.com/a/1194875.
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

;; A port of the wonderful `vim-easymotion' plugin for Vim. For the time being, I
;; have forked the original repo, since it does not have the same default
;; behaviour as `vim-easymotion'.
(use-package evil-easymotion
  :straight (evil-easymotion :type git
                             :host github
                             :repo "PythonNut/evil-easymotion"
                             :fork (:host github
                                    :repo "Saser/evil-easymotion"
                                    :branch "page-scope-for-word-motions"))
  :config
  ;; This will set up keybindings that are similar to most other keybindings, by
  ;; using `SPC' as leader. I chose to have two `SPC', which I reserve for
  ;; something that is essential and very common, which I expect motions like
  ;; the ones provided by `evil-easymotion' to be.
  (evilem-default-keybindings "SPC SPC")
  ;; Use all lower-case letters, as well as the semicolon and apostrophe
  ;; characters, for jumping. This is a large extension compared to the default
  ;; settings, since they use only the home row.
  (setq avy-keys (nconc (number-sequence ?a ?z)
                        '(?\; ?')))
  ;; The default faces for the `avy' package, which this package uses
  ;; underneath, are completely unreadable. I modify them here to be more
  ;; readable. I really dislike configuring settings for a package that is only
  ;; a dependency, but this seems to be the best way to do it.
  (custom-set-faces
   '(avy-lead-face   ((t (:background "black" :foreground "red"))))
   '(avy-lead-face-0 ((t (:background "black" :foreground "red"))))
   '(avy-lead-face-2 ((t (:background "black" :foreground "red"))))
  ))

;;; Visual packages

;; I mainly use the Solarized (https://ethanschoonover.com/solarized/) color
;; scheme, so I want to use that in Emacs as well.
(use-package color-theme-solarized
  :straight t)

;; Currently, I am using a set of base16 themes for different applications, and
;; thus also in Emacs.
(use-package base16-theme
  :straight t
  ;; The README for base16-emacs specifies that this should most likely be set.
  :demand
  :init
  ;; This setting is required since I use the 256 color variation of `materia',
  ;; or something like that.
  (setq base16-theme-256-color-source 'base16-shell)
  :config
  (load-theme 'base16-materia t))

;;; Language packages/modes

;; Intero is a fully-fledged Haskell development environment, with many nice
;; features such as "type of selection", a REPL, and specifically, integration
;; with `stack'.
(use-package intero
  :straight t
  ;; Intero should be hooked into `haskell-mode', in order to activate.
  :hook (haskell-mode . intero-mode))

;; Support for the YAML language.
(use-package yaml-mode
  :straight t)

;;; Git packages

;; Magit is deep integration with git in the editor, much like `fugitive' is for
;; Vim. Only, I expect Magit to be even better (which is no low expectation,
;; seeing as I believe `fugitive' to be one of the best Vim plugins there are.)
(use-package magit
  :straight t
  :general
  (leader-def "g s" 'magit-status))

;; `evil-magit' brings sane `evil' bindings to Magit modes.
(use-package evil-magit
  :straight t
  :after magit)
