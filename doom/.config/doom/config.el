;; Set my font
(setq doom-font (font-spec :family "JetBrains Mono" :size 16))

;; Set my theme
(setq doom-theme 'doom-nord)

;; Dont want to conferm to kill emacs
(setq confirm-kill-emacs nil)        ;; Don't confirm on exit

;; Linenumbers
(setq display-line-numbers-type t)

(setq org-directory "~/Dokument/org/")
(custom-theme-set-faces!
'doom-nord
'(org-level-8 :inherit outline-3 :height 1.0)
'(org-level-7 :inherit outline-3 :height 1.0)
'(org-level-6 :inherit outline-3 :height 1.1)
'(org-level-5 :inherit outline-3 :height 1.2)
'(org-level-4 :inherit outline-3 :height 1.3)
'(org-level-3 :inherit outline-3 :height 1.4)
'(org-level-2 :inherit outline-2 :height 1.5)
'(org-level-1 :inherit outline-1 :height 1.6)
'(org-document-title  :height 1.8 :bold t :underline nil))

;; Set another startscreen image
(setq fancy-splash-image (concat doom-private-dir "splash.png"))

;; Keybinding to comment a line in emacs-lisp
(map! :leader
      :desc "Comment line" "-" #'comment-line)

;; ESHELL
(map! :leader
      :desc "Eshell" "e" #'eshell)

;; List Bookmarks
(map! :leader
      :desc "List Bookmarks" "bo" #'list-bookmarks)
