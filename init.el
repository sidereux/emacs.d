(add-to-list 'load-path (expand-file-name "elisp" user-emacs-directory))

(require 'init-elpa)
(require 'init-customize)
(require 'init-indent)

; load init-elpa before init-auto-complete
(require 'init-flycheck)
(require 'init-autopair)
(require 'init-highlight-indentation)
(require 'init-auto-complete)
(require 'init-cedet)
(require 'init-javascript)
(require 'init-python)
(require 'init-c)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
