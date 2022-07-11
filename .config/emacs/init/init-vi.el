;;; init-vi.el --- init vi -*- lexical-binding: t; -*-
;;; Code:
(use-package evil
  :diminish

  :config
  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal)
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  :init
  (setq-default evil-shift-width tab-width)

  (setq evil-want-integration t
        evil-want-keybinding nil
        evil-want-C-u-scroll t
        evil-respect-visual-line-mode t
        evil-undo-system 'undo-tree
        evil-mode-line-format nil))

;;; Text objects
(use-package evil-collection
  :after evil
  :diminish
  :diminish 'evil-collection-unimpaired-mode
  :config
  (evil-collection-init))

(use-package evil-surround
  :config
  (global-evil-surround-mode 1))

;;; Normal state key chord
(use-package key-chord
  :config
  (key-chord-define evil-insert-state-map "kj" 'evil-normal-state)
  (key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
  (key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
  :init
  (key-chord-mode 1))


(provide 'init-vi)
;;; init-vi ends here
