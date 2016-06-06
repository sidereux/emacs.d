;; go get -v -u github.com/golang/lint/golint
;; go get -v -u github.com/kisielk/errcheck

;; Set http_proxy and https_proxy environment variable when run 'go get'

;; go get -u github.com/nsf/gocode
(add-hook 'go-mode-hook 'go-eldoc-setup)



(provide 'init-golang)
