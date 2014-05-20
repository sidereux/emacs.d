(require 'package)

(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

; require package function
(defun require-package (package &optional refresh)
  (if (package-installed-p package)
      t
    (if (or (assoc package package-archive-contents) refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package)))))

(package-initialize)

(provide 'init-elpa)
