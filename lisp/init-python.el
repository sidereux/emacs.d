;;; init-python ---  python config
;;; Commentary:
;;; Code:


(use-package python
  :config
  (add-hook 'python-mode-hook #'lsp-deferred)
  (add-hook 'python-mode-hook
            (lambda () (modify-syntax-entry ?_ "w" python-mode-syntax-table)))
  )

(use-package yapfify
  :ensure t
  )

(provide 'init-python)
;;; init-python.el ends here
