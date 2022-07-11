;;; init-ui-completion.el --- init ui completion -*- lexical-binding: t; -*-
;;; Code:

;; Completion UI
(use-package vertico
  ;; :ensure t
  :init
  (vertico-mode)
  :custom
  (vertico-count 10)
  (vertico-resize t)
  (vertico-cycle t))

;; Add annotations to minibuffer completions
(use-package marginalia
  :after vertico
  :custom
  (marginalia-align 'right)
  :init
  (marginalia-mode))

;; Completion search algorithm
(use-package orderless
  :init
  :custom
  (completion-styles '(orderless))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles . (partial-completion)))
                                   (eglot (styles orderless)))))

;; Autocompletion
(use-package corfu
  :config
  (setq corfu-auto-delay 0
        corfu-auto t
        corfu-quit-no-match 'separator)
  :init
  (global-corfu-mode)
  :hook
  (eshell-mode . (lambda () (setq corfu-auto nil) (corfu-mode))))

;; Add documentation window to autocomplete
(use-package corfu-doc)

;; Add additional autocomplete sources
(use-package cape
  :init
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev))

;; Visual command menu/discovery
(use-package which-key
  :diminish
  :config
  (setq which-key-idle-delay 0)
  :init
  (which-key-mode))

;; Save minibuffer history
(use-package savehist
  :config
  (setq history-length 25)
  :init
  (savehist-mode 1))

(provide 'init-ui-completion)
;;; init-ui-completion.el ends here
