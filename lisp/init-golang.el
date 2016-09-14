;; INSTALL go get -v -u github.com/golang/lint/golint
;; INSTALL go get -v -u github.com/kisielk/errcheck

;; Set http_proxy and https_proxy environment variable when run 'go get'

;; INSTALL go get -u github.com/nsf/gocode
;; INSTALL go get -u github.com/rogpeppe/godef
(add-hook 'go-mode-hook 'go-eldoc-setup)

(require-package 'go-projectile)


(provide 'init-golang)
