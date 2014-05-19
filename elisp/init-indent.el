; Use space instead of tab
(setq-default indent-tabs-mode nil)

; DO NOT USE GNU STYLE OF INDENTING
(setq c-default-style
      '((java-mode . "java")
        (awk-mode . "awk")
        (other . "linux")))
(setq c-basic-offset 4)

; Set indents to 4 spaces
(setq-default tab-width 4)
(customize-variable (quote tab-stop-list))


(provide 'init-indent)
