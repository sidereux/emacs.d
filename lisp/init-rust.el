;;; package --- Summary:

;;; Commentary:
;; rustup component add rustfmt-preview
;; cargo install racer
;; rustup component add rust-src

;;; Code:

(use-package rust-mode
  :ensure t
  :mode "\\.rs\\'"
  :config
  (add-hook 'rust-mode-hook #'lsp-deferred)
  ;(add-hook 'rust-mode-hook (lambda () (add-hook 'before-save-hook 'rust-format-buffer nil t)))
  (add-hook 'rust-mode-hook (lambda () (modify-syntax-entry ?_ "w" rust-mode-syntax-table)))
  )
(use-package flycheck-rust
  :ensure t
  :config
  (with-eval-after-load 'rust-mode
    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
  )

(provide 'init-rust)
;;; init-rust.el ends here
