(add-to-list 'load-path (expand-file-name "elisp" user-emacs-directory))

(require 'init-customize)
(require 'init-indent)
(require 'init-elpa)

; load init-elpa before init-auto-complete
(require 'init-auto-complete)
(require 'init-cedet)
