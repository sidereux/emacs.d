;;; flex-mode.el --- flex-mode

(require 'font-lock)
(require 'cc-mode)

;; Symbols
;; http://www.gnu.org/software/flex/manual/html_node/Table-of-Symbols.html

(defvar flex-symbol-option-regexp "\\(%option\\)")

(defvar flex-font-lock-keywords
  `((,flex-symbol-option-regexp . font-lock-function-name-face)
    ))

(defmacro flex-mode-define-derived-mode (base-mode base-mode-name)
  "Define derived flex-mode from base-mode"
  (let ((derived-mode
         (intern (concat "flex-" (symbol-name base-mode))))
        (derived-mode-name
         (concat "Flex/" base-mode-name)))
    `(define-derived-mode ,derived-mode ,base-mode ,derived-mode-name
       "Major mode for editing flex grammar files"
       (font-lock-add-keywords nil flex-font-lock-keywords)
       )))

(flex-mode-define-derived-mode c-mode "C")
(flex-mode-define-derived-mode c++-mode "C++")

(defalias 'flex-mode 'flex-c-mode)

(add-to-list 'auto-mode-alist '("\\.l\\'" . flex-c-mode))
(add-to-list 'auto-mode-alist '("\\.ll\\'" . flex-c++-mode))


(provide 'flex-mode)
