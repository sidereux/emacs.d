;;; package --- Summary:

;;; Commentary:
;; go get -u -v github.com/golang/lint/golint
;; go get -u -v github.com/kisielk/errcheck
;;
;; # Set http_proxy and https_proxy environment variable when run 'go get'
;;
;; go get -u -v github.com/nsf/gocode
;; go get -u -v github.com/rogpeppe/godef
;;
;; go get -u -v github.com/golang/mock/gomock
;; go get -u -v github.com/golang/mock/mockgen

;;; Code:
(add-hook 'go-mode-hook 'go-eldoc-setup)

(add-hook 'go-mode-hook '(lambda () (add-hook 'before-save-hook 'gofmt nil t)))

(require-package 'go-projectile)

(defun my:setenv-gopath ()
  "Set GOPATH environment variable."
  (interactive)
  (let ((mypath (ido-read-directory-name "Choose directory: ")))
    (message (format "Setting GOPATH to %s" mypath))
    (setenv "GOPATH" mypath)
    ))

(provide 'init-golang)
;;; init-golang.el ends here
