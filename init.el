;;; init.el -*- lexical-binding: t; -*-

;; ----- DOCUMENTATION ----- ;;

;; NOTE Press 'SPC h d h' to access Doom's documentation.
;;
;;      There you'll find a "Module Index" link where you'll find
;;      a comprehensive list of Doom's modules and what flags they
;;      support.

;; NOTE Move your cursor over a module's name and press 'K' to view
;;      its documentation. This works on flags as well.
;;
;;      Alternatively, press 'gd' on a module to browse its
;;      directory.

;; ----- END ----- ;;

(doom! :input
       ;;chinese
       ;;japanese
       ;;layout

       :completion
       (company +childframe)
       ;;helm
       ;;ido
       ;;ivy
       (vertico +icons)

       :ui
       ;;deft
       doom
       doom-dashboard
       doom-quit
       (emoji +unicode +github +ascii)
       hl-todo
       ;;hydra
       indent-guides
       (ligatures +extra)
       ;;minimap
       modeline
       nav-flash
       ;;neotree
       ophints
       (popup +defaults)
       ;;tabs
       (treemacs +lsp)
       unicode
       vc-gutter
       vi-tilde-fringe
       ;;(window-select +numbers)
       workspaces
       ;;zen

       :editor
       (evil +everywhere)
       file-templates
       fold
       (format +onsave)
       ;;god
       ;;lispy
       ;;multiple-cursors
       ;;objed
       ;;parinfer
       ;;rotate-text
       snippets
       word-wrap

       :emacs
       (dired +icons)
       electric
       (ibuffer +icons)
       undo
       vc

       :term
       ;;eshell
       shell
       term
       vterm

       :checkers
       (syntax +childframe)
       (spell +hunspell +flyspell +everywhere)
       grammar

       :tools
       ;;ansible
       debugger
       ;;direnv
       ;;docker
       ;;editorconfig
       ein
       (eval +overlay)
       gist
       (lookup +dictionary)
       ;;lsp            ; MIGHT WANT THIS
       (magit +forge)
       make
       ;;pass
       pdf
       ;;prodigy
       rgb
       ;;taskrunner
       ;;terraform
       tmux
       ;;upload

       :os
       (:if IS-MAC macos)
       (tty +osc)

       :lang
       ;;agda
       ;;beancount
       ;;cc
       ;;clojure
       ;;common-lisp
       ;;coq
       ;;crystal
       ;;csharp
       data
       ;;(dart +flutter)
       ;;dhall
       ;;elixir
       ;;elm
       emacs-lisp
       ;;erlang
       (ess +lintr)
       ;;factor
       ;;faust
       ;;fsharp
       ;;fstar
       ;;gdscript
       ;;(go +lsp)
       ;;(haskell +dante)
       ;;hy
       ;;idris
       ;;json
       ;;(java +meghanada)
       ;;javascript
       ;;julia
       ;;kotlin
       (latex +cdlatex +fold)
       ;;lean
       ;;ledger
       ;;lua
       (markdown +grip)
       ;;nim
       ;;nix
       ;;ocaml
       (org +brain +dragndrop
            +noter +gnuplot
            +journal +hugo
            +jupyter +pretty
            +present +pomodoro
            +pandoc +roam2
	    )

       ;;php
       plantuml
       ;;purescript
       (python +conda)
       ;;qt
       ;;racket
       ;;raku
       ;;rest
       ;;rst
       ;;(ruby +rails)
       ;;rust
       ;;scala
       ;;(scheme +guile)
       sh
       ;;sml
       ;;solidity
       swift
       ;;terra
       ;;web
       ;;yaml
       ;;zig

       :email
       (mu4e +org +gmail)
       ;;notmuch
       ;;(wanderlust +gmail)

       :app
       calendar
       emms
       ;;everywhere        ; *leave* Emacs!? You must be joking
       ;;irc               ; how neckbeards socialize
       ;;(rss +org)        ; emacs as an RSS reader
       ;;twitter           ; twitter client https://twitter.com/vnought

       :config
       ;;literate
       (default +bindings +smartparens))
