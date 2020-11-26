
;; Package setup
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; Some fancy thing
(tool-bar-mode -1)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(global-display-line-numbers-mode)
(setq column-number-mode t)
(show-paren-mode 1)

(windmove-default-keybindings 'meta)

;; Set exec-path
(setq exec-path (append exec-path '("/home/pierre/.local/bin")))

;; Set backup dir
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory "backups"))))

;; Ignore case when autocomplet filename
(setq read-file-name-completion-ignore-case 1)

;; Buffer mode
(global-set-key (kbd "C-b") 'ibuffer)

;; Lsp mode
(add-hook 'python-mode-hook #'lsp)
(add-hook 'rust-mode-hook #'lsp)

(require 'company-capf)
(push 'company-capf company-backends)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes '(wombat))
 '(package-selected-packages
   '(python projectile use-package lsp-jedi yasnippet python-mode rust-mode company-lsp lsp-mode flymake-python-pyflakes flymake-rust)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
