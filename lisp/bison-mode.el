;;; bison-mode.el --- bison-mode

(require 'font-lock)
(require 'cc-mode)

;; Symbols
;; http://www.gnu.org/software/bison/manual/html_node/Table-of-Symbols.html

(defvar bison-symbol-directive-regexp "%\\(\\w\\|-\\)+")

(defvar bison-font-lock-keywords
  `((,bison-symbol-directive-regexp . font-lock-function-name-face)
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
