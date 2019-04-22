;; Enable mouse interaction. `xterm-mouse-mode` enables the mouse so it can be
;; used for clicking, and `mouse-wheel-mode` enables scrolling. Note that
;; `mouse-wheel-mode` should be called with either no argument, or `nil` as
;; argument, in order to be enables (see `C-h v mouse-wheel-mode`).
(xterm-mouse-mode 1)
(require 'mwheel)
(mouse-wheel-mode 1)

;; Do vim-like scrolling, meaning that a single line is scrolled at a time.
;; Emacs' default scrolling scrolls about half a page each time the point moves
;; outside the window, which I find too "jumpy" and annoying.
;; The value should be larger than 100, see `C-h v scroll-conservatively`.
(setq scroll-conservatively 101)

;; Keep a scroll margin of 1 line. This means that there will always be at least
;; one line between the point and the top/bottom of the window.
(setq scroll-margin 1)

;; Do not use tabs for indentation.
(setq-default indent-tabs-mode nil)

;; Show line numbers.
(global-display-line-numbers-mode 1)

;; Set up backup files. They should be stored in the folder
;; "~/.emacs.d/backups", and should be created by copying.
(let ((emacs-d (file-name-as-directory user-emacs-directory)))
  (setq
   backup-directory-alist  `(("."  .  ,(concat  emacs-d  "backups")))
   backup-by-copying       t))
