;; set highlight indentation
(add-hook 'python-mode-hook 'highlight-indentation-mode)

;; enable flycheck for python-mode
;; pip install pylint
(add-hook 'python-mode-hook 'flycheck-mode)

;; make '_' a word character
(add-hook 'python-mode-hook
          (lambda () (modify-syntax-entry ?_ "w" python-mode-syntax-table)))

(add-hook 'python-mode-hook 'anaconda-mode)

(provide 'init-python)
