;; DO NOT USE GNU STYLE OF INDENTING
(setq c-default-style "linux"
      c-basic-offset 4)

;; enable flycheck-mode for c-mode
(add-hook 'c-mode-common-hook 'flycheck-mode)

;; enable gtags-mode
(add-hook 'c-mode-common-hook 'gtags-mode)


(provide 'init-c)
