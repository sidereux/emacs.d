;; DO NOT USE GNU STYLE OF INDENTING
(setq c-default-style "linux"
      c-basic-offset 4)

;; enable flycheck-mode for c-mode
(add-hook 'c-mode-common-hook 'flycheck-mode)

;; enable gtags-mode
(add-hook 'c-mode-common-hook 'gtags-mode)

;; make '_' as a word character
(add-hook 'c-mode-common-hook (lambda () (modify-syntax-entry ?_ "w")))

(require-package 'ac-c-headers)
(require 'ac-c-headers)
(add-hook 'c-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-c-headers)
            (add-to-list 'ac-sources 'ac-source-c-header-symbols t)))

(defun my:add-semantic-to-autocomplete ()
  (add-to-list 'ac-sources 'ac-source-semantic))

(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)

;; enable highlight indentation
(add-hook 'c-mode-common-hook 'highlight-indentation-mode)

(provide 'init-c)
