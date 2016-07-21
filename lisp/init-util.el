;; Show warn message after press C-x C-c
(defun my:exit-emacs ()
  "Show warn message before exit emacs"
  (interactive)
  ;; (message "Exit emacs? (y)")
  (if (string= "y" (read-key-sequence "Exit emacs? (y)"))
      (save-buffers-kill-emacs)
    (message "Press y to exit emacs.")))

;; (global-unset-key (kbd "C-x C-c"))
(global-set-key (kbd "C-x C-c") 'my:exit-emacs)

;; highlight search keyword
(defvar my:highlight-keyword-len 2
  "Minimum length of keyword to be highlighted.")
(defvar-local my:highlight-keyword-str nil
  "Keyword to be highlighted.")
(defvar-local my:highlight-keyword-prev-str nil
  "Previous highlighted keyword.")

(defun my:highlight-keyword (&rest args)
  "Highlight search keyword."
  (interactive)
  (setq my:highlight-keyword-prev-str my:highlight-keyword-str)
  (if isearch-regexp
      (setq my:highlight-keyword-str (car-safe regexp-search-ring))
    (setq my:highlight-keyword-str (car-safe search-ring)))
  (when (and (>= (length my:highlight-keyword-str) my:highlight-keyword-len)
             (not (string-equal my:highlight-keyword-str
                                my:highlight-keyword-prev-str)))
    (message "highlight")
    (unhighlight-regexp my:highlight-keyword-prev-str)
    (highlight-regexp my:highlight-keyword-str 'evil-ex-search)))

(advice-add 'isearch-exit :after 'my:highlight-keyword)
(advice-add 'evil-search :after 'my:highlight-keyword)
(advice-add 'evil-search-next :after 'my:highlight-keyword)
(advice-add 'evil-search-previous :after 'my:highlight-keyword)
(advice-add 'evil-search-incrementally :after 'my:highlight-keyword)


(provide 'init-util)
