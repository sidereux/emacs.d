;;; init-lisp --- lsp settings
;;; Commentary:
;;; Code:
(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :config
  (setq-default lsp-prefer-flymake nil)
  )
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)
(use-package company-lsp
  :ensure t
  :commands company-lsp)

(provide 'init-lsp)
;;; init-lsp.el ends here
