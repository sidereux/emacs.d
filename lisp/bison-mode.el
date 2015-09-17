;;; bison-mode.el --- bison-mode

(require 'font-lock)
(require 'cc-mode)

;; Syntax Highlight
;;
;; Bison Symbols:
;; http://www.gnu.org/software/bison/manual/html_node/Table-of-Symbols.html

(defvar bison-symbol-directive
  '("%?" "%code" "%debug" "%define" "%defines" "%destructor" "%dprec" "%empty"
    "%error-verbose" "%file-prefix" "%glr-parser" "%initial-action" "%language"
    "%left" "%lex-param" "%merge" "%name-prefix" "%no-lines" "%nonassoc"
    "%output" "%param" "%parse-param" "%prec" "%precedence" "%pure-parser"
    "%require" "%right" "%skeleton" "%start" "%token" "%token-table" "%type"
    "%union")
  "Bison directive keywords")

(defvar bison-symbol-variable-1-regexp
  "\\([@$][0-9$]\\)")
(defvar bison-symbol-variable-2-regexp
  "\\([@$]\\w\\([0-9]\\|\\w\\)*\\)")
(defvar bison-symbol-variable-3-regexp
  "\\([@$]\\[[:alpha:]\\([0-9]\\|\\w\\|\\.\\|-\\)*\\]\\)")


(defvar bison-symbol-directive-regexp
  (regexp-opt bison-symbol-directive 'word))

(defvar bison-symbol-rule-regexp
  "\\([_[:alpha:]][-_[:alpha:][:alnum:]]*\\)\\(\\[.*?\\]\\|\\s-\\)*:")

(defvar bison-font-lock-keywords
  `((,bison-symbol-directive-regexp . font-lock-function-name-face)
    (,bison-symbol-variable-1-regexp . font-lock-variable-name-face)
    (,bison-symbol-variable-2-regexp . font-lock-variable-name-face)
    (,bison-symbol-variable-3-regexp . font-lock-variable-name-face)
    (,bison-symbol-rule-regexp (1 font-lock-variable-name-face))
    ))

;; Indentation
(defun bison-get-point-attribution (point)
  "Check and set attribution of given point."
  (let ((point-attr (syntax-ppss point)))
    (setq bison-point-depth-in-parens (nth 0 point-attr))
    (setq bison-point-paren-address (nth 1 point-attr))
    (setq bison-point-expression-address (nth 2 point-attr))
    (setq bison-point-inside-string (nth 3 point-attr))
    (setq bison-point-inside-comment (nth 4 point-attr))
    (setq bison-point-min-depth-in-parens (nth 6 point-attr))
    (setq bison-point-comment-address (nth 8 point-attr))))

(defun bison-inside-block (point)
  "Return t if position of point inside of '{' and '}'."
  (save-excursion
    (goto-char point)
    (bison-get-point-attribution point)
    (if (> bison-point-depth-in-parens 0)
        t
      nil)))

(defun bison-get-previous-non-empty-line-info ()
  "Get informations about previous non-empty line"
  (save-excursion
    ;; get previous line indention
    (catch 'line-num
      (if (re-search-backward "^[^\n]" nil t)
          (progn
            (beginning-of-line)
            (if (or (looking-at "^.*:$")
                    (looking-at "^\\s-*|"))
                (setq bison-previous-indentation 6)
              (setq bison-previous-indentation (current-indentation)))
            (throw 'line-num nil))))))

(defun bison-indent-line-function ()
  "Indent the current line according to the syntactic context."
  (save-excursion
    (beginning-of-line)
    (cond ((looking-at "^\\s-*|")
           (indent-line-to default-tab-width))
          ((looking-at "^\\s-*;")
           (message "indent to 0")
           (indent-line-to 0))
          ((looking-at ".*:$")
           (message "indent to 0")
           (indent-line-to 0))
          (t
           (message "indent to previous")
           (bison-get-previous-non-empty-line-info)
           (indent-line-to bison-previous-indentation))
          ))
  (if (< (point) (+ (line-beginning-position) (current-indentation)))
      (back-to-indentation)))

(defun bison-indent-line ()
  "Indent current line."
  (interactive)
  (cond
   ((bison-inside-block (point))
    (message "call c indent function")
    (c-indent-line))
   (t
    (bison-indent-line-function))))

(defmacro bison-mode-define-derived-mode (base-mode base-mode-name)
  "Define derived bison-mode from base-mode"
  (let ((derived-mode
         (intern (concat "bison-" (symbol-name base-mode))))
        (derived-mode-name
         (concat "Bison/" base-mode-name)))
    `(define-derived-mode ,derived-mode ,base-mode ,derived-mode-name
       "Major mode for editing bison grammar files"
       (font-lock-add-keywords nil bison-font-lock-keywords)
       (setq-local indent-line-function 'bison-indent-line)
       (setq-local indent-region-function nil)
       )))

(bison-mode-define-derived-mode c-mode "C")
(bison-mode-define-derived-mode c++-mode "C++")

(defalias 'bison-mode 'bison-c-mode)

(add-to-list 'auto-mode-alist '("\\.y\\'" . bison-c-mode))
(add-to-list 'auto-mode-alist '("\\.yy\\'" . bison-c++-mode))


(provide 'bison-mode)
