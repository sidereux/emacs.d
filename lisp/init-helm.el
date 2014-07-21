(require-package 'helm)
(require-package 'helm-ls-git)

(require 'helm-config)
(require 'helm-ls-git)
(global-set-key (kbd "C-c h") 'helm-mini)


(provide 'init-helm)
