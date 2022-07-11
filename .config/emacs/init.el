;; -*- lexical-binding: t -*-

;; Improve Emacs boot performance
;; Increase the garbage collector threshold to reduce the execution
;; frequency. The default is 800 kilobytes. Measured in bytes.
(setq gc-cons-threshold (* 50 1000 1000))
(setq package-native-compile t)

;; Initialize server
(server-start)

(defconst ns/emacs-root "~/.config/emacs")
(defconst ns/emacs-init (concat ns/emacs-root "/init"))
(defconst ns/emacs-modules (concat ns/emacs-root "/modules"))
(defconst ns/org-path "~/Library/Mobile Documents/com~apple~CloudDocs/Notes")

(defun ns/compile-and-load-path (path)
  (native-compile-async path 'recursively)
  (setq load-path (cons path load-path)))

(ns/compile-and-load-path ns/emacs-init)
(ns/compile-and-load-path ns/emacs-modules)

(require 'init-package-manager)
(require 'init-emacs)
(require 'init-vi)
(require 'init-keybindings)
(require 'init-text-editing)
(require 'init-ui-completion)
(require 'init-consult)
(require 'init-embark)
(require 'init-org)
(require 'init-org-roam)
(require 'init-eshell)
(require 'init-project)
(require 'init-workspace)
(require 'init-version-control)
(require 'init-prog)
(require 'init-ios)

(require 'evil-textobj-entire)

(when (file-exists-p (concat ns/emacs-modules "exploration.el"))
      (require 'exploration))

(use-package mindre-theme
    :ensure t
    :custom
    (mindre-use-more-bold nil)
    (mindre-use-faded-lisp-parens t)
    :config
    (load-theme 'mindre t))

(provide 'init)
;;; init.el ends here
