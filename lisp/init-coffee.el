(require-package 'coffee-mode)

;; set tab width to 2
(custom-set-variables '(coffee-tab-width 2))

;; enable highlight indentation and flycheck
(add-hook 'coffee-mode-hook 'highlight-indentation-mode-hook)
(add-hook 'coffee-mode-hook 'flycheck-mode)

(provide 'init-coffee)
