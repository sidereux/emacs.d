(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))

(require 'init-elpa)
(require 'init-common)

;; load init-elpa before init-auto-complete
(require 'init-plugin)
(require 'init-ido)
(require 'init-helm)
(require 'init-c)
(require 'init-python)
(require 'init-javascript)
(require 'init-coffee)
(require 'init-evil)

;; load custom.el if exist
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))
