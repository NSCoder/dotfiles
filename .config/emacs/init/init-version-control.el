;;; init-version-control.el --- init version control -*- lexical-binding: t; -*-
;; Code:

;; Disable `vc.el` mode line
(use-package vc
  :diminish
  :config
  (setq-default mode-line-format
                (delete '(vc-mode vc-mode) mode-line-format)))

;; Git version control management
(use-package magit
  :diminish)

;; Git status in the document margins
(use-package diff-hl
  :hook
  (magit-pre-refresh-hook . diff-hl-magit-pre-refresh)
  (magit-post-refresh-hook . diff-hl-magit-post-refresh)
  :init
  (diff-hl-flydiff-mode))

(provide 'init-version-control)
;;; init-version-control.el ends here
