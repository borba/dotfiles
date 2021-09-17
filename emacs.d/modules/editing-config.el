(require 'use-package)

;; use spaces for indent
(setq-default indent-tabs-mode nil)

(use-package which-key
	:config (which-key-mode 1))

(show-paren-mode 1)

(provide 'editing-config)
