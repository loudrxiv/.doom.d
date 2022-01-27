;; identifying information
(setq user-full-name "Mark Ebeid"
      user-mail-address "mae117@pitt.edu"
      fancy-splash-image (file-truename "~/Cache/Sync/org/emacs-banner.png")
      doom-theme 'doom-gruvbox
      display-line-numbers-type t
      display-line-numbers-type 'relative
      doom-unicode-font (font-spec :family "Julia Mono" :size 12 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; headline size
(custom-set-faces
 '(org-level-1 ((t (:inherit outline-1 :height 2.1))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.8))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.5))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.3))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.0)))))

(setq org-directory (file-truename "~/Cache/Sync/org/")
      org-roam-directory (file-truename "~/Cache/Sync/org/")
      org-roam-dailies-directory (file-truename "~/Cache/Sync/org/daily/"))

(setq projectile-project-search-path '(org-directory org-roam-directory org-roam-dailies-directory))
(setq org-agenda-files '((file-truename (concat org-directory "inbox.org"))
                         (file-truename (concat org-directory "life/habits/habits.org"))
                         (file-truename (concat org-directory "academics/graduate/research/aims/aims.org"))
                         (file-truename (concat org-directory "academics/graduate/research/dennis/dennis.org"))
                         (file-truename (concat org-directory "academics/graduate/research/idrp.org"))
                         (file-truename (concat org-directory "academics/graduate/bioZone/bioZone.org"))))
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

(use-package! websocket
    :after org-roam)

(org-roam-db-autosync-mode)
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

(require 'org-super-agenda)
(use-package! org-super-agenda
  :after org-agenda
  :config
  (org-super-agenda-mode)
  (setq org-super-agenda-groups '((:name "INBOX" :file-path "inbox.org")
                                  (:name "HABITS" :file-path "habits.org")
                                  (:name "PROPOSAL" :file-path "aims.org")
                                  (:name "DENNIS" :file-path "dennis.org")
                                  (:name "IDRP" :file-path "idrp.org")
                                  (:name "BIOZONE" :file-path "bioZone.org"))))

(require 'org-download)
(add-hook 'dired-mode-hook 'org-download-enable)

(require 'xclip)
(xclip-mode 1)

(require 'simpleclip)
(simpleclip-mode 1)

(evil-embrace-enable-evil-surround-integration)
(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)
