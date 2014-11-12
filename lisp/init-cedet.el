;; configuration for CEDET and ECB

;; Enable CEDET
(require 'cedet)

(setq semantic-default-submodes
      (append '(global-semantic-highlight-func-mode
                global-semantic-idle-local-symbol-highlight-mode)
              semantic-default-submodes))

(semantic-mode t)
(require 'semantic/ia)
(require 'semantic/bovine/gcc)

;; Install and enable ECB
(require-package 'ecb)
(require 'ecb)

(provide 'init-cedet)
