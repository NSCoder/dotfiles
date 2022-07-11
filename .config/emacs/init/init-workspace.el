;;; init-workspace.el --- init workspace -*- lexical-binding: t; -*-
;; Code:

;; Support for multiple workspaces
(use-package perspective
  :custom
  (persp-mode-prefix-key (kbd "C-c M-p"))
  :init
  (setq-default persp-show-modestring nil)
  (persp-mode))

;; Handle certain buffers as pop ups
(use-package popper
  :bind (("M-`"   . popper-toggle-latest)
         ("C-`"   . popper-cycle)
         ("C-M-`" . popper-toggle-type))
  :config
  (setq popper-group-function #'popper-group-by-perspective)
  :init
  (setq popper-reference-buffers
        '("\\*Messages\\*"
          "\\*Warnings\\*"
          "Output\\*$"
          "\\*Async Shell Command\\*"
          help-mode
          compilation-mode
          "^\\*eshell.*\\*$" eshell-mode))
  (popper-mode +1)
  (popper-echo-mode))

(provide 'init-workspace)
;;; init-workspace.el ends here
