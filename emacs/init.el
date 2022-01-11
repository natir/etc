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

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Set exec-path
(setq exec-path (append exec-path '("/home/pierre/.local/bin" "/home/pierre/.cargo/bin")))

;; Set backup dir
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory "backups"))))

;; Ignore case when autocomplet filename
(setq read-file-name-completion-ignore-case 1)

;; Buffer mode
(global-set-key (kbd "C-b") 'ibuffer)

;; Global text scale mode
(require 'default-text-scale)
(add-hook 'after-init-hook 'default-text-scale-mode)

;; Snakemake mode
(add-to-list 'auto-mode-alist '("\\.snk\\'" . snakemake-mode))
(add-to-list 'auto-mode-alist '("_rule\\'" . snakemake-mode))
(add-to-list 'auto-mode-alist '("Snakefile_" . snakemake-mode))

;; Lsp mode
(add-hook 'python-mode-hook #'lsp)
(add-hook 'rust-mode-hook #'lsp)
(add-hook 'c++-mode-hook #'lsp)


;; Rust section
(use-package rustic
  :ensure
  :bind (:map rustic-mode-map
              ("M-j" . lsp-ui-imenu)
              ("M-?" . lsp-find-references)
              ("C-c C-c l" . flycheck-list-errors)
              ("C-c C-c a" . lsp-execute-code-action)
              ("C-c C-c r" . lsp-rename)
              ("C-c C-c q" . lsp-workspace-restart)
              ("C-c C-c Q" . lsp-workspace-shutdown)
              ("C-c C-c s" . lsp-rust-analyzer-status))
  :config
  ;; uncomment for less flashiness
  ;; (setq lsp-eldoc-hook nil)
  ;; (setq lsp-enable-symbol-highlighting nil)
  ;; (setq lsp-signature-auto-activate nil)

  ;; comment to disable rustfmt on save
  (setq rustic-format-on-save t)
  (add-hook 'rustic-mode-hook 'rk/rustic-mode-hook))

(defun rk/rustic-mode-hook ()
  ;; so that run C-c C-c C-r works without having to confirm
  (setq-local buffer-save-without-query t))

(use-package lsp-mode
  :ensure
  :commands lsp
  :custom
  ;; what to use when checking on-save. "check" is default, I prefer clippy
  (lsp-rust-analyzer-cargo-watch-command "clippy")
  (lsp-eldoc-render-all t)
  (lsp-idle-delay 0.3)
  (lsp-rust-analyzer-server-display-inlay-hints t)
  :config
  (add-hook 'lsp-mode-hook 'lsp-ui-mode)
  (add-to-list 'lsp-language-id-configuration '(snakemake-mode . "python")))

(use-package lsp-ui
  :ensure
  :commands lsp-ui-mode
  :custom
  (lsp-ui-peek-always-show t)
  (lsp-ui-sideline-show-hover t)
  (lsp-ui-doc-enable nil))

(use-package company
  :ensure
  :custom
  (company-idle-delay 0.2) ;; how long to wait until popup
  ;; (company-begin-commands nil) ;; uncomment to disable popup
  :bind
  (:map company-active-map
	("C-n". company-select-next)
	("C-p". company-select-previous)
	("M-<". company-select-first)
	("M->". company-select-last))

  (:map company-mode-map
	("<tab>". tab-indent-or-complete)
	("TAB". tab-indent-or-complete)))

(defun company-yasnippet-or-completion ()
  (interactive)
  (or (do-yas-expand)
      (company-complete-common)))

(defun check-expansion ()
  (save-excursion
    (if (looking-at "\\_>") t
      (backward-char 1)
      (if (looking-at "\\.") t
        (backward-char 1)
        (if (looking-at "::") t nil)))))

(defun do-yas-expand ()
  (let ((yas/fallback-behavior 'return-nil))
    (yas/expand)))

(defun tab-indent-or-complete ()
  (interactive)
  (if (minibufferp)
      (minibuffer-complete)
    (if (or (not yas/minor-mode)
            (null (do-yas-expand)))
        (if (check-expansion)
            (company-complete-common)
          (indent-for-tab-command)))))

(use-package yasnippet
  :ensure
  :config
  (yas-reload-all)
  (add-hook 'prog-mode-hook 'yas-minor-mode)
  (add-hook 'text-mode-hook 'yas-minor-mode))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes '(wombat))
 '(package-selected-packages
   '(default-text-scale lsp-ui rustic graphviz-dot-mode flycheck json-mode ess yaml-mode snakemake-mode python projectile use-package lsp-jedi yasnippet python-mode rust-mode company-lsp lsp-mode flymake-python-pyflakes flymake-rust)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
