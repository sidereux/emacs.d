;; Install htmlize for syntax highlighting of org-mode export.
(use-package htmlize
  :ensure t
  )

(use-package org
  :config
  (setq-default org-startup-truncated nil)
  (setq-default org-startup-folded nil)
  (add-hook 'org-mode-hook
            (lambda () (setq-local evil-auto-indent nil)))
  )

(provide 'init-org)
