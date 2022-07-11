;;; init-org-roam.el --- init org roam -*- lexical-binding: t; -*-
;;; Code:

(use-package org-roam
  :bind
  (("C-c n l" . org-roam-buffer-toggle)
   ("C-c n f" . org-roam-node-find)
   ("C-c n i" . org-roam-node-insert)
   :map org-mode-map
   ("C-M-i" . completion-at-point))

  :config
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:30}" 'face 'org-tag)))
  (org-roam-db-autosync-mode)
  (org-roam-setup)

  :custom
  (org-roam-directory ns/org-path)
  (org-roam-completion-everywhere t)
  (org-roam-dailies-directory "journal/")
  (org-roam-dailies-capture-templates ns/dailies-templates)
  (org-roam-capture-templates ns/org-capture-templates)

  :init
  (setq org-roam-v2-ack t))

(defconst ns/org-templates-directory (concat ns/org-path "/templates/"))

(defconst ns/org-dailies-templates
  '(("d" "default" entry "* %?\n[%<%I:%M %p>]"
     :if-new (file+head "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n"))))

(defconst ns/org-capture-default-template
  '("d" "default"
    plain
    "%?"
    :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
    :unnarrowed t))

(defconst ns/org-capture-leetcode-template
  `("l" "leetcode"
    plain
    (file ,(concat ns/org-templates-directory "leetcode.org"))
    :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                       "#+title: [Leetcode] %^{Problem ID}. ${title}\n#+date: %U\n#+filetags: leetcode\n")
    :unnarrowed t
    :empty-lines-before 1))

(defconst ns/org-capture-templates
  (list ns/org-capture-default-template
        ns/org-capture-leetcode-template))

(provide 'init-org-roam)
;;; init-org-roam.el ends here
