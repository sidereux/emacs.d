
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; (package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; (require 'org)
;; (defun my:org-babel-load-file (filename &optional folder)
;;   "Load org file FILENAME as init file.
;; If FOLDER provided, then look for file in folder."
;;   (interactive)
;;   (let ((fullpath (expand-file-name
;;                    filename
;;                    (if folder
;;                        (expand-file-name folder user-emacs-directory)
;;                      (expand-file-name user-emacs-directory)))))
;;     (message fullpath)
;;     (org-babel-load-file fullpath)))

;; (my:org-babel-load-file "org/elpa.org")
;; (my:org-babel-load-file "org/init-golang.org")
;; (my:org-babel-load-file "org/init-vc.org")
;; (my:org-babel-load-file "org/init-org.org")

(require 'init-util)
(require 'init-common)
(require 'init-elpa)

;; load init-elpa before init-auto-complete
(require 'init-evil)
(require 'init-windows)
(require 'init-plugin)
(require 'init-helm)
(require 'init-ido)
(require 'init-c)
(require 'init-python)
(require 'init-javascript)
(require 'init-coffee)
(require 'init-terminal)
(require 'init-golang)
(require 'init-org)

;; load custom.el if exist
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

