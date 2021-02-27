;; === PACKAGE MANAGER SETUP ===
;; This bootstraps the `straight.el' package manager and the `use-package'
;; configuration manager to work nicely together.
;;
;; First, load straight.el from disk.
(load (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
;; Then, install the `use-package' package, using straight.el.
(straight-use-package 'use-package)
;; Finally, set up `use-package' to always use `straight.el' for installing
;; packages.
(setq straight-use-package-by-default t)

;; === PACKAGE INSTALLATION AND CONFIGURATION ===
;; The packages here are listed in no particular order.

;; `evil' is Vim keybindings for Emacs.
(use-package evil
  :config
  ;; Enable `evil-mode' as soon as the package is loaded.
  (evil-mode 1))

;; `go-mode' includes support for Go.
(use-package go-mode)

;; `lsp-mode' is a LSP client.
(use-package lsp-mode
  :commands (lsp-deferred)
  ;; `lsp-mode' includes a client for `gopls'. Set up so that LSP is loaded when
  ;; editing Go files.
  :hook (go-mode . lsp-deferred))

;; `yaml-mode' provides support for YAML.
(use-package yaml-mode
  :mode "\\.yml\\'")

;; `protobuf-mode' provides support for protobuf.
(use-package protobuf-mode)

;; `bazel-mode' provides support for Bazel files (WORKSPACE, BUILD.bazel, etc).
(use-package bazel-mode)

;; When saving Go files, automatically format and fix imports.
(defun lsp-go-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-save-hooks)

;; `company' is a completion package. It integrates with `lsp-mode' well.
(use-package company
  :config
  ;; Enable as-you-type completion.
  (setq
   company-idle-delay 0
   company-minimum-prefix-length 1))

;; `lsp-ui' provides some fancier interfaces for LSP functionality.
(use-package lsp-ui
  :commands (lsp-ui-mode))

;; `flycheck' provides additional syntax checking and linting.
(use-package flycheck
  :init (global-flycheck-mode))

;; `yasnippet' provides snippet support.
(use-package yasnippet
  :commands yas-minor-mode
  :hook (go-mode . yas-minor-mode))

;; `base16-theme' provides Emacs versions of the base16 colorschemes.
(use-package base16-theme
  :config (load-theme (intern (concat "base16-" (getenv "BASE16_COLORSCHEME"))) t))

;; `treemacs' is a file tree explorer that supports a variety of things such as
;; git.
(use-package treemacs
  :defer t)

;; `treemacs-evil' configures treemacs bindings suitable for `evil' users.
(use-package treemacs-evil
  :after treemacs evil)

;; === EMACS SETTINGS ===
;; These are settings that affect how emacs operates as a whole.

;; Make sure a newline is added to the end of every file.
(setq require-final-newline t)

;; Set the backups directory to "~/.emacs.d/backups".
(setq backup-directory-alist `(("." . ,(concat (file-name-as-directory user-emacs-directory) "backups"))))

;; Set the font.
(setq default-frame-alist '((font . "Iosevka-11")))
