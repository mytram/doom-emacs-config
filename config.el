;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

(defun construct-font (font-name font-size)
  (concat font-name ":pixelsize=" font-size))

(defun dot-set-font (font-name font-size)
  "Set my FONT-NAME with FONT-SIZE."
  (set-frame-font (construct-font font-name font-size)))

(defun small-font ()
  "Set small font."
  (interactive)
  (dot-set-font "Hack Nerd Font Mono" "13"))

(defun big-font ()
  "Set big font."
  (interactive)
  (dot-set-font "Hack Nerd Font Mono" "15"))

(defun large-font ()
  "Set large font."
  (interactive)
  (dot-set-font "Hack Nerd Font Mono" "18"))

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Marty"
      user-mail-address "mytram2@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dracula)
(setq doom-font (construct-font "Hack Nerd Font Mono" "15"))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(defun github-shells()
  "Open multiple shells"
  (interactive)
  (progn (eshell)
         (rename-buffer "*github-shell*")
         (cd "~/github"))
  (progn (eshell)
         (rename-buffer "*github-sandbox*")
         (cd "~/github"))
  (progn (eshell)
         (rename-buffer "*github-webapp*")
         (cd "~/github"))
  (progn (eshell)
         (rename-buffer "*github-rails*")
         (cd "~/github"))
  (progn (eshell)
         (rename-buffer "*github-ui*")
         (cd "~/github")))

;; for .ts, i use prettier
(setq-hook! 'typescript-mode-hook +format-with-lsp nil)

;; for .tsx, i use prettier
(setq-hook! 'typescript-tsx-mode-hook +format-with-lsp nil)

;; Magit

;(global-diff-hl-mode)

;(add-hook 'magit-pre-refresh-hook 'diff-hl-magit-pre-refresh)
;(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)

;;
(global-set-key (kbd "C-x \\") 'align-regexp)
(global-set-key (kbd "C-x rp") 'replace-regexp)

; (global-undo-tree-mode)

(remove-hook 'lsp-mode-hook 'lsp-ui-mode)

(exec-path-from-shell-initialize)
