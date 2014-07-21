; set highlight indentation
(add-hook 'python-mode-hook 'highlight-indentation-mode-hook)

; enable flycheck for python-mode
; pip install pylint
(add-hook 'python-mode-hook 'flycheck-mode)


(provide 'init-python)
