;; Set my font
(setq doom-font (font-spec :family "JetBrains Mono" :size 16))

;; Set my theme
(setq doom-theme 'doom-nord)

;; Dont want to conferm to kill emacs
(setq confirm-kill-emacs nil)        ;; Don't confirm on exit

;; Linenumbers
(setq display-line-numbers-type t)

(custom-set-faces
 '(markdown-header-face ((t (:inherit font-lock-function-name-face :weight bold :family "variable-pitch"))))
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :height 1.6))))
 '(markdown-header-face-2 ((t (:inherit markdown-header-face :height 1.5))))
 '(markdown-header-face-3 ((t (:inherit markdown-header-face :height 1.4))))
 '(markdown-header-face-4 ((t (:inherit markdown-header-face :height 1.3))))
 '(markdown-header-face-5 ((t (:inherit markdown-header-face :height 1.2))))
 '(markdown-header-face-6 ((t (:inherit markdown-header-face :height 1.1)))))

(defun gh/toggle-markdown-view-mode ()
  "Toggle between `markdown-mode' and `markdown-view-mode'."
  (interactive)
  (if (eq major-mode 'markdown-view-mode)
      (markdown-mode)
    (markdown-view-mode)))

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

;; To view pdfs from emacs
(use-package pdf-view
  :hook (pdf-tools-enabled . pdf-view-midnight-minor-mode)
  :hook (pdf-tools-enabled . hide-mode-line-mode)
  :config
  (setq pdf-view-midnight-colors '("#ABB2BF" . "#282C35")))

;; Making deleted files go to trash can
(setq delete-by-moving-to-trash t
	trash-directory "~/.local/share/Trash/files/")

;; ESHELL
(map! :leader
      :desc "Eshell" "e" #'eshell)

;; List Bookmarks
(map! :leader
      :desc "List Bookmarks" "bo" #'list-bookmarks)

;; Toggle markdown-view
(map! :leader
      (:prefix ("t" . "toggle")
       :desc "Toggle line numbers"            "l" #'doom/toggle-line-numbers
       :desc "Toggle markdown-view-mode"      "m" #'gh/toggle-markdown-view-mode))
;; Picture preview
(map! :leader
	(:prefix ("d" . "dired")
	:desc "Open dired" "d" #'dired
	:desc "Dired jump to current" "j" #'dired-jump)
	(:after dired
	(:map dired-mode-map
	:desc "Peep-dired image previews" "d p" #'peep-dired
	:desc "Dired view file" "d v" #'dired-view-file)))

(after! ement
  ;; leader prefix description (which-key)
  (map! :leader
        :prefix "z"
        :desc "Ement: start" "s" #'ement-connect
        :desc "Ement: List-rooms"  "l" #'ement-list-rooms
        :desc "Ement: Create-room" "c" #'ement-create-room
        :desc "Ement: Join-room" "j" #'ement-join-room
        :desc "Ement: Leave"  "C" #'ement-leave-room
        :desc "Ement: members" "m" #'ement-list-members))
