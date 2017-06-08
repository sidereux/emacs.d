(require 'font-lock)

(defvar plantuml-mode-hook nil)

(defvar plantuml-keywords
  '("split" "split again" "end split"
    "if" "else" "elseif" "endif"
    "repeat" "repeat while"
    ))

(defvar plantuml-keywords-regexp
  (regexp-opt plantuml-keywords 'word))

(defvar plantuml-keywords-regexp-extra
  "^\\(@startuml\\|@enduml\\|start\\|stop\\)")

(defvar plantuml-mark-regexp
  "^\\s-*:\\|;$")

(defconst plantuml-font-lock-keywords
  (list
   `(,plantuml-keywords-regexp . font-lock-keyword-face)
   `(,plantuml-keywords-regexp-extra . font-lock-builtin-face)
   `(,plantuml-mark-regexp . font-lock-builtin-face)
   ))

(defun plantuml-previous-non-empty-indent-level()
  "Get previous not empty indent level."
  (save-excursion
    (let ((need-move-to-previous t)
          (indent-level 0))
      (while (not (eq need-move-to-previous nil))
        (message (format "current line: %s" (thing-at-point 'line t)))
        (forward-line -1)
        (beginning-of-line-text)
        (if (not (looking-at "\\s-*$"))
            (progn
              (setq need-move-to-previous nil)
              (message "abort while")
              (setq indent-level (current-indentation)))
          (setq indent-level 0)
          ))
      indent-level)))

(defun plantuml-indent-to-previous-line ()
  "Indent current line to previous non-empty line."
  (indent-line-to (plantuml-previous-non-empty-indent-level))
  )

(defun plantuml-indent-line-function()
  "PlantUML mode indent line function."
  (interactive)
  (plantuml-indent-to-previous-line)
  )

(define-derived-mode plantuml-mode prog-mode "PlantUML"
  "Major mode for editing plantuml files."
  (font-lock-add-keywords nil plantuml-font-lock-keywords)
  (setq-local indent-line-function 'plantuml-indent-line-function)
  )

(provide 'plantuml-mode)
