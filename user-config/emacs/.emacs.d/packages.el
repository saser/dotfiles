;; `use-package' is a package itself. It provides a nicer way to define packages,
;; handle their installation (using the `:straight' keyword), and define settings
;; and keybindings related to those packages.
(straight-use-package 'use-package)

;; Always use `straight' for packages, so I don't have to specify `:straight t'
;; everywhere.
(setq straight-use-package-by-default t)

;;; Visual packages
;;; I put these first since it seems that they need to be be defined before any
;;; packages that might use their colors.

;; Currently, I am using a set of base16 themes for different applications, and
;; thus also in Emacs.
(use-package base16-theme
  ;; The README for base16-emacs specifies that this should most likely be set.
  :demand
  :init
  (defvar base16-theme
    (getenv "BASE16_THEME")
    "A string containing the name of the currently used base16 theme, based on the value of the $BASE16_THEME environment variable.")
  ;; This setting is required since I use the 256 color variation of `materia',
  ;; or something like that.
  (setq base16-theme-256-color-source 'colors)
  :config
  ;; Load the theme.
  (load-theme (intern (concat "base16-" base16-theme)) t)
  ;; Only after loading the theme has the `base16-<theme>-colors' variable
  ;; become available and populated. The `base16-colors' variable is just a
  ;; shorthand for this variable.
  (defvar base16-colors
    (symbol-value (intern (concat "base16-" base16-theme "-colors")))
    "A property list containing the colors of the currently selected theme.")
  (defun base16-get (color)
    "Returns a string containing the hex code for the given color. `color' is a keyword."
    (plist-get base16-colors color))
  ;; The default face for current line highlighting in the line number column is
  ;; way too intrusive in my opinion, so the face is customized to use the same
  ;; background color as the other numbers, but with a little more prominent
  ;; foreground color.
  (custom-set-faces
   `(line-number-current-line ((t (:inherit line-number :inverse-video nil :foreground ,(base16-get :base05)))))
   )
  )

;;; Keybindings

;; `general' provides convenient functions for defining keybinds. It also has
;; deep integration with `evil', with pre-existing functions for defining
;; keybinds for different `evil' states.
(use-package general
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
  ;;; Buffer-related keybinds.
  (leader-def
    "b b" 'switch-to-buffer
    "b k" 'kill-buffer)
  ;; Search-related keybinds.
  (leader-def
    "s DEL" 'evil-ex-nohighlight)
  ;; Comment-related keybinds.
  ;; `comment-line' works for both commenting and uncommenting the current line.
  (leader-def
    "c c" 'comment-line)
  ;; "dwim" means "do what I mean". For a region, this means toggling comment/uncomment.
  (leader-def
    :states 'visual
    "c c" 'comment-dwim)
  ;; Also set up `<F1>' to be an escape-hatch `help-command', in case I am in
  ;; some major mode where `SPC h' does not work.
  (general-define-key "<F1>" 'help-command)
  )

;; Set up some keybindings for `straight'.
(leader-def
  "p p" 'straight-pull-package
  "p u" '((lambda ()
            (interactive)
            (mapc 'straight-pull-package
                  '("melpa"
                    "gnu-elpa-mirror"
                    "emacsmirror")))
          :which-key "pull recipe repositories")
  "p a" 'straight-pull-all
  "p f" 'straight-freeze-versions
  "p t" 'straight-thaw-versions
  )

;; `evil' provides Vim emulation for Emacs. Many keybindings from Vim exist in
;; `evil' as well, but many that I like do not. Thus, I add them here.
(use-package evil
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
  ;; Customize faces.
  (custom-set-faces
   ;; The default properties for this face relies on the "red" and "black" color
   ;; strings, as far as I can tell. I set it up to use the same properties of
   ;; the `error' face, but specify that it should not be bold and that it should
   ;; be italic.
   `(evil-ex-info ((t (:inherit error :slant italic :bold nil))))
   `(evil-ex-substitute-replacement ((t (:foreground ,(base16-get :base0E) :underline t))))
   )
  )

;; A port of the amazing `vim-surround' plugin for Vim.
(use-package evil-surround
  :config
  (global-evil-surround-mode 1)
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
  ;; Use the home row as first choice, then the upper row, then the lower row of
  ;; the keyboard. This is a large extension compared to the default
  ;; settings, since they use only the home row.
  (setq avy-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l ?\;
                   ?q ?w ?e ?r ?t ?y ?u ?i ?o ?p
                   ?z ?x ?c ?v ?b ?n ?m ?\,))
  ;; Gray out all text when typing characters. This is the default behaviour in
  ;; the Vim plugin, and I enjoy it.
  (setq avy-background t)
  ;; Emacs' idea of a word motion is different from Vim's idea, resulting in
  ;; many more candidates when performing beginning-/end-of-word motions. Many
  ;; candidates mean that it is more difficult to actually see what key sequence
  ;; I need to press in order to jump where I want to, and the buffer contents
  ;; might move as well. Therefore, the following setting will only display one
  ;; lead character at a time, sacrificing speed for convenience and consistency.
  (setq avy-style 'at)
  ;; The default faces for the `avy' package, which this package uses
  ;; underneath, are completely unreadable. I modify them here to be more
  ;; readable. I really dislike configuring settings for a package that is only
  ;; a dependency, but this seems to be the best way to do it.
  (custom-set-faces
   `(avy-lead-face   ((t (:background ,(base16-get :base00) :foreground ,(base16-get :base08)))))
   `(avy-lead-face-0 ((t (:background ,(base16-get :base00) :foreground ,(base16-get :base08)))))
   `(avy-lead-face-2 ((t (:background ,(base16-get :base00) :foreground ,(base16-get :base08)))))
   )
  )

;; `smartparens' is apparently a good parentheses/delimiter pairing plugin.  I
;; use it mostly for automatically inserting pairing parentheses, quotes, etc,
;; but there is a lot more functionality included in the package.
(use-package smartparens
  :init
  (require 'smartparens-config)
  :config
  (smartparens-global-mode t)
  )

;; `which-key' is a package that displays keybindings in a pop-up window. It is
;; very useful for seeing which keybinds are available and active.
(use-package which-key
  :config
  (which-key-mode t))

;;; Language packages/modes

;; Flycheck is an on-the-fly syntax checker. It supersedes the builtin Flymake,
;; which has only very limited support for languages. Flycheck can also be used
;; by `lsp-ui' in order to display diagnostics provided by a language server.
(use-package flycheck
  :hook
  ;; Enable `flycheck-mode' for specific major modes.
  ((go-mode)
   . flycheck-mode)
  )

;; Intero is a fully-fledged Haskell development environment, with many nice
;; features such as "type of selection", a REPL, and specifically, integration
;; with `stack'.
(use-package intero
  ;; Intero should be hooked into `haskell-mode', in order to activate.
  :hook (haskell-mode . intero-mode)
  )

;; AUCTeX is a (La)TeX editing package that provides many niceties for editing
;; LaTeX, such as "open current file in PDF viewer", forward/inverse search, etc.
(use-package tex
  :straight auctex
  :init
  ;; Add a hook that runs `latexmk' on each save. I use this to approximate the
  ;; "compile on save" functionality that the `vim-tex' plugin for Vim provides.
  (add-hook 'LaTeX-mode-hook
            (lambda ()
              (add-hook 'after-save-hook (lambda () (TeX-command "LatexMk" 'TeX-master-file)))))
  :config
  ;; This overrides all the default view programs, but since I only ever use
  ;; PDF, it is sufficient.
  (setq TeX-view-program-selection '((output-pdf "Zathura")))
  )

