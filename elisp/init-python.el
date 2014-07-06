; set highlight indentation
(add-hook 'python-mode-hook 'highlight-indentation-mode-hook)


; elpy disabled completion with RET key
; which is annoying
(define-key ac-completing-map (kbd "RET") 'ac-complete)
(define-key ac-completing-map (kbd "<return>") 'ac-complete)

(provide 'init-python)
