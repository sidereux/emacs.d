;;; package --- Summary:

;;; Commentary:
;; rustup component add rustfmt-preview
;; cargo install racer
;; rustup component add rust-src

;;; Code:

(require-package 'rust-mode)
(autoload 'rust-mode "rust-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

(require-package 'racer)
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)
(require 'rust-mode)
(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)

(require-package 'flycheck-rust)
(with-eval-after-load 'rust-mode
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

;; format buffer before save
(add-hook 'rust-mode-hook '(lambda () (add-hook 'before-save-hook 'rust-format-buffer nil t)))

;; make '_' a word character
(add-hook 'rust-mode-hook
          (lambda () (modify-syntax-entry ?_ "w" rust-mode-syntax-table)))

(provide 'init-rust)
;;; init-rust.el ends here
