; set highlight indentation
(add-hook 'python-mode-hook 'highlight-indentation-mode-hook)

; enable flycheck for python-mode
; pip install pylint
(add-hook 'python-mode-hook 'flycheck-mode)


;install elpy
;pip install elpy jedi
(require-package 'elpy)

(elpy-enable)

; disable flymake
(setq elpy-default-minor-modes (delete 'flymake-mode elpy-default-minor-modes))


; elpy disabled completion with RET key
; which is annoying
(define-key ac-completing-map (kbd "RET") 'ac-complete)
(define-key ac-completing-map (kbd "<return>") 'ac-complete)

(provide 'init-python)
