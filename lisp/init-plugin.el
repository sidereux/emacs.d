;;; init-plugin.el --- common plugins

;;; Theme
(require-package 'color-theme-sanityinc-tomorrow)
(require 'color-theme-sanityinc-tomorrow)
(load-theme 'sanityinc-tomorrow-night t)


;;; Anzu
(require-package 'anzu)
(global-anzu-mode +1)


;;; golang support - required by company-go
(require-package 'go-mode)
(require-package 'go-eldoc)

(require 'go-mode-autoloads)
(require 'go-eldoc)


;;; company-mode - Modular in-buffer completion framework
(require-package 'company)
(require-package 'company-c-headers)
(require-package 'company-anaconda)
(require-package 'company-go)

(require 'company-go)

(setq company-c-headers-path-system
      '("/usr/include/"
        "/usr/local/include/"
        "/usr/include/x86_64-linux-gnu/"))

(setq company-clang-arguments
      '("-I/usr/include/"
        "-I/usr/local/include/"
        "-I/usr/include/x86_64-linux-gnu/"))

(global-set-key (kbd "C-c f") 'company-files)

(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'global-company-mode-hook
          (lambda ()
            ;; remove annoying blinking
            (setq company-echo-delay 0)
            (progn
              (add-to-list 'company-backends 'company-c-headers)
              (add-to-list 'company-backends 'company-anaconda)
              (add-to-list 'company-backends 'company-go)
              )))


;;; Highlight Indentation
(require-package 'highlight-indentation)
(add-hook 'emacs-lisp-mode-hook 'highlight-indentation-mode)


;;; Uniquify - Making buffer names unique
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)


;;; Flycheck - Modern on the fly syntax checking
;; Quick start : http://www.flycheck.org/manual/latest/Quickstart.html
(require-package 'flycheck)


;;; Markdown mode
(require-package 'markdown-mode)

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;;; adoc-mode
(require-package 'adoc-mode)
(require 'adoc-mode)
(add-to-list 'auto-mode-alist (cons "\\.adoc\\'" 'adoc-mode))
(add-hook 'adoc-mode-hook (lambda() (buffer-face-mode t)))

;;; lua-mode
(require-package 'lua-mode)
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

;;; cmake-mode
(require-package 'cmake-mode)

;;; rainbow-delimiters
(require-package 'rainbow-delimiters)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)

;;; ace-jump-mode
(require-package 'ace-jump-mode)
(autoload 'ace-jump-mode "ace-jump-mode" "Emacs quick move minor mode" t)
;; (define-key global-map (kbd "C-c j") 'ace-jump-mode)

;; (autoload 'ace-jump-mode-pop-mark "ace-jump-mode" "Ace jump back:-)" t)
;; (eval-after-load "ace-jump-mode" '(ace-jump-mode-enable-mark-sync))
;; (define-key global-map (kbd "C-c p") 'ace-jump-mode-pop-mark)

;;; window-numbering
(require-package 'window-numbering)
(window-numbering-mode t)

;;; magit
(require-package 'magit)

;;; bison-mode
(require-package 'bison-mode)

;;; yasnippet
(require-package 'yasnippet)
(require 'yasnippet)
(yas-global-mode 1)

;;; expand-region
(require-package 'expand-region)
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(provide 'init-plugin)
