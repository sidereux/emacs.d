;; DO NOT USE GNU STYLE OF INDENTING
(setq c-default-style "linux"
      c-basic-offset 4)

;; enable flycheck-mode for c-mode
(add-hook 'c-mode-common-hook 'flycheck-mode)

;; enable gtags-mode
(add-hook 'c-mode-common-hook 'gtags-mode)

;; make '_' as a word character
(add-hook 'c-mode-common-hook 
          (lambda () (progn
                       (modify-syntax-entry ?_ "w" c-mode-syntax-table)
                       (modify-syntax-entry ?_ "w" c++-mode-syntax-table))))

;; enable highlight indentation
(add-hook 'c-mode-common-hook 'highlight-indentation-mode)

(provide 'init-c)
