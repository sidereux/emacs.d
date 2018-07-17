;; echo 'registry=https://registry.npm.taobao.org' >> ~/.npmrc
;; npm install -g typescript
(require-package 'tide)

(defun my:tide-setup()
  (interactive)
  (tide-setup)
  (eldoc-mode +1))

(setq typescript-indent-level 2)
(setq tide-format-options '(:indentSize 2 :tabSize 2))

;; make '_' a word character
(add-hook 'typescript-mode-hook
          (lambda () (modify-syntax-entry ?_ "w" typescript-mode-syntax-table)))

(add-hook 'typescript-mode-hook '(lambda () (add-hook 'before-save-hook 'tide-format-before-save)))
(add-hook 'typescript-mode-hook 'my:tide-setup)

(provide 'init-typescript)
