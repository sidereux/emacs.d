(require-package 'evil)
(require-package 'evil-leader)
(require-package 'evil-surround)

(evil-mode 1)

(global-evil-leader-mode 1)
(global-evil-surround-mode 1)

;; evil-surround use 's' instead of 'S' for surroundings in visual mode.
;; which is defferent from vim-surround and may cause confusion.
;;
;; origin key bindings:
;; (define-key evil-normal-state-map "s" 'evil-substitute)
;; (define-key evil-normal-state-map "S" 'evil-change-whole-line)
;;
;; fix:
(evil-define-key 'visual evil-surround-mode-map "s" nil)
(evil-define-key 'visual evil-surround-mode-map "S" 'evil-surround-region)


(evil-leader/set-key "]" 'gtags-find-tag-from-here)
(evil-leader/set-key "[" 'gtags-pop-stack)


(provide 'init-evil)
