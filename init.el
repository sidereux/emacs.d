(add-to-list 'load-path (expand-file-name "elisp" user-emacs-directory))

(require 'init-elpa)
(require 'init-customize)
(require 'init-indent)

; load init-elpa before init-auto-complete
(require 'init-highlight-indentation)
(require 'init-auto-complete)
(require 'init-cedet)
(require 'init-javascript)

