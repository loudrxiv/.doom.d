;; identifying information
(setq user-full-name "Mark Ebeid"
      user-mail-address "mebeid1@umbc.edu"
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
(setq org-agenda-files '("~/Cache/Sync/org/inbox.org"
                         "~/Cache/Sync/org/academics/graduate/research/aims/aims.org"
                         "~/Cache/Sync/org/academics/graduate/research/dennis/dennis.org"
                         "~/Cache/Sync/org/academics/graduate/research/idrp.org"
                         "~/Cache/Sync/org/academics/graduate/bioZone/bioZone.org"
                         "~/Cache/Sync/org/life/finances/finances.org"
                         "~/Cache/Sync/org/life/mental/mental.org"
                         "~/Cache/Sync/org/life/health/health.org"
                         "~/Cache/Sync/org/academics/graduate/research/benos.org"
                         "~/Cache/Sync/org/academics/graduate/courses/evolutionary-biology/evolutionary-biology.org"
                         "~/Cache/Sync/org/life/professional/software/emacs.org"
                         "~/Cache/Sync/org/academics/graduate/courses/metaschool/metaschool.org"))
(after! org
 (setq org-startup-folded t
       org-log-done 'time
       org-agenda-span 7
       org-modules '(ol-bibtex org-habit)
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
                            (?F . 'all-the-icons-silver))))

(use-package! websocket
  :after org-roam)

 (use-package! org-roam-ui
  :after org-roam ;; or :after org
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

 (use-package! org-super-agenda
  :after org-agenda
  :config
  (org-super-agenda-mode)
  (setq org-super-agenda-groups '((:name "PROPOSAL" :file-path "aims.org")
                                  (:name "DENNIS" :file-path "dennis.org")
                                  (:name "IDRP" :file-path "idrp.org")
                                  (:name "BIOZONE" :file-path "bioZone.org")
                                  (:name "FINANCES" :file-path "finances.org")
                                  (:name "MENTAL" :file-path "mental.org")
                                  (:name "HEALTH" :file-path "health.org")
                                  (:name "BENOS" :file-path "benos.org")
                                  (:name "EVOLBIO" :file-path "evolutionary-biology.org")
                                  (:name "EMACS" :file-path "emacs.org")
                                  (:name "METASCHOOL" :file-path "metaschool.org"))))

(use-package! org-fancy-priorities
  :ensure t
  :hook
  (org-mode . org-fancy-priorities-mode)
  :config
  (setq org-fancy-priorities-list '((?A . "1")
                                   (?B . "2")
                                   (?C . "3")
                                   (?D . "4")
                                   (?E . "5")
                                   (?F . "6"))))
