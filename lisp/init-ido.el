(require-package 'flx-ido)
(require-package 'ido-ubiquitous)
(require-package 'idomenu)

(require 'flx-ido)

(ido-mode t)
(flx-ido-mode t)
(ido-ubiquitous-mode t)

(ido-everywhere t)

(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)
(setq ido-use-virtual-buffers t)


(provide 'init-ido)
