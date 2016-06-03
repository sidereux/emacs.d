;;; init-common.el --- common settings

;; Save the cursor posision
(require 'saveplace)
(setq-default save-place t)

;; Use space instead of tab
(setq-default indent-tabs-mode nil)

;; Set indents to 4 spaces
(setq-default tab-width 4)

;; Scroll Smoothly
(setq redisplay-dont-pause t)
(setq scroll-margin 9)
(setq scroll-conservatively 1000)

;; Change the size of a font for the current frame
(set-face-attribute 'default (selected-frame) :height 150)

;; Display column number
(column-number-mode t)

;; Show Paren Mode
(show-paren-mode t)

;; Hilight current line
(global-hl-line-mode t)

;; Make the search case-sensitive
(setq-default case-fold-search nil)

;; Auto Revert Mode
(global-auto-revert-mode t)

;; Auto save
(setq auto-save-interval 5
      auto-save-timeout 3)

;; Make "M-x shell-command" read rc file
(setq shell-command-switch "-ic")

;; Use shift+{left,up,down,right} to switch between windows
(windmove-default-keybindings)
(setq windmove-wrap-around t)

;; Make '_' a word character
(modify-syntax-entry ?_ "w")
(add-hook 'sh-mode-hook
          (lambda () (modify-syntax-entry ?_ "w" sh-mode-syntax-table)))

;; Autopairing
(electric-pair-mode t)

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


;; bind isearch-forward-regexp to "C-s"
;; bind isearch-backward-regexp to "C-S-s"
(define-key global-map (kbd "C-s") 'isearch-forward-regexp)
(define-key global-map (kbd "C-S-s") 'isearch-backward-regexp)
(define-key isearch-mode-map (kbd "C-S-s") 'isearch-repeat-backward)

;; org-mode
;; open url with "xdg-open"
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "xdg-open")

;; highlight search keyword
(require-package 'highlight)
(defvar my:highlight-keyword-len 3
  "Minimum length of keyword to be highlighted.")
(defvar my:highlight-keyword-str nil
  "Keyword to be highlighted.")
(defvar my:highlight-keyword-prev-str nil
  "Previous highlighted keyword.")

(defun my:highlight-keyword (&rest args)
  "Highlight search keyword."
  (interactive)
  (if isearch-regexp
      (setq my:highlight-keyword-str (car-safe regexp-search-ring))
    (setq my:highlight-keyword-str (car-safe search-ring)))
  (when (and (>= (length my:highlight-keyword-str) my:highlight-keyword-len)
             (not (string-equal my:highlight-keyword-str
                                my:highlight-keyword-prev-str)))
    (let ((hlt-use-overlays-flag t)
          (hlt-last-face 'isearch))
      (hlt-unhighlight-region-in-buffers (list (current-buffer)))
      (setq my:highlight-keyword-prev-str my:highlight-keyword-str)
      (hlt-highlight-regexp-region-in-buffers
       my:highlight-keyword-str
       (list (current-buffer))))))

(advice-add 'isearch-exit :after 'my:highlight-keyword)
(advice-add 'evil-flash-search-pattern :after 'my:highlight-keyword)

;; bison mode
(require 'bison-mode)

;; flex mode
(require 'flex-mode)

;; which function mode
(which-function-mode t)
;; (eval-after-load "which-function"
;;   '(setq which-func-modes '(c-mode c++-mode python-mode)))
(setq which-func-modes '(c-mode c++-mode python-mode))


(if (display-graphic-p)
    (progn
      ;; Disable toolbar
      (tool-bar-mode 0)
      ;; scroll-bar
      (set-scroll-bar-mode 'left)
      (set-face-foreground 'scroll-bar "#f2f1f0")
      (set-face-background 'scroll-bar "#4c4c4c")
      ))

;; make speedbar support golang
(add-hook 'speedbar-load-hook
          (lambda ()
            (speedbar-add-supported-extension "go")))

(provide 'init-common)
