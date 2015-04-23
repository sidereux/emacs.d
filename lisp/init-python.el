;; enable highlight indentation and flycheck
(add-hook 'python-mode-hook 'highlight-indentation-mode)
(add-hook 'python-mode-hook 'flycheck-mode)

;; make '_' a word character
(add-hook 'python-mode-hook
          (lambda () (modify-syntax-entry ?_ "w" python-mode-syntax-table)))

(add-hook 'python-mode-hook 'anaconda-mode)

;; virtualenvwrapper
(require-package 'virtualenvwrapper)
(require 'virtualenvwrapper)
(venv-initialize-interactive-shells)
(venv-initialize-eshell)


(provide 'init-python)
