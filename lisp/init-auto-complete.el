(require-package 'auto-complete)
(require-package 'auto-complete-clang)
(require-package 'auto-complete-c-headers)

(require 'auto-complete-config)
(require 'auto-complete-clang)
(require 'auto-complete-c-headers)

(defun my-ac-cc-mode-setup ()
  (setq ac-sources (append '(ac-source-clang
                             ac-source-yasnippet
                             ac-source-c-headers) ac-sources)))
(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)



(global-auto-complete-mode t)

(ac-config-default)

(provide 'init-auto-complete)
