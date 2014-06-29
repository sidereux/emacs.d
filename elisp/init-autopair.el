(require-package 'autopair)

(autopair-global-mode)
(setq autopair-autowrap 1)

; stop blink, improve performance
(setq autopair-blink nil)


(provide 'init-autopair)
