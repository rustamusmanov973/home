;; Add yasnippet support for all company backends
;; https://github.com/syl20bnr/spacemacs/pull/179
;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-enable-paste-transient-state t
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;;st List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     (treemacs :variables treemacs-use-scope-type 'Perspectives)
     lsp
     javascript
     clojure
     lua
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     ipython-notebook
     evil-snipe
     (auto-completion :variables
                      auto-completion-return-key-behavior 'nil
                      auto-completion-tab-key-behavior 'complete
                      auto-completion-enable-snippets-in-popup t)
     better-defaults
     emacs-lisp
     git
     markdown
     org
      (shell :variables
             shell-default-shell 'shell
             shell-default-height 15
             shell-default-position 'bottom)
     ;; spell-checking
     syntax-checking
     version-control
     html
     (ranger :variables
             ranger-show-preview t
             ranger-cleanup-eagerly t

             )
     (python :variables
             python-backend 'lsp python-lsp-server 'mspyls
             python-formatter 'lsp
             python-format-on-save t

             )
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '()
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default

   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-mode-line-theme 'spacemacs
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 24
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))
(defun save-framegeometry ()
  "Gets the current frame's geometry and saves to ~/.emacs.d/framegeometry."
  (let (
        (framegeometry-left (frame-parameter (selected-frame) 'left))
        (framegeometry-top (frame-parameter (selected-frame) 'top))
        (framegeometry-width (frame-parameter (selected-frame) 'width))
        (framegeometry-height (frame-parameter (selected-frame) 'height))
        (framegeometry-file (expand-file-name "~/.emacs.d/framegeometry"))
        )

    (when (not (number-or-marker-p framegeometry-left))
      (setq framegeometry-left 0))
    (when (not (number-or-marker-p framegeometry-top))
      (setq framegeometry-top 0))
    (when (not (number-or-marker-p framegeometry-width))
      (setq framegeometry-width 0))
    (when (not (number-or-marker-p framegeometry-height))
      (setq framegeometry-height 0))

    (with-temp-buffer
      (insert
       ";;; This is the previous emacs frame's geometry.\n"
       ";;; Last generated " (current-time-string) ".\n"
       "(setq initial-frame-alist\n"
       "      '(\n"
       (format "        (top . %d)\n" (max framegeometry-top 0))
       (format "        (left . %d)\n" (max framegeometry-left 0))
       (format "        (width . %d)\n" (max framegeometry-width 0))
       (format "        (height . %d)))\n" (max framegeometry-height 0)))
      (when (file-writable-p framegeometry-file)
        (write-file framegeometry-file))))
  )

(defun load-framegeometry ()
  "Loads ~/.emacs.d/framegeometry which should load the previous frame's
geometry."
  (let ((framegeometry-file (expand-file-name "~/.emacs.d/framegeometry")))
    (when (file-readable-p framegeometry-file)
      (load-file framegeometry-file)))
  )
(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."


(if window-system
      (progn
        (add-hook 'after-init-hook 'load-framegeometry)
        (add-hook 'kill-emacs-hook 'save-framegeometry))
    )
;; (require 'atomic-chrome)
;; (atomic-chrome-start-server)
;; (setq atomic-chrome-default-major-mode 'markdown-mode)

;;  (require 'package)
;  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
  ;; (with-eval-after-load 'org
  ;; (require 'ox-beamer)
  ;; (require 'ox-publish)
  ;; (org-babel-do-load-lanuages 'org-babel-load-languages
  ;;                      rch       '(
  ;;                               (shell . t)
  ;;                                (perl . t)
  ;;                                (R . t)
  ;;                                (python . t)
  ;;                                (C . t)
  ;;                                (perl . t)
  ;;                                (php . t)
  ;;                                (js . t)
  ;;                                )
  ;;                              )
  ;; (defun my-org-confirm-babel-evaluate (lang body)
  ;;   (not (member lang '("C" "clojure" "sh"))))

  ;; (setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)
  ;; )

;  USELESS:  (setq exec-path-from-shell-arguments '())
; USELESS: (setq exec-path-from-shell-check-startup-files nil)

  )

;; ("\\.Z\\'" nil jka-compr)

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (message "very end!! of /Users/rst/.spacemacs !!!")
  ;; (spacemacs|define-transient-state layouts
  ;; ....
  ;;       ("c" persp-copy)
  ;; ...
  ;;       (spacemacs/set-leader-keys "l" 'spacemacs/layouts-transient-state/body))
;;(persp-load-state-from-file "~/.emacs.d/.cache/layouts/eyebrowse_layout1")
;;(spacemacs/layouts-transient-state/spacemacs/persp-switch-to-5)

    (defun find-file-new-buffer (filename)
    "Very basic `find-file' which does not use a pre-existing buffer."
    (interactive "fFind file in new buffer: ")
    (let ((buf (create-file-buffer filename)))
      (with-current-buffer buf
        (insert-file-contents filename t))
      (pop-to-buffer-same-window buf)))
  (defun pm (str)
    (print str)
    (message str)
    )
 (defun say (str)
   (shell-command-to-string (concat "say '"  str "'"))
    )
  (defun asay (str)
    "Say str asynchronously"
    (async-shell-command (concat "say '"  str "'"))
    )
  (defun vdp ()
    (and (boundp 'db) (member db '(t 1)))
    )

  (cl-defun vd (sym &optional (comment "") (idb nil))
    (when (or idb (vdp))
      (or (string= "" comment)
          (progn
            (setq comment2 (concat "[" comment "]"))
            (setq comment comment2)))

      (setq arg_type (type-of sym))
      (cond
       ((typep sym 'symbol)
        (progn
          (setq var_name (symbol-name sym))
          (setq var_value (symbol-value sym))
          )
        )
       (t (progn (print "VD: UNKNOWN variable TYPE. your var:") (print sym))))
       (message (concat "VD["
                      var_name
                      "]"
                      comment
                      ">>:"))
       (message var_value)

       ))
    (setq db 1)

    (defun shell-command-to-trimmed-string (str)
    (setq db 1)
    (vd 'str)
    (setq otp (shell-command-to-string  str))
    (vd 'otp "b tr")
    (setq trimmed_output (string-trim otp))
    )
    (defun write_goku_with_py ()
      (interactive )
    (print  "write_goku_with_py started")
      (setq kar_py_stderr
            (shell-command-to-trimmed-string  "/Users/rst/.config/karabiner_edn_writer.py >/dev/null"))
    (setq db 1)
  (vd 'kar_py_stderr "write_goku_with_py started")
      (if (string= "" kar_py_stderr)
    ;; (print "OK")
    (make_goku)
    (progn
  (print (concat "a_rst: karabiner_edn_writer.py ERROR>>|" kar_py_stderr "|"))
  (asay "python karabiner writer error")
  )))

  (defun make_goku ()
  (setq goku_output (shell-command-to-trimmed-string  "goku &; sleep 2; kill -9 $!"))
  (if (string-match "Done!" goku_output )
  (print "make_goku: OK")
  (progn
  (print (concat "make_goku ERROR: goku_output not 'Done!'>>|" goku_output "|"))
  (asay "goku error")
  )))

    (defun my-after-save-actions ();
        "Used in `after-save-hook'."
        (print "After save activated")
  (setq db 1)
        (vd 'buffer-file-name )
        (setq kp_fn "/Users/rst/.config/karabiner_prettified_before_python_inject.edn"  )
        (cond
  ((string-equal buffer-file-name "/Users/rst/.config/karabiner.edn")
  (progn (and (vdp) (say "Saving file"))  (or (make_goku) (say "goku done, but use kar py file instead"))))
  ((string-equal buffer-file-name kp_fn)
  (write_goku_with_py)))
  )
    (add-hook 'after-save-hook 'my-after-save-actions)
  (defun backward-kill-line (arg)
    "Kill ARG lines backward."
    (interactive "p")
    (kill-line (- 1 arg)))

  (defun h_world ()
    (print "hello world!!")
    (message "hello world!!")
    )
  (defun hwd ()
    (interactive)
    (print "hello world!!")
    (message "hello world!!")
    )
  (defun resolve-rel-path-auto ()
    (let ((file-name (or (buffer-file-name) list-buffers-directory)))
      (if file-name
          (progn
            (setq nfn buffer-file-name)
            (setq nfn (s-replace "/Users/rst/lib/rc/" "l" nfn))
            (setq nfn (s-replace "/Users/rst/lib/as/" "a" nfn))
            (setq nfn (s-replace "/Users/rst/lib/py/" "p" nfn))
            (setq nfn (s-replace "/Users/rst/lib/ss/" "s" nfn))
            (vd 'nfn)
            ;; (message (kill-new nfn))
            (print nfn)
            )
        (error "Buffer not visiting a file")))
    )
  (defun copy-rel-path-auto ()
    (interactive)
    (message (kill-new (subseq (resolve-rel-path-auto) 1)))
    )

  (defun copy-rel-path-goku-key ()
                          (interactive)
                          (message (kill-new (concat "[:" (read-string "key: ") " [:xl" (subseq (resolve-rel-path-auto) 0 1) " \"" (subseq (resolve-rel-path-auto) 1) "\"]]")))
                          )


  (defun copy-file-name-directory()
    (interactive)
    (let ((file-name (or (buffer-file-name) list-buffers-directory)))
      (if file-name
          (progn
            (message (kill-new (file-name-directory file-name)))
            )
        (error "Buffer not visiting a file")))
    )
  (defun copy-file-name-nondirectory()
    (interactive)
    (let ((file-name (or (buffer-file-name) list-buffers-directory)))
      (if file-name
          (progn
            (message (kill-new (file-name-nondirectory file-name)))
            )
        (error "Buffer not visiting a file")))
    )

  (defun dired-do-snippet-action1 (&optional arg)
    "Delete all marked (or next ARG) files.
`dired-recursive-deletes' controls whether deletion of
non-empty directories is allowed."
    ;; This is more consistent with the file marking feature than
    ;; dired-do-flagged-delete.
    (interactive "P")

    ;; (spacemacs/alternate-window)
    ;; (dired-do-snippet-action1)
    ;; (find-file "/Users/rst/.emacs.d/private/snippets/lisp-mode/comment")
    ;; (end-of-buffer)
    ;; (execute-kbd-macro 'insert_foobar)

    ;; (kmacro-pop-ring)
    ;; (find-file "/Users/rst/.emacs.d/private/snippets/lisp-mode/comment")
    ;; (execute-kbd-macro [?i ?f ?o ?o ?b ?a ?r escape])

    (let ((lst (dired-map-over-marks (print (dired-get-filename))
                                     nil)))
      (progn (loop for x in lst
             do (print x)))
      (switch-to-buffer "Music")


      )
     arg t)


  (defun execute-file-auto ()
    (interactive)
    (setq args (read-string "With arg: "))
    (save-buffer)
    (print buffer-file-name)
    (setq qbfn (concat "'" buffer-file-name "'"))
    (setq scm (concat "chmod 777 " qbfn "; " qbfn " " args))
    (vd 'scm)
    (shell-command scm)
    )
(defun switch_to_messages_buffer ()
  (interactive)
  (switch-to-buffer "*Messages*")
  (end-of-buffer))
(defun gepy ()
  (persp-add "lala")
  (shell "jup")
  (start-process "jup" "jup" "jupyter-notebook" "--no-browser" "--port" "5555")
  (shell "klg")
  (start-process "klg" "klg" "keylogger")
)
(defun google-it(query)
  (start-process "open" "open" "open" (concat "https://www.google.com/search?q=" query))
  )
(defun google-last-message ()
  (interactive)
  (google-it (with-current-buffer (get-buffer-create "*Messages*") 
               (progn (end-of-buffer)(string-trim (thing-at-point 'line t)))))
  )
(defun google-last-warning ()
  (interactive)
  (google-it (with-current-buffer (get-buffer-create "*Warnings*") 
               (progn (end-of-buffer)(string-trim (thing-at-point 'line t)))))
  )
;; VARIABLES
  (setq org-todo-keywords
        '((sequence "TODO(t!)" "NEXT(n!)" "DOINGNOW(d!)" "BLOCKED(b!)" "TODELEGATE(g!)" "DELEGATED(D!)" "FOLLOWUP(f!)" "TICKLE(T!)" "|" "CANCELLED(c!)" "DONE(F!)")))
  (setq org-todo-keyword-faces
        '(("TODO" . org-warning)
          ("DOINGNOW" . "#E35DBF")
          ("CANCELED" . (:foreground "white" :background "#4d4d4d" :weight bold))
          ("DELEGATED" . "pink")
          ("NEXT" . "#008080")))
  ;; (setq org-tag-faces
  ;;       '((sequence "aals(A!)" "amsu" "avsb" "21" "42(h!)" "chrome" "comm" "NEXT(n!)" "DOINGNOW(d!)" "BLOCKED(b!)" "TODELEGATE(g!)" "DELEGATED(D!)" "FOLLOWUP(f!)" "TICKLE(T!)" "|" "CANCELLED(c!)" "DONE(F!)")))
  (setq org-tag-alist '(("@work" . ?w) ("@home" . ?h) ("laptop" . ?l)))
  ;; (setq org-tag-alist '(("TODAY" . ?w) ("APPT" . ?h) ("NEXT" . ?l)))
  (setq org-tag-alist '(("TODAY" . ?w) ("APPT" . ?h) ("NEXT" . ?l)))

  (setq org-tag-alist '((:startgrouptag)
                        ("GTD" . ?g)
                        (:grouptags)
                        ("Control")
                        ("Persp")
                        (:endgrouptag)
                        (:startgrouptag)
                        ("Control")
                        (:grouptags)
                        ("Context")
                        ("Tass")
                        (:endgrouptag)))
  (setq org-tag-faces
        '(("TODAY" . (:foreground "#C00000"))
          ("APPT"  . (:foreground "#4d4d4d"))
          ("NEXT"  . (:foreground "#E35DBF"))))

  ;; (use-package org-fancy-priorities
  ;;   :ensure t
  ;;   :hook
  ;;   (org-mode . org-fancy-priorities-mode)
  ;;   :config
  ;;   (setq org-fancy-priorities-list '("⚡" "⬆" "⬇" "☕")))


 ;; KEYS definitions:
  ;; (global-set-key (kbd ""))


  (global-visual-line-mode t)
(setq dotspacemacs-distinguish-gui-tab t)
(setq org-ref-bibliography-notes "~/org/ref/notes.org"
      org-ref-default-bibliography '("~/org/ref/master.bib")
      org-ref-pdf-directory "~/org/ref/pdfs/"
)

;; KEYBINDINGS:
(fset 'insert_foobar [?i ?f ?o ?o ?b ?a ?r escape])
(fset 'insert_foobar2 [?i ?f ?o ?o ?b ?a escape])
(evil-set-register ?f [?i ?f ?o ?o ?b ?a ?r escape])
(evil-set-register ?q [?i ?f ?o ?o ?b ?a escape])
(global-set-key (kbd "<s-backspace>") 'backward-kill-line)
(global-set-key (kbd "C-M-]") 'kill-line)
(global-set-key (kbd "M-s-|") 'kill-word)
(global-set-key (kbd "M-m") 'spacemacs/frame-killer)
(global-set-key (kbd "M-s-!") 'beginning-of-line)
(global-set-key (kbd "M-s-@") 'end-of-line)
(global-set-key (kbd "M-s-#") 'evil-backward-word-begin)
(global-set-key (kbd "C-z") 'org-babel-execute-src-block)
(global-set-key (kbd "C-z") 'org-babel-execute-src-block)
(global-set-key (kbd "C-k") 'nil)
;; C-j was:  (org-return-indent)
(define-key org-mode-map (kbd "C-k") 'org-backward-paragraph)
(define-key org-mode-map (kbd "C-j") 'org-forward-paragraph)
;; LEADER KEYS
(setq spacemacs/key-binding-prefixes '(
                                       ("o" "own-menu")
                                       ("og" "Google ...")
                                       ("fy" "Yanking ...")
                                       ("fyr" "relative ..")
                                       ("fx" "Exec ...")
                                       ))
;; (print server-name)
;; (server-start)
;; (set-variable 'server-name "foo")
;; (setq server-socket-dir "~/.emacs.d/server")
(spacemacs/set-leader-keys "os" 'org-save-all-org-buffers
"oi" 'helm-org-agenda-files-headings
"ogm" 'google-last-message
"ogw" 'google-last-warning
"iSc" 'yas-new-snippet
"fy" nil
"fy" nil
"fyy" 'spacemacs/show-and-copy-buffer-filename
"fya" 'spacemacs/show-and-copy-buffer-filename
"fyf" 'copy-file-name-nondirectory
"fyd" 'copy-file-name-directory
"fyr" nil
"fyrr" 'copy-rel-path-auto
"fyrg" 'copy-rel-path-goku-key
"fx" nil
"fxx" 'execute-file-auto
"bm" 'switch_to_messages_buffer
"fk" 'helm-bookmarks
"wx" 'kill-buffer-and-window
"k[" 'beginning-of-defun
"k]" (lambda () (interactive) (progn (beginning-of-defun)(evil-jump-item)))
)


(spacemacs/declare-prefix-for-mode 'emacs-lisp-mode "m" "Mark ...")
(spacemacs/set-leader-keys-for-minor-mode 'emacs-lisp-mode  "m" nil)
(spacemacs/set-leader-keys-for-minor-mode 'emacs-lisp-mode  "[" 'beginning-of-defun)
(spacemacs/set-leader-keys-for-minor-mode 'emacs-lisp-mode  "]" (lambda () (interactive) (progn (beginning-of-defun)(evil-jump-item))))
(spacemacs/set-leader-keys-for-minor-mode 'emacs-lisp-mode  "." (lambda () (interactive) (spacemacs/defun-jump-transient-state-transient-state/end-of-defun)))
(spacemacs/set-leader-keys-for-minor-mode 'emacs-lisp-mode  "mf" 'mark-defun)
(defvar treemacs-node-visit-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "s")        #'treemacs-visit-node-vertical-split)
    (define-key map (kbd "v")        #'treemacs-visit-node-horizontal-split)
    (define-key map (kbd "o")        #'treemacs-visit-node-no-split)
    (define-key map (kbd "aa")       #'treemacs-visit-node-ace)
    (define-key map (kbd "av")       #'treemacs-visit-node-ace-horizontal-split)
    (define-key map (kbd "as")       #'treemacs-visit-node-ace-vertical-split)
    (define-key map (kbd "r")        #'treemacs-visit-node-in-most-recently-used-window)
    (define-key map (kbd "x")        #'treemacs-visit-node-in-external-application)
    map)
  "Keymap for node-visiting commands in `treemacs-mode'.")

;; (spacemacs/set-leader-keys "fed" (lambda () (interactive) (progn (find-file "~/.spacemacs") (narrow-to-defun 'dotspacemacs/user-config))))
;; )

;; TRANSIENT STATES
(spacemacs|define-transient-state window-manipulation
  :title "Window Manipulation Transient State"
  :doc (concat "
 Select^^^^               Move^^^^              Split^^               Resize^^             Other^^
 ──────^^^^─────────────  ────^^^^────────────  ─────^^─────────────  ──────^^───────────  ─────^^──────────────────
 [_j_/_k_]  down/up       [_J_/_K_] down/up     [_s_] vertical        [_[_] shrink horiz   [_u_] restore prev layout
 [_h_/_l_]  left/right    [_H_/_L_] left/right  [_S_] verti & follow  [_]_] enlarge horiz  [_U_] restore next layout
 [_0_.._9_] window 0..9   [_r_]^^   rotate fwd  [_v_] horizontal      [_{_] shrink verti   [_d_] close current
 [_w_]^^    other window  [_R_]^^   rotate bwd  [_V_] horiz & follow  [_}_] enlarge verti  [_D_] close other
 [_x_]^^    kill window and the buffer
 [_o_]^^    other frame   ^^^^                  ^^                    ^^                   "
               (if (configuration-layer/package-usedp 'golden-ratio)
                   "[_g_] golden-ratio %`golden-ratio-mode"
                 "")
               "\n ^^^^                     ^^^^                  ^^                    ^^                   [_q_] quit")
  :bindings
  ("q" nil :exit t)
  ("0" winum-select-window-0)
  ("1" winum-select-window-1)
  ("2" winum-select-window-2)
  ("3" winum-select-window-3)
  ("4" winum-select-window-4)
  ("5" winum-select-window-5)
  ("6" winum-select-window-6)
  ("7" winum-select-window-7)
  ("8" winum-select-window-8)
  ("9" winum-select-window-9)
  ("-" split-window-below-and-focus)
  ("/" split-window-right-and-focus)
  ("[" spacemacs/shrink-window-horizontally)
  ("]" spacemacs/enlarge-window-horizontally)
  ("{" spacemacs/shrink-window)
  ("}" spacemacs/enlarge-window)
  ("d" delete-window)
  ("D" delete-other-windows)
  ("h" evil-window-left)
  ("<left>" evil-window-left)
  ("j" evil-window-down)
  ("<down>" evil-window-down)
  ("k" evil-window-up)
  ("<up>" evil-window-up)
  ("l" evil-window-right)
  ("<right>" evil-window-right)
  ("H" evil-window-move-far-left)
  ("<S-left>" evil-window-move-far-left)
  ("J" evil-window-move-very-bottom)
  ("<S-down>" evil-window-move-very-bottom)
  ("K" evil-window-move-very-top)
  ("<S-up>" evil-window-move-very-top)
  ("L" evil-window-move-far-right)
  ("<S-right>" evil-window-move-far-right)
  ("o" other-frame)
  ("r" spacemacs/rotate-windows-forward)
  ("R" spacemacs/rotate-windows-backward)
  ("s" split-window-below)
  ("S" split-window-below-and-focus)
  ("u" winner-undo)
  ("U" winner-redo)
  ("v" split-window-right)
  ("V" split-window-right-and-focus)
  ("w" other-window)
  ("x" kill-buffer-and-window)
  )

;; TRANSIENT STATE

(spacemacs|define-transient-state defun-jump-transient-state
  :title "Defun Jump Transient State2"
  :doc (concat "
 [_k_] prev defun p n    [_j_]^^   next defun
 ^^^^                                      [_q_]^^   quit")
  :bindings
  ("q" nil :exit t)
  ("k" beginning-of-defun)
  ("j" end-of-defun)
  ("r" hwd)
  ("p" beginning-of-defun)
  ("n" end-of-defun)
  )

;; SETQs
(ranger-override-dired-mode t)
(setq my_path (getenv "PATH"))
;; MISC CODE:

(when (string= system-type "darwin")
  (setq dired-use-ls-dired nil))
(progn (print "my_path:")(print my_path))

(load "~/.hammerspoon/spacehammer.el")


(defun yasnippet-snippets--fixed-indent ()
  (print "I am ugly function yasnippet...indent"))
)
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bmkp-last-as-first-bookmark-file "/Users/rst/.emacs.d/.cache/bookmarks")
 '(org-agenda-files (quote ("~/org/main.org" "~/org/journal.org")))
 '(package-selected-packages
   (quote
    (pippel dap-mode helm-lsp yasnippet-snippets ein polymode deferred anaphora websocket helm-tramp helm-bm spotlight apples-mode helm-org company-lsp lsp-ui lsp-mode ob-applescript atomic-chrome bm evil-snipe pdf-tools tablist applescript-mode web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor js2-mode js-doc company-tern tern coffee-mode clojure-snippets clj-refactor inflections multiple-cursors paredit cider-eval-sexp-fu cider sesman queue parseedn clojure-mode parseclj a lua-mode yaml-mode phpunit phpcbf php-extras php-auto-yasnippets drupal-mode php-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode dash-functional helm-pydoc cython-mode company-anaconda anaconda-mode pythonic unfill mwim helm-company helm-c-yasnippet git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter fuzzy diff-hl company-statistics company ac-ispell auto-complete org-evil monitor auto-yasnippet yasnippet smeargle orgit org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download mmm-mode markdown-toc markdown-mode magit-gitflow magit-popup htmlize helm-gitignore gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck evil-magit magit git-commit with-editor transient auto-dictionary dired-ranger ranger ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump diminish define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line)))
 '(safe-local-variable-values
   (quote
    ((python-backend . lsp)
     (help-mode-hook quote
                     (quote hwd))
     (after-save-hook lambda nil
                      (interactive)
                      (message "Dotfile saved"))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(org-reload)

(setq org-default-notes-file (concat org-directory "/remember-notes.org"))
(setq org-remember-templates
      `(("Todo"    ?t "* TODO %?\n  %i\n" ,(concat org-directory "/remember-notes.org") bottom)
        ("Misc"    ?m "* %?\n  %i\n"      ,(concat org-directory "/Notes.org")   "Misc")
        ("iNfo"    ?n "* %?\n  %i\n"      ,(concat org-directory "/Notes.org")   "Information")
        ("Idea"    ?i "* %?\n  %i\n"      ,(concat org-directory "/Notes.org")   "Ideas")
        ("Journal" ?j "* %T %?\n\n  %i\n" ,(concat org-directory "/journal.org") bottom)
        ("Blog"    ?b "* %T %? :BLOG:\n\n  %i\n" ,(concat org-directory "/journal.org") bottom)
        ))

;; Local Variables:
;; after-save-hook: (lambda () (interactive) (message "Dotfile saved"))
;; END:
