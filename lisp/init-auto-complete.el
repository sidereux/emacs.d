(require-package 'auto-complete)
(require-package 'auto-complete-clang)

(require 'auto-complete-config)
(require 'auto-complete-clang)

(defun my-ac-cc-mode-setup ()
  (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))
(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)

(global-auto-complete-mode t)

(ac-config-default)

(provide 'init-auto-complete)
