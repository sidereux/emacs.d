(require 'font-lock)

(defvar plantuml-mode-hook nil)

(defun plantuml-wrap-single-line-regexps(regexps &optional suffix)
  "Wrap REGEXP as single line regexp prefix ^\\s-* and suffix $"
  (concat "^[ \t]*\\("
          (mapconcat (lambda (regexp) (concat "\\(" regexp "\\)"))
                     regexps "\\|")
          "\\)"))

(defvar plantuml-single-line-keywords
  '("split again" "split" "end split"
    "if (.*?) then (.*?)" "if (.*?)" "else (.*?)" "elseif (.*?) then (.*?)" "elseif (.*?)" "endif"
    "repeat while (.*?)" "repeat"
    ))

(defvar plantuml-keywords-regexp
  (plantuml-wrap-single-line-regexps plantuml-single-line-keywords t))

(defvar plantuml-keywords-regexp-extra
  "^\\(@startuml\\|@enduml\\|start\\|stop\\)")

(defvar plantuml-mark-regexp
  "^[ \t]*:\\|;")

(defconst plantuml-font-lock-keywords
  (list
   `(,plantuml-keywords-regexp . font-lock-keyword-face)
   `(,plantuml-keywords-regexp-extra . font-lock-builtin-face)
   `(,plantuml-mark-regexp . font-lock-builtin-face)
   ))

(defun plantuml-previous-non-empty-line-position()
  "Get previous not empty line."
  (save-excursion
    (let ((need-move-to-previous t)
          (pos 0))
      (while (not (eq need-move-to-previous nil))
        (message (format "current line: %s" (thing-at-point 'line t)))
        (forward-line -1)
        (beginning-of-line-text)
        (if (not (looking-at "\\s-*$"))
            (progn
              (setq need-move-to-previous nil)
              (message "abort while")
              (setq pos (point)))
          (setq pos (point))
          ))
      pos)))

(defun plantuml-indent-to-previous-line ()
  "Indent current line to previous non-empty line."
  (let* ((pos (plantuml-previous-non-empty-line-position))
         (previous-indentation (save-excursion
                                 (goto-char pos)
                                 (current-indentation))))
    (cond ((save-excursion
             (beginning-of-line)
             (looking-at plantuml-keywords-regexp))
           (progn
             (indent-line-to (current-indentation))))
          ((and
            (save-excursion
              (beginning-of-line)
              (goto-char pos)
              (beginning-of-line)
              (looking-at plantuml-keywords-regexp))
            (not (eq (current-indentation) 0)))
           (progn
             (indent-line-to (current-indentation))))
          (t (progn
               (indent-line-to previous-indentation))))
    ))

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
