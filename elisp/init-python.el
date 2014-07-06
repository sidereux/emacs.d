; set highlight indentation
(add-hook 'python-mode-hook 'highlight-indentation-mode-hook)

; enable flycheck for python-mode
(add-hook 'python-mode-hook 'flycheck-mode)


; elpy disabled completion with RET key
; which is annoying
(define-key ac-completing-map (kbd "RET") 'ac-complete)
(define-key ac-completing-map (kbd "<return>") 'ac-complete)

(provide 'init-python)
