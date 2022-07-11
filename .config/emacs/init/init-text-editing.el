;;; init-text-editing.el --- init text editing -*- lexical-binding: t; -*-
;;; Code:

(set-default-coding-systems 'utf-8)

;; Undo
(use-package undo-tree
  :diminish
  :config
  (setq undo-tree-auto-save-history t)
  (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))
  :init
  (global-undo-tree-mode 1))

;; Auto-save files
(use-package super-save
  :diminish
  :config
 (setq super-save-auto-save-when-idle t)
 :init
 (super-save-mode +1))

;; Improved comment support
(use-package evil-nerd-commenter
  :bind
  ("M-/" . evilnc-comment-or-uncomment-lines))

;; Remember recent open files
(recentf-mode 1)

(provide 'init-text-editing)
;;; init-text-editing.el ends here
