; $DOOMDIR/config.el -*- lexical-binding: t; -*-
;
; - `load!' for loading external *.el files relative to this one
; - `use-package!' for configuring packages
; - `after!' for running code after a package has loaded
; - `add-load-path!' for adding directories to the `load-path', relative to
;   this file. Emacs searches the `load-path' when you load packages with
;   `require' or `use-package'.
; - `map!' for binding new keys
;
; To get information about any of these functions/macros, move the cursor over
; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
; This will open documentation for it, including demos of how they are used.
;
; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
; they are implemented.

;; Identifying Information

(setq
 user-full-name "Mark Ebeid"
 user-mail-address "mebeid1@umbc.edu")

;; Doom Inital Setup

(setq homebase "~/Sync/")

(setq
 fancy-splash-image (file-truename (concat homebase "emacs-banner.png"))
 doom-theme 'doom-gruvbox
 display-line-numbers-type t
 display-line-numbers-type 'relative
 doom-unicode-font (font-spec :family "Julia Mono" :size 12 :weight 'semi-light)
 doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; Org mode Setup

; Org header sizes
(custom-set-faces
 '(org-level-1 ((t (:inherit outline-1 :height 2.1))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.8))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.5))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.3))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.0)))))

; Org & Roam
(setq org-directory (file-truename (concat homebase "notes/")))
(setq org-roam-directory (file-truename org-directory))
(setq org-roam-dailies-directory (file-truename (concat org-roam-directory "daily/")))
(setq projectile-project-search-path '(org-directory org-roam-directory org-roam-dailies-directory))

(after! org
  (setq org-startup-folded t
        org-log-done 'time
        org-modules '(org-habit)
        org-startup-with-inline-images t
        org-startup-with-latex-preview t
        org-preview-latex-default-process 'dvipng
        org-deadline-warning-days 7
        org-deadline-past-days 7
        org-image-actual-width nil
        org-priority-highest ?A
        org-priority-lowest ?F
        org-priority-default ?A
        org-priority-faces '((?A . 'all-the-icons-red)
                             (?B . 'all-the-icons-orange)
                             (?C . 'all-the-icons-lorange)
                             (?D . 'all-the-icons-yellow)
                             (?E . 'all-the-icons-lyellow)
                             (?F . 'all-the-icons-silver))
        org-fancy-priorities-list '((?A . "1")
                                    (?B . "2")
                                    (?C . "3")
                                    (?D . "4")
                                    (?E . "5")
                                    (?F . "6"))))

; Agenda
(setq
 org-preview-latex-default-process 'dvipng
 org-agenda-files '((file-truename (concat org-directory "inbox.org"))
                    (file-truename (concat org-directory "life/habits/habits.org"))
                    (file-truename (concat org-directory "academics/graduate-cpcb/research/aims.org"))
                    (file-truename (concat org-directory "academics/graduate-cpcb/research/dennis/general-dennis.org"))
                    (file-truename (concat org-directory "academics/graduate-cpcb/research/idrp/benchmarking-vaes.org"))
                    (file-truename (concat org-directory "academics/graduate-cpcb/bioZone/general-bioZone.org"))))

; Configure Packages
(use-package! websocket
    :after org-roam)

(use-package! org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

(use-package! org-super-agenda
  :after org-agenda
  :config
  (org-super-agenda-mode)
  (setq org-super-agenda-groups '((:name "INBOX" :file-path "inbox.org")
                                  (:name "HABITS" :file-path "habits.org")
                                  (:name "PROPOSAL" :file-path "aims.org")
                                  (:name "DENNIS" :file-path "general-dennis.org")
                                  (:name "IDRP" :file-path "benchmarking-vaes.org")
                                  (:name "BIOZONE" :file-path "general-bioZone.org")
                                  )))

;; Requires (IDK what these actually do)

(evil-embrace-enable-evil-surround-integration)
(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)

(org-roam-db-autosync-mode)

(require 'simpleclip)
(simpleclip-mode 1)

(require 'xclip)
(xclip-mode 1)

(require 'org-download)
(add-hook 'dired-mode-hook 'org-download-enable)

(require 'org-super-agenda)
