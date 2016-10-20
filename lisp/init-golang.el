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

(add-hook 'go-mode-hook 'go-eldoc-setup)

(require-package 'go-projectile)

(provide 'init-golang)
