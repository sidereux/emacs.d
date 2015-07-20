(require-package 'evil)
(require-package 'evil-leader)
(require-package 'evil-matchit)
(require-package 'evil-surround)
(require-package 'evil-search-highlight-persist)

(require 'evil)
(require 'evil-leader)
(require 'evil-matchit)
(require 'evil-surround)
(require 'highlight)
;; highlight search keyword like vim
(require 'evil-search-highlight-persist)


(evil-mode 1)
(global-evil-leader-mode)
(global-evil-matchit-mode t)
(global-evil-surround-mode t)
(global-evil-search-highlight-persist t)


;; remap :q[uit] to evil-kill-current-buffer
(evil-define-command evil-kill-current-buffer ()
  "Kill current buffer"
  (kill-this-buffer))
(evil-ex-define-cmd "q[uit]" 'evil-kill-current-buffer)

;; remap :wq to evil-save-and-kill-current-buffer
(evil-define-command evil-save-and-kill-current-buffer ()
  "Save and kill current buffer"
  (save-some-buffers t)
  (kill-this-buffer))
(evil-ex-define-cmd "wq" 'evil-save-and-kill-current-buffer)

;; rewrite evil-save-and-quit
;; remap :wqa[ll] to evil-save-and-quit
(evil-define-command evil-save-and-quit ()
  "Save all buffers and exit emacs"
  ;; Origional evil-save-and-quit was defined in evil-commmands.el
  (save-buffers-kill-emacs))
(evil-ex-define-cmd "wqa[ll]" 'evil-save-and-quit)

;; remap :x[it] :exi[t] to evil-save-and-kill-current-buffer
(evil-ex-define-cmd "x[it]" 'evil-save-and-kill-current-buffer)
(evil-ex-define-cmd "exi[t]" "xit")

;; remap :xa[ll] to evil-save-and-quit
(evil-ex-define-cmd "xa[ll]" 'evil-save-and-quit)

;; remap "ZZ" to evil-save-and-quit
(define-key evil-normal-state-map "ZZ" 'evil-save-and-quit)
(define-key evil-normal-state-map "ZQ" 'evil-quit-all)


;; evil-surround use 's' instead of 'S' for surroundings in visual mode.
;; which is defferent from vim-surround and may cause confusion.
;;
;; origin key bindings:
;; (define-key evil-normal-state-map "s" 'evil-substitute)
;; (define-key evil-normal-state-map "S" 'evil-change-whole-line)
;;
;; fix:
;; (evil-define-key 'visual evil-surround-mode-map "s" nil)
;; (evil-define-key 'visual evil-surround-mode-map "S" 'evil-surround-region)


(evil-leader/set-key "]" 'helm-gtags-find-tag-from-here)
(evil-leader/set-key "[" 'helm-gtags-pop-stack)
(evil-leader/set-key "gt" 'helm-gtags-find-tag)
(evil-leader/set-key "gr" 'helm-gtags-find-rtag)
(evil-leader/set-key "gp" 'helm-gtags-pop-stack)


(provide 'init-evil)
