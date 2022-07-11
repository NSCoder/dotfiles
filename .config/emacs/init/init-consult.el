;;; init-consult.el --- init consult -*- lexical-binding: t; -*-
;;; Code:

;; Add practical commands on top of emacs completion
;; functions
(use-package consult
  :after perspective
  :bind (
         ;; C-x bindings
         ("C-x b" . consult-buffer) ;; switch-to-buffer
         ("C-x C-b" . consult-buffer) ;; switch-to-buffer
         ("C-x 4 b" . consult-buffer-other-window) ;; switch-to-buffer-other-window
         ("C-x r b" . consult-bookmark) ;; bookmark-jump
         ("C-x p b" . consult-project-buffer) ;; project-switch-to-buffer

         ;; M- bindings
         ("M-y" . consult-yank-pop) ;; yank-pop

         ;; M-g bindings (goto-map)
         ("M-g g" . consult-goto-line) ;; goto-line
         ("M-g M-g" . consult-goto-line) ;; goto-line
         ("M-g o" . consult-outline)
         ("M-g m" . consult-mark)
         ("M-g k" . consult-global-marks)

         ;; M-s bindings (search-map)
         ("M-s d" . consult-find)
         ("M-s D" . consult-locate)
         ("M-s g" . consult-grep)
         ("M-s G" . consult-git-grep)
         ("M-s r" . consult-ripgrep)
         ("M-s l" . consult-line)
         ("M-s L" . consult-line-multi)
         ("M-s m" . consult-multi-occur)
         ("M-s k" . consult-keep-lines)
         ("M-s u" . consult-focus-lines)

         ;; Isearch bindings
         ("M-s e" . consult-isearch-history)

         :map isearch-mode-map
         ("M-e" . consult-isearch-history) ;; isearch-edit-string
         ("M-s e" . consult-isearch-history) ;; isearch-edit-string
         ("M-s l" . consult-line)
         ("M-s L" . consult-line-multi)

         ;; Minibuffer bindings
         :map minibuffer-local-map
         ("M-s" . consult-history) ;; next-matching-history-element
         ("M-r" . consult-history)) ;; previous-matching-history-element
  :hook (completion-list-mode . consult-preview-at-point-mode)
  :init
  (advice-add #'register-preview :override #'consult-register-window)
  :config
  (consult-customize
   consult-ripgrep
   consult-git-grep
   consult-grep
   consult-bookmark
   consult-recent-file
   consult-xref
   consult--source-bookmark
   consult--source-recent-file
   consult--source-project-recent-file
   :preview-key '(:debounce 0.2 any))

  ;; Integrate consult with perspective.el
  (consult-customize consult--source-buffer :hidden t :default: nil)
  (add-to-list 'consult-buffer-sources persp-consult-source)


  ;; Integrate with project.el
  (setq consult-project-function #'consult--default-project-function)

  ;; Integrate with projectile
  ;; (autoload 'projectile-project-root "projectile")
  ;; (setq consult-project-function (lambda (_) (projectile-project-root)))

  (setq completion-in-region-function
        (lambda (&rest args)
          (apply (if vertico-mode
                     #'consult-completion-in-region
                   #'completion--in-region)
                 args)))

  (setq consult-narrow-key "<"))

;; Consult enhancements for `project.el`
(use-package consult-project-extra)

;; Consult enhancements for `embark.el`
(use-package embark-consult
  :after (embark consult)
  :demand t
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

;; Consult enhancements for `org-roam.el`
(use-package consult-org-roam
  :diminish
  :init
  (require 'consult-org-roam)
  (consult-org-roam-mode 1)
  :custom
  (consult-org-roam-grep-func #'consult-ripgrep)
  :bind
  ("C-c n f" . consult-org-roam-file-find)
  ("C-c n b" . consult-org-roam-backlinks)
  ("C-c n r" . consult-org-roam-search))

;; Consult enhancements for `eglot.el` (LSP)
(use-package consult-eglot)

(provide 'init-consult)
;;; init-consult.el ends here
