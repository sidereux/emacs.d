;;; bison-mode.el --- bison-mode

(require 'font-lock)
(require 'cc-mode)

;; Symbols
;; http://www.gnu.org/software/bison/manual/html_node/Table-of-Symbols.html

(defvar bison-symbol-directive-regexp "%\\(\\w\\|-\\)+")
(defvar bison-symbol-rule-regexp "\\(\\w+\\)\\s-*:")

(defvar bison-font-lock-keywords
  `((,bison-symbol-directive-regexp . font-lock-function-name-face)
    (,bison-symbol-rule-regexp . (1 font-lock-variable-name-face))
    ))

;; TODO support C++
(define-derived-mode bison-mode c-mode "bison"
  "Major mode for editing bison rule files"
  ;; (font-lock-add-keywords nil bison-font-lock-keywords)
  (font-lock-add-keywords nil bison-font-lock-keywords)
  )


(add-to-list 'auto-mode-alist '("\\.y\\'" . bison-mode))
(add-to-list 'auto-mode-alist '("\\.yy\\'" . bison-mode))

(provide 'bison-mode)
