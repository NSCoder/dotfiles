;;; init-package-manager.el --- init package manager -*- lexical-binding: t; -*-
;;; Code:

(defvar bootstrap-version)

(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Use straight package instead of require
(setq straight-use-package-by-default t)

;; Install use-package
(straight-use-package 'use-package)

;; Add functionality to hide minor modes from the mode line
(use-package diminish)

(provide 'init-package-manager)
;;; init-package-manager.el ends here
