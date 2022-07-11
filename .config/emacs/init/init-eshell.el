;;; init-eshell.el --- init eshell -*- lexical-binding: t; -*-
;;; Code:

(use-package eshell-z
  :hook (eshell-mode . (lambda () (require 'eshell-z))))

(use-package ansi-color
  :hook (compilation-filter . ansi-color-compilation-filter))

(provide 'init-eshell)
;;; init-eshell.el ends here
