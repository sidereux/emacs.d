;; DO NOT USE GNU STYLE OF INDENTING
(setq c-default-style "linux"
      c-basic-offset 4)

;; enable flycheck-mode for c-mode
(add-hook 'c-mode-common-hook 'flycheck-mode)

;; enable gtags-mode
(add-hook 'c-mode-common-hook 'gtags-mode)

;; make '_' as a word character
(add-hook 'c-mode-common-hook (lambda () (modify-syntax-entry ?_ "w")))

(require-package 'auto-complete-c-headers)

(require 'auto-complete-c-headers)


(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers))

(add-hook 'c-mode-hook 'my:ac-c-header-init)
(add-hook 'c++-mode-hook 'my:ac-c-header-init)



(defun my:add-semantic-to-autocomplete ()
  (add-to-list 'ac-sources 'ac-source-semantic))

(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)

;; enable highlight indentation
(add-hook 'c-mode-common-hook 'highlight-indentation-mode)

(provide 'init-c)
