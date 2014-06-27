; set highlight indentation
(add-hook 'python-mode-hook 'highlight-indentation-mode-hook)

(require-package 'elpy)

(elpy-enable)


(provide 'init-python)
