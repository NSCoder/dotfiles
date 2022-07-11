;;; init-project.el --- init project -*- lexical-binding: t; -*-
;;; Code:

(use-package project)

(defun ns/project-root-async-shell-command (command)
  "Runn a shell command at the root of the project"
  (let ((default-directory (project-root (project-current t))))
    (async-shell-command command)))

;; Disabled
(use-package projectile
  :disabled
  :diminish
  :init
  (projectile-mode +1)
  :config
  (setq projectile-project-search-path '(("~/Developer" . 2)))
  (setq projectile-indexing-method 'alien)
  (setq projectile-switch-project-action 'consult-projectile-find-file)
  :bind
  (:map projectile-mode-map
        ("S-p" . projectile-command-map)
        ("C-c p" . projectile-command-map)))

;; Disabled
(use-package consult-projectile
  :disabled)


(provide 'init-project)
;;; init-project.el ends here
