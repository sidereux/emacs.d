;; DO NOT USE GNU STYLE OF INDENTING
(setq c-default-style "linux"
      c-basic-offset 4)

;; make '_' as a word character
(add-hook 'c-mode-common-hook 
          (lambda () (progn
                       (modify-syntax-entry ?_ "w" c-mode-syntax-table)
                       (modify-syntax-entry ?_ "w" c++-mode-syntax-table))))

;; enable highlight indentation and flycheck
(add-hook 'c-mode-common-hook 'highlight-indentation-mode)
(add-hook 'c-mode-common-hook 'flycheck-mode)
(add-hook 'c-mode-common-hook 'yas-minor-mode)

(provide 'init-c)
