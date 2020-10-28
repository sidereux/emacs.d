;;; init-lisp --- lsp settings
;;; Commentary:
;;; Code:
(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :config
  (setq-default lsp-prefer-flymake nil)
  (add-to-list 'lsp-disabled-clients '(web-mode . angular-ls))
  )

(use-package company-lsp
  :ensure t
  :commands company-lsp
  )

(provide 'init-lsp)
;;; init-lsp.el ends here
