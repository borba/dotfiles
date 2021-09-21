(require 'use-package)

;; use spaces for indent
(setq-default indent-tabs-mode nil)

;; sets fn-delete to be right-delete (for mac)
(global-set-key [kp-delete] 'delete-char)

;; default font and size
(set-face-attribute 'default nil
                    :family "Menlo"
                    :height 140
                    :weight 'normal
                    :width 'normal)

(use-package which-key
	:config (which-key-mode 1))

;; highlight the match parentesis
(show-paren-mode 1)

(provide 'editing-config)
