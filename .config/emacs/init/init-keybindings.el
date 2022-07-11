;;; init-keybindings.el --- init keybindings -*- lexical-binding: t; -*-
;;; Code:

(use-package general
  :init
  (general-evil-setup)
  :config

  ;; Because Evil takes over C-u, re-bind universal argument
  (general-define-key
   "C-M-u" 'universal-argument)
  ;; (general-define-key
  ;;  :states '(normal)
  ;;  "TAB" 'evil-prev-buffer
  ;;  "<backtab>" 'evil-next-buffer)
  ;; (general-define-key
  ;;  :states '(normal insert visual)
  ;;  ;; "M-." 'consult-company
  ;;  ;; "M-r" 'recompile
  ;;   ;; "M-r" '(projectile-run-project :which-key "run project")
  ;;   ;; "M-u" '(projectile-test-project :which-key "test project")
  ;;   "M-b" '(project-compile :which-key "compile project"))
  (general-create-definer ns/leader-def
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC"))

(ns/leader-def
    "." '(consult-company :which-key "autocomplete at point")
    "b" '(consult-buffer :which-key "buffer list")
    ;; "b" '(:ignore t :which-key "buffers")
    ;; "bb" '(consult-buffer :which-key "buffer list")
    ;; "bi" '(ibuffer :which-key "buffer interactive")
    ;; "bk" '(kill-buffer :which-key "buffer close")
    "o" '(:ignore t :which-key "bookmarks")
    "oa" '(bookmark-set :which-key "bookmark add/set")
    "os" '(bookmark-save :which-key "bookmark save")
    "oo" '(consult-bookmark :which-key "find bookmark")
    "t" '(:ignore t :which-key "toggles")
    "tt" '(consult-theme :which-key "choose theme")
    "ts" '(origami-toggle-node :which-key "fold/unfold")
    "f" '(:ignore t :which-key "files")
    "ff" '(consult-find :which-key "find/open file")
    "fr" '(consult-recent-file :which-key "recent-files")
    "e" '(:ignore t :which-key "perspective")
    "ef" '(persp-switch :which-key "switch perspective")
    "es" '(persp-switch :which-key "switch perspective")
    "p" '(:ignore t :which-key "projects")
    ;; Project.el
    "pp" '(project-switch-project :which-key "switch project")
    "pr" '(consult-recent-file :which-key "recent files")
    "pf" '(consult-project-extra-find-other-window :which-key "find file other window")
    "pF" '(consult-project-extra-find :which-key "find file")
    "pb" '(consult-project-buffer :which-key "project buffers")
    ;; Projectile
    ;; "pp" '(consult-projectile-switch-project :which-key "switch project")
    ;; "pr" '(consult-projectile-recentf :which-key "recent files")
    ;; "pf" '(consult-projectile-find-file :which-key "find file")
    ;; "pb" '(consult-projectile-switch-to-buffer :which-key "find buffer")

    "pm" '(magit-project-status :which-key "project git status")
    "x" '(:ignore t :which-key "elisp evaluate")
    "xx" '(eval-last-sexp :which-key "expression")
    "xf" '(eval-defun :which-key "function")
    "\\" '(:ignore t :which-key "environment configuration")
    "\\e" '((lambda () (interactive) (find-file "~/.config/emacs/init.el")) :which-key "emacs init.el")
    "w" '(:ignore t :which-key "windows")
    "wk" '(delete-window :which-key "window delete")
    "wh" '(split-window-vertically :which-key "window horizontal split")
    "wv" '(split-window-horizontally :which-key "window vertical split")
    "0" '(delete-window :which-key "window delete")
    "1" '(delete-other-windows :which-key "window delete other")
    "2" '(split-window-vertically :which-key "window horizontal split")
    "3" '(split-window-horizontally :which-key "window vertical split")
    "=" '(balance-windows :which-key "window balance")
    "`" '(eshell-toggle :which-key "shell")
    "a" '(:ignore t :which-key "arc commands")
    "al" '((lambda () (interactive) (ns/project-async-shell-command "arc list")) :which-key "arc list")
    "r" '(leetcode-try :which-key "leetcode try")
    "s" '(leetcode-submit :which-key "leetcode submit")
    "n" '(:ignore t :which-key "org mode")
    "nf" '(org-roam-node-find :which-key "find node")
    "nF" '(consult-org-roam-file-find :which-key "find file node")
    "nn" '(org-roam-capture :which-key "capture/new node")
    "nt" '(org-roam-buffer-toggle :which-key "toggle roam buffer")
    "ni" '(org-roam-node-insert :which-key "insert node")
    "ns" '(org-structure-template-alist :which-key "insert snippet")
    "nh" '(consult-outline :which-key "outline")
    "na" '(org-attach :which-key "attach to node")
    "nI" '(org-toggle-inline-images :which-key "toggle-inline-images")
    "j" '(:ignore t :which-key "org mode journal")
    "jc" '(org-roam-dailies-capture-today :which-key "create a journal note for today")
    "jt" '(org-roam-dailies-goto-today :which-key "today's journal")
    "j<" '(org-roam-dailies-goto-previous-note :which-key "previous day")
    "j>" '(org-roam-dailies-goto-next-note :which-key "next day"))

(provide 'init-keybindings)
;;; init-keybindings.el ends here
