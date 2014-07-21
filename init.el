(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))

(require 'init-elpa)
(require 'init-common)
(require 'init-indent)

; load init-elpa before init-auto-complete
(require 'init-themes)
(require 'init-gtags)
(require 'init-flycheck)
(require 'init-autopair)
(require 'init-highlight-indentation)
(require 'init-auto-complete)
(require 'init-cedet)
(require 'init-javascript)
(require 'init-python)
(require 'init-c)
(require 'init-evil)
(require 'init-smex)
(require 'init-anzu)
(require 'init-helm)
(require 'init-ido)
(require 'init-uniquify)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
