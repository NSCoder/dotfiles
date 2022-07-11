;;; init-prog.el --- init prog -*- lexical-binding: t; -*-
;;; Code:

;; lsp
(defconst ns/sourcekit-command
  (string-trim (shell-command-to-string "xcrun --find sourcekit-lsp")))

(defconst ns/swift-lsp-command
  `(swift-mode ,ns/sourcekit-command))

(use-package eglot
  :diminish
  :config
  (add-to-list 'eglot-server-programs (list ns/swift-lsp-command)))

;; HTTP Client
(use-package restclient)

;; YAML mode
(use-package yaml-mode
  :mode "\\.ya?ml\\'")

;; Remove whitespaces
(use-package ws-butler
  :diminish
  :hook
  (text-mode . ws-butler-mode)
  (prog-mode . ws-butler-mode))

(provide 'init-prog)
;;; init-prog ends here
