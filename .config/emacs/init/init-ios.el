;;; init-ios.el --- init ios -*- lexical-binding: t; -*-
;;; Code:

(use-package swift-mode
  :hook
  (swift-mode . ns/on-swift-mode))

(defun ns/on-swift-mode ()
  "Initializations executed ehen swift-mode is loaded"
  (eglot-ensure)
  (setq display-fill-column-indicator-column 120)
  (display-fill-column-indicator-mode 120))

;; Swift help
(use-package swift-helpful)

(defun ns/swift-current-buffer-compilation-command ()
  "Compilation command for current buffer"
  (interactive)
  (save-some-buffers 1)
  (concat "swift " (buffer-file-name)))

(provide 'init-ios)
;;; init-ios.el ends here
