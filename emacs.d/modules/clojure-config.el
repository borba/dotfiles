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

(use-package helm-projectile
  :config
  (helm-projectile-on)
  (setq projectile-completion-system 'helm))

;; Diretories to be ignored

(setq ignored-directories '(".calva"
														".clj-kondo"
														".cpcache"
														".idea"
														".lsp"
														".vscode"))

(setq projectile-indexing-method 'native)

(dolist (directory ignored-directories)
	(add-to-list 'projectile-globally-ignored-directories directory))

;; Positioning the navigation window in bottom of the frame

(defvar helm-display-help-buffer-regexp '("\\*.*Helm.*Help.*\\*"))
(defvar helm-display-buffer-regexp `("\\*.*helm.*\\*"
                                     (display-buffer-in-side-window)
                                     (inhibit-same-window . nil)
                                     (side . bottom)
                                     (window-width . 0.6)
                                     (window-height . 0.4)))

(defun display-helm-at-bottom (buffer &optional _resume)
  (let ((display-buffer-alist (list helm-display-help-buffer-regexp
                                    helm-display-buffer-regexp)))
    (display-buffer buffer)))

(setq helm-display-function 'display-helm-at-bottom)

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

(use-package rainbow-delimiters
	:config
	(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode))

(use-package smartparens
	:config
	(require 'smartparens-config)
	(add-hook 'clojure-mode-hook #'smartparens-mode))

(provide 'clojure-config)
