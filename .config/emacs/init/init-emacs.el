;;; init-emacs.el --- init emacs -*- lexical-binding: t; -*-
;; Code:

(use-package emacs
  :diminish
  (eldoc-mode)
  :bind
  ("<escape>" . 'keyboard-escape-quit)
  :config
  (setq inhibit-startup-message t ;; Hide welcome message
        native-comp-async-report-warnings-errors nil ;; Hide native compilation errors
        mac-option-modifier 'super
        mac-command-modifier 'meta
        enable-recursive-minibuffers t)

  ;; Hide VC mode from the mode line
  (vc-mode-line -1)

  ;; Highlight the current line in all buffers
  (global-hl-line-mode)

  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (scroll-bar-mode -1)
  (set-fringe-mode 10)

  (defalias 'yes-or-no-p 'y-or-n-p)

  ;; Disable visual bell and convert the audio bell to a mode line flash
  (setq visible-bell nil
        ring-bell-function 'ns/flash-mode-line)

  ;; Enable local variables
  ;; Using it to avoid the `.dir-locals.el` security prompt
  (setq-default enable-local-variables t)

  ;; Tab/Space defaults
  (setq-default tab-width 2
                indent-tabs-mode nil)

  ;; Customize mode line
  (setq display-time-format "%l:%M %p %b %y"
        display-time-default-load-average nil)

  ;; Show column numbers
  (column-number-mode)

  ;; macOS-ish title bar
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))

  :init
  (set-face-attribute 'default nil :font "SF Mono-13")
  (set-face-attribute 'variable-pitch nil :font "SF Pro Text-14")
  (set-face-attribute 'mode-line nil :font "SF Mono-13")
  (set-face-attribute 'fixed-pitch nil :font "SF Mono-13")

  ;; Default window size
  (when window-system
    (set-frame-size (selected-frame) 140 70))
 
  ;; Enable M-left M-right M-top M-down bindings for window movement
  (windmove-default-keybindings 'meta)

  ;; Update buffer when file changed outside emacs
  (global-auto-revert-mode 1)
  ;; Update dired when directories are modified outside emacs
  (setq global-auto-revert-non-file-buffers t)

  :hook ((text-mode . ns/display-line-numbers-turn-on)
         (prog-mode . ns/display-line-numbers-turn-on)
         (conf-mode . ns/display-line-numbers-turn-on)
         (org-mode . ns/display-line-numbers-turn-off)))

(defun ns/display-line-numbers-turn-on ()
  "Turns on the line numbers for the current buffer."
  (display-line-numbers-mode 1))

(defun ns/display-line-numbers-turn-off ()
  "Turns off the line numbers for the current buffer."
  (display-line-numbers-mode 0))

(defun ns/flash-mode-line ()
  "Inverts the color of the mode line to create a flash animation."
  (invert-face 'mode-line)
  (run-with-timer 0.1 nil #'invert-face 'mode-line))

;; Emacs files management
(use-package no-littering
  :init
  (setq no-littering-etc-directory
        (expand-file-name "config/" user-emacs-directory))
  (setq no-littering-var-directory
        (expand-file-name "data/" user-emacs-directory))
  :config
  ;; Move autosave files to its own temporary folder
  (setq auto-save-file-name-transforms `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))
  ;; Save emacs customizations in its own file
  (setq custom-file (no-littering-expand-etc-file-name "custom.el")))

;; Load path environment variable from shell
(use-package exec-path-from-shell
  :init
  (exec-path-from-shell-initialize))

;; Improved Help Buffers
(use-package helpful
  :bind
  ("C-h ." . helpful-at-point)
  ([remap describe-function] . helpful-callable)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . helpful-variable)
  ([remap describe-key] . helpful-key))

(provide 'init-emacs)
;;; init-emacs.el ends here
