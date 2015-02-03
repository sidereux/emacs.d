;;; init-plugin.el --- common plugins

;;; theme config
(require-package 'color-theme-sanityinc-tomorrow)
(require 'color-theme-sanityinc-tomorrow)
(load-theme 'sanityinc-tomorrow-night t)


;;; install and enable anzu plugin
(require-package 'anzu)
(global-anzu-mode +1)


;;; install highlight-indentation plugin
(require-package 'highlight-indentation)


;;; config uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)


;;; install flycheck
(require-package 'flycheck)


;;; config gtags
(autoload 'gtags-mode "gtags" "" t)
(setq gtags-auto-update t)


;;; install auto-complete
(require-package 'auto-complete)
(require 'auto-complete-config)

(global-auto-complete-mode t)
(ac-config-default)


;;; install autopair
(require-package 'autopair)
(require 'autopair)

(autopair-global-mode)
(setq autopair-autowrap 1)

;; stop blink, improve performance
(setq autopair-blink nil)


;;; install helm
(require-package 'helm)
(require-package 'helm-ls-git)

(require 'helm-config)
(require 'helm-ls-git)
(global-set-key (kbd "C-c h") 'helm-mini)


;;; install smex
(require-package 'smex)
(require 'smex)
(smex-initialize)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; old M-x
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


;;; install markdown
(require-package 'markdown-mode)

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))


(provide 'init-plugin)
