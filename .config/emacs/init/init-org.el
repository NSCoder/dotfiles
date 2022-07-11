;;; init-org.el --- init org -*- lexical-binding: t; -*-
;;; Code:

;; Org Mode
(use-package org
  :diminish org-indent-mode

  :init
  (require 'org-tempo)
  (org-indent-mode)

  ;; Template structures
  (add-to-list 'org-structure-template-alist '("sh" . "src shell"))
  (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
  (add-to-list 'org-structure-template-alist '("sf" . "src swift"))

  ;; Theme setup
  (set-face-attribute 'org-document-title nil :weight 'semi-bold :foreground nil :inherit nil)
  (set-face-attribute 'org-document-info nil :weight 'semi-bold :foreground nil :inherit nil)
  (set-face-attribute 'org-meta-line nil :weight 'light :foreground nil :inherit nil)
  (set-face-attribute 'org-drawer nil :weight 'light :foreground nil :inherit nil)
  (set-face-attribute 'org-document-info-keyword nil :weight 'light :foreground nil :inherit nil)
  (set-face-attribute 'org-property-value nil :weight 'bold :foreground nil :inherit nil)

  :config
  ;; Enable code evaluation using org-babel
  (org-babel-do-load-languages 'org-babel-load-languages '((emacs-lisp . t)))

  (setq org-confirm-babel-evaluate nil
        org-src-fontify-natively t
        org-list-allow-alphabetical t
        org-ellipsis " ▾"
        org-image-actual-width 400
        org-attach-auto-tag nil
        org-startup-indented t
        org-hide-emphasis-markers t
        org-startup-with-inline-images t
        org-agenda-files '("~/org/tasks.org")
        org-agenda-start-with-log-mode t
        org-log-done 'time
        org-log-into-drawer t)

  :hook (org-mode . visual-line-mode))

;; Theme to remove all the leading stars
(use-package org-modern
  :config
  (setq org-modern-hide-stars t)
  :init
  (global-org-modern-mode))

;; Attach images/files from clipboard or url
(use-package org-download
  :init
  (org-download-enable)
  :hook
  (dired-mode-hook . org-download-enable))


(provide 'init-org)
;;; init-org.el ends here
