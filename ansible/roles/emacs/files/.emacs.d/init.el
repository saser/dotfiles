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
