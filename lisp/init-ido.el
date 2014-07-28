(require-package 'flx-ido)
(require-package 'ido-ubiquitous)
(require-package 'idomenu)

(ido-mode t)
(ido-everywhere t)

(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)
(setq ido-use-virtual-buffers t)

(setq ido-auto-merge-delay-time 2)


(require 'flx-ido)

(flx-ido-mode t)
(ido-ubiquitous-mode t)


(provide 'init-ido)
