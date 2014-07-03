(require 'package)

;(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

; require package function
; If package already installed, then skip
; If package name in package-archive-contents or no-refresh is t,
; then install the package
; else refresh package contents and call require-package again
; with no-refresh
(defun require-package (package &optional no-refresh)
  (if (package-installed-p package)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package t)))))

(package-initialize)

(provide 'init-elpa)
