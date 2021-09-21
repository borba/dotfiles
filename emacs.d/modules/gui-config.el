(require 'use-package)

;; Set theme
(use-package zenburn-theme
  :init (load-theme 'zenburn t))

;; Leave frame clean
(setq-default inhibit-startup-screen t)
(setq-default initial-scratch-message nil)
(setq-default ns-auto-hide-menu-bar t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
;;(set-fringe-mode 10)
;;(blink-cursor-mode -1)

;; Initial frame size
(add-to-list 'default-frame-alist '(height . 48))
(add-to-list 'default-frame-alist '(width . 160))
;;(toggle-fram-maximized)

;; Have both line and column numbers in mode line
(line-number-mode 1)
(column-number-mode 1)

;; Always show line numbers on left
(global-linum-mode t)
(setq linum-format "%4d ")

;; No visual bell on errors
(setq visible-bell nil)

;; Enable hightlight for all opened buffers
(global-hl-line-mode 1)

;; Better defaults for editing
(setq-default tab-width 2)
(setq-default fill-column 120)

;; TODO study these later
;(setq max-mini-window-height 0.1)
;(fset 'yes-or-no-p 'y-or-n-p)

(provide 'gui-config)
