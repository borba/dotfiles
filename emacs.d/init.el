(require 'package)

;; only runs on emacs >= 26.1
(let ((minver 26.1))
  (unless (>= emacs-major-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))

;; or (setq package-archives (("melpa" . "http...") ("org"...))
(setq package-archives nil)
;;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;;(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(setq package-enable-at-startup nil)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))

;; (when (not (require 'use-package nil 'noerror))
;;   (message "Package 'use-package' not found. Updating package list and installing it.")
;;   (package-refresh-contents)
;;   (package-install 'use-package))

;; Set defaults for use-package
(setq-default use-package-always-defer t
              use-package-always-ensure t)

(use-package auto-package-update
  :config ((setq auto-package-update-delete-old-versions t
                 auto-package-update-hide-results t)
           (auto-package-update-maybe)))

(use-package diminish)

;; Helper functions

(defun add-to-load-path (path)
  "Creates and add a folder to load-path"
  (when (not (file-exists-p path))
    (make-directory path t))
  (add-to-list 'load-path path))

;; Get rid of customize-* stuff
(setq-default custom-file null-device)

;; Deal with an intermitent error loading theme
(when noninteractive
  (after! undo-tree
          (global-undo-tree-mode -1)))

;; Packages paths

(add-to-load-path "~/.emacs.d/modules")

(require 'gui-config)
(require 'emacs-config)
(require 'editing-config)
(require 'clojure-config)
