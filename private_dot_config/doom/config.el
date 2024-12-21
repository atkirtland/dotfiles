;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; https://github.com/George9000/doom_discourse/blob/main/config.el
(add-load-path! "~/.config/doom/settings")
(require 'setup-company)
(require 'setup-julia-ts-mode)
                                        ; (require 'setup-treesit-auto)

                                        ; (setq treesit-language-source-alist
                                        ;       '((julia "https://github.com/tree-sitter/tree-sitter-julia")))
                                        ;(setq treesit-auto-install 'prompt)

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(use-package! gptel
  :config
  (setq! gptel-api-key "your key"))

;; Julia lang
;; https://github.com/George9000/doom_discourse/blob/main/config.el
;;
;; Julia LSP
(with-eval-after-load 'lsp-mode
  (add-to-list 'lsp-language-id-configuration
               '(julia-ts-mode . "julia")))

(setq lsp-julia-package-dir nil)
(after! lsp-julia
  (setq lsp-julia-default-environment "~/.julia/environments/v1.11")
  (setq-hook! 'julia-ts-mode-hook +format-with-lsp nil))

(after! julia-ts-mode
  (add-hook! 'julia-ts-mode-hook
    (setq-local lsp-enable-folding t
                lsp-folding-range-limit 100)
    (lsp)
    )
  )

;; supposedly could help with guessing project root?
(setq lsp-auto-guess-root t)
;;
;;
;; Julia REPL
(defun open-popup-new-frame (buffer &optional alist) (+popup-display-buffer-fullframe-fn buffer alist))
(use-package! julia-repl
  :hook (julia-ts-mode . julia-repl-mode)
  :config
  (setq julia-repl-executable-records '((default "julia" :basedir "/Users/foo/applications/julia10/usr/share/julia/base/")
                                        (dev "julia11" :basedir    "/Users/foo/applications/julia11/usr/share/julia/base/")))
  (setq julia-repl-executable-key 'default)
  (setq julia-repl-switches "-q -t 4,1")
  (set-popup-rule! "^\\*julia\\:.*\\*$" :actions '(display-buffer-pop-up-frame . inhibit-switch-frame)))

;; smart word wrapping
(+global-word-wrap-mode +1)
(setq which-key-idle-delay 0.1)
;; (setq +latex-viewers '(pdf-tools))
(apheleia-global-mode +1)

;; https://github.com/doomemacs/doomemacs/issues/5249
;; (after! tex
;;   (add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer)
;;   ;; set PDF tools as opening program
;;     (setq TeX-view-program-selection '((output-pdf "PDF Tools")))
;;           ;; TeX-view-program-list '(("PDF Tools" "TeX-pdf-tools-sync-view")))
;;     (add-hook 'LaTeX-mode-hook (lambda ()
;;                                  (push
;;                                   '("latexmk" "latexmk -pvc -pdf --synctex=1 %s" TeX-run-TeX nil t
;;                                     :help "Run latexmk on file")
;;                                   TeX-command-list)))
;;     (add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "latexmk")))
;; )

(setq TeX-view-program-list
      '(("Sioyek"
         ("Sioyek-x86_64.AppImage %o --new-window"
          (mode-io-correlate " --forward-search-file %b --forward-search-line %n --inverse-search \"emacsclient --no-wait +%2:%3 %1\""))
         "sioyek"))
      TeX-view-program-selection
      '(((output-dvi has-no-display-manager)
         "dvi2tty")
        ((output-dvi style-pstricks)
         "dvips and gv")
        (output-dvi "xdvi")
        ;; (output-pdf "Sioyek")
        (output-pdf "xdg-open")
        (output-html "xdg-open"))
      +latex-viewers '(sioyek))

(add-hook 'LaTeX-mode-hook #'TeX-source-correlate-mode)

(with-eval-after-load 'latex
  (define-key TeX-source-correlate-map [C-down-mouse-1] #'TeX-view-mouse))

;; since latex-mode is being loaded instead of LaTeX-mode
(add-to-list 'auto-mode-alist '("\\.tex\\'" . LaTeX-mode))
;; Bindings under leader key for easier access
(map! :after tex
      :leader
      :map LaTeX-mode-map
      "m {" #'LaTeX-find-matching-begin
      "m }" #'LaTeX-find-matching-end)

;; accept completion from copilot and fallback to company
(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :bind (:map copilot-completion-map
              ("<tab>" . 'copilot-accept-completion)
              ("TAB" . 'copilot-accept-completion)
              ("C-TAB" . 'copilot-accept-completion-by-word)
              ("C-<tab>" . 'copilot-accept-completion-by-word)))

(after! company
  (setq company-idle-delay 0.2))  ; Adjust the delay (e.g., 0.2 seconds)

;; removes sub/super scripts
(setq tex-fontify-script nil)
(setq font-latex-fontify-script nil)
