;;; init-python ---  python config
;;; Commentary:
;;; Code:

(add-hook 'python-mode-hook #'lsp-deferred)
(add-hook 'python-mode-hook
          (lambda () (modify-syntax-entry ?_ "w" python-mode-syntax-table)))

(provide 'init-python)
;;; init-python.el ends here
