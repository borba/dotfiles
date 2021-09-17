(require 'use-package)

;; set emacs gc threshold

(setq gc-cons-threshold (* 100 1024 1024))

;; Projectile
(use-package projectile
  :init (projectile-mode +1)
	:config (setq projectile-project-search-path '("~/Projects/")
								projectile-enable-caching nil
								frame-title-format (setq icon-title-format '((:eval (projectile-project-name)))))
  :bind (:map projectile-mode-map
              ("s-p" . projectile-command-map)
              ("C-c p" . projectile-command-map))
	:commands (projectile-global-mode))

;; lsp-mode

(use-package lsp-mode
	:init
	(setq lsp-keymap-prefix "C-c l")
	:config
	(setq lsp-lens-enable t
				lsp-signature-auto-activate nil)
	(setq lsp-clojure-custom-server-command '("/opt/homebrew/bin/clojure-lsp"))
	:hook
	((clojure-mode . lsp)
	 (clojure-script-mode . lsp)
	 (clojurec-mode . lsp))
	:commands lsp)

(use-package lsp-treemacs
	:config
	(setq treemacs-space-between-root-nodes nil)
	(setq lsp-treemacs-error-list-current-project-only t)
	:commands lsp-treemacs-errors-list)

(use-package flycheck)

(use-package company
	:config (setq company-idle-delay 0.0
								company-minimum-prefix-length 1))

(use-package cider
	)

(use-package clojure-mode
	:mode (("\\.clj\\'" . clojure-mode)
         ("\\.edn\\'" . clojure-mode)))

(use-package paredit
  :hook (clojure-mode . paredit-mode))

(use-package rainbow-delimiters
	:config
	(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode))

(use-package smartparens
	:config
	(require 'smartparens-config)
	(add-hook 'clojure-mode-hook #'smartparens-mode))

(provide 'clojure-config)
