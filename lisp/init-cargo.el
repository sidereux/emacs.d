;;; package --- Summary
;;; Commentary:
;;; my cargo helper functions
;;; Code:
(defun my:cargo-test()
  "Run `cargo test` command."
  (interactive)
  (compile "cargo test --color=never")
  )

(provide 'init-cargo)
;;; init-cargo.el ends here

