;; configuration for CEDET


;; Enable CEDET
(require 'cedet)

(setq semantic-default-submodes
      (append '(global-semanticdb-minor-mode
                global-semantic-idle-scheduler-mode
                global-semantic-idle-local-symbol-highlight-mode
                global-semantic-idle-summary-mode)
              semantic-default-submodes))

(semantic-mode t)
(require 'semantic/ia)
(require 'semantic/bovine/gcc)

;; enable support for gnu global
(semanticdb-enable-gnu-global-databases 'c-mode)


(provide 'init-cedet)
