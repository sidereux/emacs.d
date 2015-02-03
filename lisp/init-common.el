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

;; Line number
(global-linum-mode t)

;; Show Paren Mode
(show-paren-mode t)

;; hilight current line
(global-hl-line-mode t)

;; Make the search case-sensitive
(setq-default case-fold-search nil)

;; disable toolbar
(tool-bar-mode -1)

;; use shift+{left,up,down,right} to switch between windows
(windmove-default-keybindings)
(setq windmove-wrap-around t)


(provide 'init-common)
