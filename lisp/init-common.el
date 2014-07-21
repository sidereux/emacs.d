;; Save the cursor posision
(require 'saveplace)
(setq-default save-place t)

;; Scroll Smoothly
(setq redisplay-dont-pause t)
(setq scroll-margin 5)
(setq scroll-conservatively 1000)
;;(setq scroll-up-aggressively 0.01
;;      scroll-down-aggressively 0.01)
;
;;(setq-default scroll-up-aggressively 0.01
;;	      scroll-down-aggressively 0.01)

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

;; bind newline-and-indent to RET
(define-key global-map (kbd "RET") 'newline-and-indent)

;; disable toolbar
(tool-bar-mode -1)

(provide 'init-common)
