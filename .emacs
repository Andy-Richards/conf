;; See https://blog.aaronbieber.com/2015/05/24/from-vim-to-emacs-in-fourteen-days.html
(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

;; use-package see https://github.com/jwiegley/use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; Vim bindings https://www.emacswiki.org/emacs/Evil
(use-package evil 
  :ensure t)

;(use-package solarized-theme)
;(load-theme 'solarized t)

;; Default to evil TODO casues warnigs on start
;(require 'evil)
;(evil-mode 1)

;; EQC Emacs Mode -- Configuration Start
(add-to-list 'load-path "/usr/local/erlang/R16B03-1/lib/eqc-1.36.1/emacs/")
(autoload 'eqc-erlang-mode-hook "eqc-ext" "EQC Mode" t)
(add-hook 'erlang-mode-hook 'eqc-erlang-mode-hook)
(setq eqc-max-menu-length 30)
(setq eqc-root-dir "/usr/local/erlang/R16B03-1/lib/eqc-1.36.1")
;; EQC Emacs Mode -- Configuration End

;; Erlang Emacs Mode -- Configuration Start
(setq erlang-root-dir "/usr/local/erlang/R16B03-1")
(setq load-path (cons "/usr/local/erlang/R16B03-1/lib/tools-2.6.13/emacs" load-path))
(setq exec-path (cons "/usr/local/erlang/R16B03-1/bin" exec-path))
(require 'erlang-start)
;; Erlang Emacs Mode -- Configuration End

;; AUTO generated dont edit this! 
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes (quote ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
