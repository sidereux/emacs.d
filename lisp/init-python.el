;; set highlight indentation
(add-hook 'python-mode-hook 'highlight-indentation-mode)

;; enable flycheck for python-mode
;; pip install pylint
(add-hook 'python-mode-hook 'flycheck-mode)

;; install jedi
(require-package 'jedi)

;; Install jedi server:
;; M-x jedi:install-server
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(provide 'init-python)
