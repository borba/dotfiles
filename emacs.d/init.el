(require 'package)

;; or (serq package-archives (("melpa" . "http...") ("org"...))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/") t)

(setq package-enable-at-startup nil)
(package-initialize)

;; (unless (package-installed-p 'use-package...
(when (not (require 'use-package nil 'noerror))
  (message "Package 'use-package' not found. Updating package list and installing it.")
  (package-refresh-contents)
  (package-install 'use-package))

;; Set defaults for use-package
(setq-default use-package-always-defer t
              use-package-always-ensure t)

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
