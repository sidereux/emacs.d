(require-package 'json-mode)
(require-package 'js2-mode)
(require-package 'ac-js2)

;; Set javascript indents to 2 spaces
(setq js-indent-level 2)

;; make '_' a word character
(add-hook 'python-mode-hook
          (lambda () (modify-syntax-entry ?_ "w" python-mode-syntax-table)))

;; set js2-mode as major mode for javascript
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; set js2-mode indent
(setq js2-basic-offset 2)

;; set highlight indentation
(add-hook 'js2-mode-hook 'highlight-indentation-mode)

;; npm install -g eslint
(add-hook 'js2-mode-hook 'flycheck-mode)
;; npm install -g jsonlint
(add-hook 'json-mode-hook 'flycheck-mode)


(provide 'init-javascript)

