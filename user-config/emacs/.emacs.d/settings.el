; Enable mouse interaction. `xterm-mouse-mode` enables the mouse so it can be
; used for clicking, and `mouse-wheel-mode` enables scrolling. Note that
; `mouse-wheel-mode` should be called with either no argument, or `nil` as
; argument, in order to be enables (see `C-h v mouse-wheel-mode`).
(xterm-mouse-mode 1)
(mouse-wheel-mode)

; Do vim-like scrolling, meaning that a single line is scrolled at a time.
; Emacs' default scrolling scrolls about half a page each time the point moves
; outside the window, which I find too "jumpy" and annoying.
; The value should be larger than 100, see `C-h v scroll-conservatively`.
(setq scroll-conservatively 101)

; Keep a scroll margin of 1 line. This means that there will always be at least
; one line between the point and the top/bottom of the window.
(setq scroll-margin 1)
