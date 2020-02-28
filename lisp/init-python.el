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

(use-package flycheck-mypy
  :ensure t
  :config
  (add-to-list 'flycheck-disabled-checkers 'python-flake8)
  (add-to-list 'flycheck-disabled-checkers 'python-pylint)
  )

(provide 'init-python)
;;; init-python.el ends here
