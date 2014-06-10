(require-package 'highlight-indentation)

(defun highlight-indentation-mode-hook ()
  (highlight-indentation-current-column-mode)
  (set-face-background 'highlight-indentation-face "#e3e3d3")
  (set-face-background 'highlight-indentation-current-column-face "#c3b3b3"))

(add-hook 'js2-mode-hook 'highlight-indentation-mode-hook)

(provide 'init-highlight-indentation)
