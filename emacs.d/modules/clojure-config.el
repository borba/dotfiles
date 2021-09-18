(require 'use-package)

;; set emacs gc threshold

(setq gc-cons-threshold (* 100 1024 1024))

;; lsp-mode

(use-package yasnippet)

(use-package lsp-mode
  :init     (setq lsp-keymap-prefix "C-c l")
  :config   (setq lsp-lens-enable t
                  lsp-signature-auto-activate nil
                  lsp-clojure-custom-server-command "/usr/local/bin/clojure-lsp")
  :hook     (clojure-mode
             clojure-script-mode
             clojurec-mode)
  :commands lsp)

(use-package lsp-treemacs
  :config   (setq treemacs-space-between-root-nodes nil
                  lsp-treemacs-error-list-current-project-only t)
  :commands lsp-treemacs-errors-list)

(use-package flycheck)

(use-package company
  :config (setq company-idle-delay 0.0
                company-minimum-prefix-length 1))

(use-package cider)

(use-package clojure-mode
  :mode (("\\.clj\\'" . clojure-mode)
         ("\\.edn\\'" . clojure-mode)))

(use-package paredit
  :config (show-paren-mode t)
  :bind   (("<C-M-right>" . paredit-forward-slurp-sexp)
           ("<C-M-left>" . paredit-forward-barf-sexp))
  :hook   ((clojure-mode . paredit-mode)
           (emacs-lisp-mode . paredit-mode)))

(use-package rainbow-delimiters
  :hook ((clojure-mode . rainbow-delimiters-mode)
         (emacs-lisp-mode . rainbow-delimiters-mode)))

(use-package smartparens
  :config   (setq sp-show-pair-from-inside nil)
            (require 'smartparens-config)
  :hook     (clojure-mode emacs-list-mode)
  :diminish smartparens-mode)

(provide 'clojure-config)
