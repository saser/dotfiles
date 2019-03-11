(defun config-load (file)
  (load (expand-file-name file user-emacs-directory)))

; Load the `straight.el` package manager.
(config-load "straight/repos/straight.el/bootstrap.el")

; Load packages and their settings.
(config-load "packages.el")

; Load visual settings.
(config-load "visual.el")