;; Add integration to use `latexmk' in AUCTeX. Using `latexmk' is much nicer
;; than e.g. compiling more than once to get references right.
(use-package auctex-latexmk
  :init
  (setq auctex-latexmk-inherit-TeX-PDF-mode t)
  :config
  (auctex-latexmk-setup)
  )

;; Support for the YAML language.
(use-package yaml-mode)

;; Support for the Go programming language.
(use-package go-mode
  :init
  ;; The default value, `godoc-and-godef' is broken since `godoc' does not
  ;; include any command-line interface anymore. Thus we use an external tool
  ;; called `gogetdoc', which works much better according to the author(s) of
  ;; `go-mode'. `gogetdoc' can be installed using:
  ;;     go get -u github.com/zmb3/gogetdoc
  (setq godoc-at-point-function 'godoc-gogetdoc)
  )

;; Support for the ProtoBuf interface definition language.
(use-package protobuf-mode)

;; `company' is a completion framework for Emacs, and `company-lsp' is a backend
;; for `company' that integrates with `lsp-mode', allowing completions to be
;; sourced from the LSP server.
(use-package company-lsp)

;; `yasnippet' is a snippet framework. I mostly use it for its integration with
;; `company' and `company-lsp', which allows completions to be expanded into
;; snippets.
(use-package yasnippet)

;; Support for language servers.
(use-package lsp-mode
  :init
  ;; Prefer using Flycheck if it is available (in conjunction with `lsp-ui').
  (setq lsp-prefer-flymake nil)
  ;; Always run a code formatter (if available) before saving the buffer.
  (add-hook 'before-save-hook #'lsp-format-buffer)
  ;; Languages to enable LSP integration for.
  ;; ---
  ;; Go: requires `gopls'. It can be installed using
  ;;     go get -u golang.org/x/tools/cmd/gopls
  (add-hook 'go-mode-hook #'lsp)
  :config
  (leader-def
    :map 'lsp-mode-map
    "l r" 'lsp-restart-workspace
    "l d" 'lsp-find-definition)
  )

;; Integration of LSP into the UI. Can do stuff directly in the buffer like
;; display diagnostics (provided by Flycheck), display available code actions,
;; etc.
(use-package lsp-ui)

;;; Git packages

;; Magit is deep integration with git in the editor, much like `fugitive' is for
;; Vim. Only, I expect Magit to be even better (which is no low expectation,
;; seeing as I believe `fugitive' to be one of the best Vim plugins there are.)
(use-package magit
  :general
  (leader-def
    "g s" 'magit-status
    "g b" 'magit-blame
    )
  )

;; `evil-magit' brings sane `evil' bindings to Magit modes.
(use-package evil-magit
  :after magit
  :init
  ;; Behave as expected for horizontal movement keys (h, l) in Magit buffers.
  (setq evil-magit-want-horizontal-movement t)
  )

;;; File system packages

;; NeoTree is a file tree package, like `nerdtree' in Vim.
(use-package neotree
  :commands 'neotree-make-executor
  :config
  ;; I do not want to display line numbers in the neotree window.
  (add-hook 'neo-after-create-hook
            (lambda (&rest _)
              (display-line-numbers-mode -1)))
  :general
  (leader-def "f TAB" 'neotree)
  (general-nmap :keymaps 'neotree-mode-map
    "RET" (neotree-make-executor :file-fn 'neo-open-file :dir-fn 'neo-open-dir)
    "o"   (neotree-make-executor :file-fn 'neo-open-file :dir-fn 'neo-open-dir)
    "SPC" (neotree-make-executor :dir-fn 'neo-open-dir)

    "p"   'neotree-select-up-node
    "C-j" 'neotree-select-next-sibling-node
    "C-k" 'neotree-select-previous-sibling-node

    "R"   'neotree-refresh
    "H"   'neotree-hidden-file-toggle

    "-"   (neotree-make-executor :file-fn 'neo-open-file-horizontal-split)
    "|"   (neotree-make-executor :file-fn 'neo-open-file-vertical-split)

    "TAB" 'neotree-stretch-toggle

    "c"   'neotree-create-node
    "y"   'neotree-copy-node
    "d"   'neotree-delete-node
    "r"   'neotree-rename-node)
  )

;;; Miscellaneous packages

;; The `xclip' package allows Emacs to access the X clipboard, even when running
;; in the terminal. This mimics how I had the yanking in Vim work, and it is
;; very convenient.
(use-package xclip
  :config
  (xclip-mode 1)
  )
