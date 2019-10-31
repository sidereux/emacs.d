;;; init-plugin.el --- common plugins
;;; Commentary:
;;; Code:

;;; use-package
(require-package 'use-package)
(require 'use-package)

;;; Theme
;(require-package 'color-theme-sanityinc-tomorrow)
;(require 'color-theme-sanityinc-tomorrow)
;(load-theme 'sanityinc-tomorrow-night t)
(use-package color-theme-sanityinc-tomorrow
  :ensure t
  :config
  (load-theme 'sanityinc-tomorrow-night t)
  )


;;; Anzu
(use-package anzu
  :ensure t
  :config
  (global-anzu-mode t)
  )


;;; company-mode - Modular in-buffer completion framework
(require-package 'company)
(require-package 'company-c-headers)
(require-package 'company-anaconda)

(require 'anaconda-mode)
(require 'company-anaconda)


;; run 'gcc -xc++ -E -v -'
(setq company-c-headers-path-system
      '(
        "/usr/include/c++/5"
        "/usr/include/x86_64-linux-gnu/c++/5"
        "/usr/include/c++/5/backward"
        "/usr/lib/gcc/x86_64-linux-gnu/5/include"
        "/usr/local/include"
        "/usr/lib/gcc/x86_64-linux-gnu/5/include-fixed"
        "/usr/include/x86_64-linux-gnu"
        "/usr/include"
        ))

;; (setq company-clang-arguments
;;       '("-I/usr/include/"
;;         "-I/usr/local/include/"
;;         "-I/usr/include/x86_64-linux-gnu/"))

(global-set-key (kbd "C-c f") 'company-files)

(setq company-dabbrev-downcase nil)

(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'global-company-mode-hook
          (lambda ()
            ;; remove annoying blinking
            (setq company-echo-delay 0)
            (progn
              (add-to-list 'company-backends 'company-c-headers)
              )))

(eval-after-load "company"
  '(add-to-list 'company-backends 'company-anaconda))


;;; Highlight Indentation
(require-package 'highlight-indent-guides)
;;(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
;;(add-hook 'yaml-mode-hook 'highlight-indent-guides-mode)
;;(add-hook 'xml-mode-hook 'highlight-indent-guides-mode)
;;(add-hook 'nxml-mode-hook 'highlight-indent-guides-mode)

;;; Highlight Indentation
(require-package 'highlight-indentation)
(add-hook 'prog-mode-hook 'highlight-indentation-mode)
(add-hook 'yaml-mode-hook 'highlight-indentation-mode)
(add-hook 'xml-mode-hook 'highlight-indentation-mode)
(add-hook 'nxml-mode-hook 'highlight-indentation-mode)


;;; Uniquify - Making buffer names unique
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)


;;; Flycheck - Modern on the fly syntax checking
;; Quick start : http://www.flycheck.org/manual/latest/Quickstart.html
(require-package 'flycheck)
;; Install ShellCheck https://github.com/koalaman/shellcheck/releases

(global-flycheck-mode)


;;; Markdown mode
(use-package markdown-mode
  :ensure t
  :mode "\\.md\\'"
  :config
  (add-hook 'markdown-mode-hook
            (lambda () (modify-syntax-entry ?_ "w" markdown-mode-syntax-table)))
  )

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

;;; avy-mode
(require-package 'avy)

;;; window-numbering
(require-package 'window-numbering)
(window-numbering-mode t)

;;; lemon-mode
(require-package 'lemon-mode)

;;; yasnippet
(require-package 'yasnippet)
(require 'yasnippet)
(setq yas-snippet-dirs
      (list (expand-file-name "snippets/snippets" user-emacs-directory)))
(yas-global-mode 1)


;;; expand-region
(require-package 'expand-region)
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)


;;; clang-format
(require-package 'clang-format)
(require 'clang-format)
(setq-default clang-format-style "{IndentWidth: 4}")


;;; yaml-mode
(require-package 'yaml-mode)
;; make '_' as a word character
(add-hook 'yaml-mode-hook
          (lambda () (modify-syntax-entry ?_ "w" yaml-mode-syntax-table)))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))


;;; fic-mode
(require-package 'fic-mode)


;;; dockerfile-mode
(require-package 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

;;; counsel swiper and ivy
(require-package 'swiper)
(require-package 'counsel)
;; (ivy-mode t)


;;; exec-path-from-shell
(require-package 'exec-path-from-shell)
(exec-path-from-shell-initialize)
(exec-path-from-shell-copy-env "GOPATH")


;;; nginx-mode
(require-package 'nginx-mode)


;;; plantuml-mode
;; (require-package 'plantuml-mode)
(require 'plantuml-mode)
(add-to-list 'auto-mode-alist '("\\.plantuml\\'" . plantuml-mode))
(provide 'init-plugin)


;;; web-mode
(require-package 'web-mode)
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-hook 'web-mode-hook (lambda () (setq web-mode-markup-indent-offset 2)))


;;; lua-mode
(add-hook 'lua-mode-hook
          (lambda () (modify-syntax-entry ?_ "w" lua-mode-syntax-table)))
