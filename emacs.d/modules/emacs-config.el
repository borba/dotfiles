(require 'use-package)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Projectile
(use-package projectile
  :init     (projectile-mode +1)
  :config   (setq projectile-project-search-path '("~/projects/"
                                                   "~/nubank/")
                  projectile-enable-caching nil
                  frame-title-format (setq icon-title-format '((:eval (projectile-project-name)))))
  :bind     (:map projectile-mode-map
                  ("s-p" . projectile-command-map)
                  ("C-c p" . projectile-command-map))
  :commands (projectile-global-mode))

;; (use-package selectrum
;;   :config (selectrum-mode +1))

;; (use-package selectrum-prescient
;;   :config ((selectrum-prescient-mode +1)
;;            (prescient-persist-mode +1)))

(use-package ivy
 :diminish ivy-mode
 :bind     (("C-s" . swiper)
            :map ivy-minibuffer-map
           ("TAB" . ivy-alt-done)
            ("C-l" . ivy-alt-done)
            ("C-j" . ivy-next-line)
            ("C-k" . ivy-previous-line)
            :map ivy-switch-buffer-map
            ("C-k" . ivy-previous-line)
            ("C-l" . ivy-done)
            ("C-d" . ivy-switch-buffer-kill)
            :map ivy-reverse-i-search-map
            ("C-k" . ivy-previous-line)
            ("C-d" . ivy-reverse-i-search-kill))
 :config   (ivy-mode 1))

(use-package ivy-rich
 :after ivy
 :init  (ivy-rich-mode 1))

(use-package counsel
 :bind   (("C-M-j" . 'counsel-switch-buffer)
          :map minibuffer-local-map
          ("C-r" . 'counsel-minibuffer-history))
 :custom (counsel-linux-app-format-function #'counsel-linux-app-format-function-name-only)
 :config (counsel-mode 1))

(use-package ivy-prescient
 :after  counsel
 :custom (ivy-prescient-enable-filtering nil)
 :config (;(prescient-persist-mode 1) ;; Uncomment the following line to have sorting remembered across sessions!
          (ivy-prescient-mode 1)))

;;(use-package helpful
;;  :commands (helpful-callable helpful-variable helpful-command helpful-key)
;;  :custom   (counsel-describe-function-function #'helpful-callable)
;;            (counsel-describe-variable-function #'helpful-variable)
;;  :bind     ([remap describe-function] . counsel-describe-function)
;;            ([remap describe-command] . helpful-command)
;;            ([remap describe-variable] . counsel-describe-variable)
;;            ([remap describe-key] . helpful-key))

(use-package all-the-icons)

(use-package doom-modeline
 :init   (doom-modeline-mode 1)
 :custom ((doom-modeline-height 15)))

(provide 'emacs-config)
