;;; desert-theme.el --- A color theme for Emacs.

;; Copyright (C) 2024 

;; Author: Elaina Philpott <erphilpo@icloud.com>
;; URL: http://github.com/threelaina/desert-emacs
;; Version: 2.9.0-snapshot

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; A port of the popular Vim theme desert for Emacs 24+, built on top
;; of the new built-in theme support in Emacs 24.

;;; Credits:

;; Jani Nurminen created the original theme for vim on which this port
;; is based.

;;; Code:

(deftheme desert "The desert color theme.")

(defgroup desert-theme nil
  "Desert theme."
  :group 'faces
  :prefix "desert-"
  :link '(url-link :tag "GitHub" "http://github.com/threelaina/desert-emacs")
  :tag "Desert theme")

;;;###autoload
(defcustom desert-override-colors-alist '()
  "Place to override default theme colors.

You can override a subset of the theme's default colors by
defining them in this alist."
  :group 'desert-theme
  :type '(alist
          :key-type (string :tag "Name")
          :value-type (string :tag " Hex")))

(defvar desert-use-variable-pitch nil
  "When non-nil, use variable pitch face for some headings and titles.")

(defvar desert-scale-org-headlines nil
  "Whether `org-mode' headlines should be scaled.")

(defvar desert-scale-outline-headlines nil
  "Whether `outline-mode' headlines should be scaled.")

(defcustom desert-height-minus-1 0.8
  "Font size -1."
  :type 'number
  :group 'desert-theme
  :package-version '(desert . "2.6"))

(defcustom desert-height-plus-1 1.1
  "Font size +1."
  :type 'number
  :group 'desert-theme
  :package-version '(desert . "2.6"))

(defcustom desert-height-plus-2 1.15
  "Font size +2."
  :type 'number
  :group 'desert-theme
  :package-version '(desert . "2.6"))

(defcustom desert-height-plus-3 1.2
  "Font size +3."
  :type 'number
  :group 'desert-theme
  :package-version '(desert . "2.6"))

(defcustom desert-height-plus-4 1.3
  "Font size +4."
  :type 'number
  :group 'desert-theme
  :package-version '(desert . "2.6"))

;;; Color Palette

(defvar desert-default-colors-alist
  '(("desert-fg-1"     . "#bdbdbd")
    ("desert-fg-05"    . "#dcdcdc")
    ("desert-fg"       . "#FFFFFF")
    ("desert-fg+1"     . "#FFFFFF")
    ("desert-fg+2"     . "#FFFFFF")
    ("desert-bg-2"     . "#000000")
    ("desert-bg-1"     . "#101010")
    ("desert-bg-08"    . "#101011")
    ("desert-bg-05"    . "#1b1b1b")
    ("desert-bg"       . "#252525")
    ("desert-bg+05"    . "#444444")
    ("desert-bg+1"     . "#666666")
    ("desert-bg+2"     . "#8a8a8a")
    ("desert-bg+3"     . "#afafaf")
    ("desert-red-6"    . "#a04241")
    ("desert-red-5"    . "#a84947")
    ("desert-red-4"    . "#b1514e")
    ("desert-red-3"    . "#b95855")
    ("desert-red-2"    . "#c3615e")
    ("desert-red-1"    . "#ce6a66")
    ("desert-red"      . "#D8736F")
    ("desert-red+1"    . "#e27c78")
    ("desert-red+2"    . "#ed8581")
    ("desert-orange"   . "#ffd691")
    ("desert-yellow-2" . "#d4cb81")
    ("desert-yellow-1" . "#e3da8f")
    ("desert-yellow"   . "#f3e99d")
    ("desert-green-5"  . "#61b368")
    ("desert-green-4"  . "#6dbf73")
    ("desert-green-3"  . "#79cb7e")
    ("desert-green-2"  . "#88da8c")
    ("desert-green-1"  . "#96e99a")
    ("desert-green"    . "#A5F8A8")
    ("desert-green+1"  . "#b4ffb6")
    ("desert-green+2"  . "#c3ffc5")
    ("desert-green+3"  . "#d2ffd4")
    ("desert-green+4"  . "#e2ffe4")
    ("desert-cyan"     . "#a3e0e4")
    ("desert-blue+3"   . "#6fafc7")
    ("desert-blue+2"   . "#7cbcd5")
    ("desert-blue+1"   . "#8acae2")
    ("desert-blue"     . "#97D7F0")
    ("desert-blue-1"   . "#a5e5fe")
    ("desert-blue-2"   . "#b2f2ff")
    ("desert-blue-3"   . "#c0ffff")
    ("desert-blue-4"   . "#d0ffff")
    ("desert-blue-5"   . "#e0ffff")
    ("desert-magenta"  . "#daa9de"))
  "List of desert colors.
Each element has the form (NAME . HEX).

`+N' suffixes indicate a color is lighter.
`-N' suffixes indicate a color is darker.")

(defmacro desert-with-color-variables (&rest body)
  "`let' bind all colors defined in `desert-colors-alist' around BODY.
Also bind `class' to ((class color) (min-colors 89))."
  (declare (indent 0))
  `(let ((class '((class color) (min-colors 89)))
         ,@(mapcar (lambda (cons)
                     (list (intern (car cons)) (cdr cons)))
                   (append desert-default-colors-alist
                           desert-override-colors-alist))
         (z-variable-pitch (if desert-use-variable-pitch
                               'variable-pitch 'default)))
     ,@body))

;;; Theme Faces
(desert-with-color-variables
  (custom-theme-set-faces
   'desert

;;;; Built-in packages

;;;;; basic coloring
   '(button ((t (:underline t))))
   `(link ((t (:foreground ,desert-yellow :underline t :weight bold))))
   `(link-visited ((t (:foreground ,desert-yellow-2 :underline t :weight normal))))
   `(default ((t (:foreground ,desert-fg :background ,desert-bg))))
   `(cursor ((t (:foreground ,desert-fg :background ,desert-fg+1))))
   `(widget-field ((t (:foreground ,desert-fg :background ,desert-bg+3))))
   `(escape-glyph ((t (:foreground ,desert-yellow :weight bold))))
   `(fringe ((t (:foreground ,desert-fg :background ,desert-bg+1))))
   `(header-line ((t (:foreground ,desert-yellow
                                  :background ,desert-bg-1
                                  :box (:line-width -1 :style released-button)
                                  :extend t))))
   `(highlight ((t (:background ,desert-bg-05))))
   `(success ((t (:foreground ,desert-green :weight bold))))
   `(warning ((t (:foreground ,desert-orange :weight bold))))
   `(tooltip ((t (:foreground ,desert-fg :background ,desert-bg+1))))
;;;;; ansi-colors
   `(ansi-color-black ((t (:foreground ,desert-bg
                                       :background ,desert-bg-1))))
   `(ansi-color-red ((t (:foreground ,desert-red-2
                                     :background ,desert-red-4))))
   `(ansi-color-green ((t (:foreground ,desert-green
                                       :background ,desert-green+2))))
   `(ansi-color-yellow ((t (:foreground ,desert-orange
                                        :background ,desert-yellow))))
   `(ansi-color-blue ((t (:foreground ,desert-blue-1
                                      :background ,desert-blue-4))))
   `(ansi-color-magenta ((t (:foreground ,desert-magenta
                                         :background ,desert-red))))
   `(ansi-color-cyan ((t (:foreground ,desert-cyan
                                      :background ,desert-blue))))
   `(ansi-color-white ((t (:foreground ,desert-fg
                                       :background ,desert-fg-1))))
;;;;; compilation
   `(compilation-column-face ((t (:foreground ,desert-yellow))))
   `(compilation-enter-directory-face ((t (:foreground ,desert-green))))
   `(compilation-error-face ((t (:foreground ,desert-red-1 :weight bold :underline t))))
   `(compilation-face ((t (:foreground ,desert-fg))))
   `(compilation-info-face ((t (:foreground ,desert-blue))))
   `(compilation-info ((t (:foreground ,desert-green+4 :underline t))))
   `(compilation-leave-directory-face ((t (:foreground ,desert-green))))
   `(compilation-line-face ((t (:foreground ,desert-yellow))))
   `(compilation-line-number ((t (:foreground ,desert-yellow))))
   `(compilation-message-face ((t (:foreground ,desert-blue))))
   `(compilation-warning-face ((t (:foreground ,desert-orange :weight bold :underline t))))
   `(compilation-mode-line-exit ((t (:foreground ,desert-green+2 :weight bold))))
   `(compilation-mode-line-fail ((t (:foreground ,desert-red :weight bold))))
   `(compilation-mode-line-run ((t (:foreground ,desert-yellow :weight bold))))
;;;;; completions
   `(completions-annotations ((t (:foreground ,desert-fg-1))))
   `(completions-common-part ((t (:foreground ,desert-blue))))
   `(completions-first-difference ((t (:foreground ,desert-fg+1))))
;;;;; customize
   `(custom-variable-tag ((t (:foreground ,desert-blue :weight bold))))
   `(custom-group-tag ((t (:foreground ,desert-blue :weight bold :height 1.2))))
   `(custom-state ((t (:foreground ,desert-green+4))))
;;;;; display-fill-column-indicator
   `(fill-column-indicator ((,class :foreground ,desert-bg-05 :weight semilight)))
;;;;; eww
   '(eww-invalid-certificate ((t (:inherit error))))
   '(eww-valid-certificate   ((t (:inherit success))))
;;;;; grep
   `(grep-context-face ((t (:foreground ,desert-fg))))
   `(grep-error-face ((t (:foreground ,desert-red-1 :weight bold :underline t))))
   `(grep-hit-face ((t (:foreground ,desert-blue))))
   `(grep-match-face ((t (:foreground ,desert-orange :weight bold))))
   `(match ((t (:background ,desert-bg-1 :foreground ,desert-orange :weight bold))))
;;;;; hi-lock
   `(hi-blue    ((t (:background ,desert-cyan    :foreground ,desert-bg-1))))
   `(hi-green   ((t (:background ,desert-green+4 :foreground ,desert-bg-1))))
   `(hi-pink    ((t (:background ,desert-magenta :foreground ,desert-bg-1))))
   `(hi-yellow  ((t (:background ,desert-yellow  :foreground ,desert-bg-1))))
   `(hi-blue-b  ((t (:foreground ,desert-blue    :weight     bold))))
   `(hi-green-b ((t (:foreground ,desert-green+2 :weight     bold))))
   `(hi-red-b   ((t (:foreground ,desert-red     :weight     bold))))
;;;;; info
   `(Info-quoted ((t (:inherit font-lock-constant-face))))
;;;;; isearch
   `(isearch ((t (:foreground ,desert-yellow-2 :weight bold :background ,desert-bg+2))))
   `(isearch-fail ((t (:foreground ,desert-fg :background ,desert-red-4))))
   `(lazy-highlight ((t (:foreground ,desert-yellow-2 :weight bold :background ,desert-bg-05))))

   `(menu ((t (:foreground ,desert-fg :background ,desert-bg))))
   `(minibuffer-prompt ((t (:foreground ,desert-yellow))))
   `(mode-line
     ((,class (:foreground ,desert-green+1
                           :background ,desert-bg-1
                           :box (:line-width -1 :style released-button)))
      (t :inverse-video t)))
   `(mode-line-buffer-id ((t (:foreground ,desert-yellow :weight bold))))
   `(mode-line-inactive
     ((t (:foreground ,desert-green-2
                      :background ,desert-bg-05
                      :box (:line-width -1 :style released-button)))))
   `(region ((,class (:background ,desert-bg-1 :extend t))
             (t :inverse-video t)))
   `(secondary-selection ((t (:background ,desert-bg+2))))
   `(trailing-whitespace ((t (:background ,desert-red))))
   `(vertical-border ((t (:foreground ,desert-fg))))
;;;;; font lock
   `(font-lock-builtin-face ((t (:foreground ,desert-fg :weight bold))))
   `(font-lock-comment-face ((t (:foreground ,desert-green))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,desert-green-2))))
   `(font-lock-constant-face ((t (:foreground ,desert-green+4))))
   `(font-lock-doc-face ((t (:foreground ,desert-green+2))))
   `(font-lock-function-name-face ((t (:foreground ,desert-cyan))))
   `(font-lock-keyword-face ((t (:foreground ,desert-yellow :weight bold))))
   `(font-lock-negation-char-face ((t (:foreground ,desert-yellow :weight bold))))
   `(font-lock-preprocessor-face ((t (:foreground ,desert-blue+1))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,desert-yellow :weight bold))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground ,desert-green :weight bold))))
   `(font-lock-string-face ((t (:foreground ,desert-red))))
   `(font-lock-type-face ((t (:foreground ,desert-blue-1))))
   `(font-lock-variable-name-face ((t (:foreground ,desert-orange))))
   `(font-lock-warning-face ((t (:foreground ,desert-yellow-2 :weight bold))))

   `(c-annotation-face ((t (:inherit font-lock-constant-face))))
;;;;; line numbers (Emacs 26.1 and above)
   `(line-number ((t (:inherit default :foreground ,desert-bg+3 :background ,desert-bg-05))))
   `(line-number-current-line ((t (:inherit line-number :foreground ,desert-yellow-2))))
;;;;; man
   '(Man-overstrike ((t (:inherit font-lock-keyword-face))))
   '(Man-underline  ((t (:inherit (font-lock-string-face underline)))))
;;;;; newsticker
   `(newsticker-date-face ((t (:foreground ,desert-fg))))
   `(newsticker-default-face ((t (:foreground ,desert-fg))))
   `(newsticker-enclosure-face ((t (:foreground ,desert-green+3))))
   `(newsticker-extra-face ((t (:foreground ,desert-bg+2 :height 0.8))))
   `(newsticker-feed-face ((t (:foreground ,desert-fg))))
   `(newsticker-immortal-item-face ((t (:foreground ,desert-green))))
   `(newsticker-new-item-face ((t (:foreground ,desert-blue))))
   `(newsticker-obsolete-item-face ((t (:foreground ,desert-red))))
   `(newsticker-old-item-face ((t (:foreground ,desert-bg+3))))
   `(newsticker-statistics-face ((t (:foreground ,desert-fg))))
   `(newsticker-treeview-face ((t (:foreground ,desert-fg))))
   `(newsticker-treeview-immortal-face ((t (:foreground ,desert-green))))
   `(newsticker-treeview-listwindow-face ((t (:foreground ,desert-fg))))
   `(newsticker-treeview-new-face ((t (:foreground ,desert-blue :weight bold))))
   `(newsticker-treeview-obsolete-face ((t (:foreground ,desert-red))))
   `(newsticker-treeview-old-face ((t (:foreground ,desert-bg+3))))
   `(newsticker-treeview-selection-face ((t (:background ,desert-bg-1 :foreground ,desert-yellow))))
;;;;; woman
   '(woman-bold   ((t (:inherit font-lock-keyword-face))))
   '(woman-italic ((t (:inherit (font-lock-string-face italic)))))

;;;; Third-party packages

;;;;; ace-jump
   `(ace-jump-face-background
     ((t (:foreground ,desert-fg-1 :background ,desert-bg :inverse-video nil))))
   `(ace-jump-face-foreground
     ((t (:foreground ,desert-green+2 :background ,desert-bg :inverse-video nil))))
;;;;; ace-window
   `(aw-background-face
     ((t (:foreground ,desert-fg-1 :background ,desert-bg :inverse-video nil))))
   `(aw-leading-char-face ((t (:inherit aw-mode-line-face))))
;;;;; adoc-mode
   `(adoc-anchor-face ((t (:foreground ,desert-blue+1))))
   `(adoc-code-face ((t (:inherit font-lock-constant-face))))
   `(adoc-command-face ((t (:foreground ,desert-yellow))))
   `(adoc-emphasis-face ((t (:inherit bold))))
   `(adoc-internal-reference-face ((t (:foreground ,desert-yellow-2 :underline t))))
   `(adoc-list-face ((t (:foreground ,desert-fg+1))))
   `(adoc-meta-face ((t (:foreground ,desert-yellow))))
   `(adoc-meta-hide-face ((t (:foreground ,desert-yellow))))
   `(adoc-secondary-text-face ((t (:foreground ,desert-yellow-1))))
   `(adoc-title-0-face ((t (:inherit font-lock-function-name-face :weight bold))))
   `(adoc-title-1-face ((t (:inherit font-lock-function-name-face :weight bold))))
   `(adoc-title-2-face ((t (:inherit font-lock-function-name-face :weight bold))))
   `(adoc-title-3-face ((t (:inherit font-lock-function-name-face :weight bold))))
   `(adoc-title-4-face ((t (:inherit font-lock-function-name-face :weight bold))))
   `(adoc-typewriter-face ((t (:inherit font-lock-constant-face))))
   `(adoc-verbatim-face ((t (:inherit font-lock-constant-face))))
   `(adoc-value-face ((t (:foreground ,desert-yellow))))
;;;;; android mode
   `(android-mode-debug-face ((t (:foreground ,desert-green+1))))
   `(android-mode-error-face ((t (:foreground ,desert-orange :weight bold))))
   `(android-mode-info-face ((t (:foreground ,desert-fg))))
   `(android-mode-verbose-face ((t (:foreground ,desert-green))))
   `(android-mode-warning-face ((t (:foreground ,desert-yellow))))
;;;;; anzu
   `(anzu-mode-line ((t (:foreground ,desert-cyan :weight bold))))
   `(anzu-mode-line-no-match ((t (:foreground ,desert-red :weight bold))))
   `(anzu-match-1 ((t (:foreground ,desert-bg :background ,desert-green))))
   `(anzu-match-2 ((t (:foreground ,desert-bg :background ,desert-orange))))
   `(anzu-match-3 ((t (:foreground ,desert-bg :background ,desert-blue))))
   `(anzu-replace-to ((t (:inherit anzu-replace-highlight :foreground ,desert-yellow))))
;;;;; auctex
   `(font-latex-bold-face ((t (:inherit bold))))
   `(font-latex-warning-face ((t (:foreground nil :inherit font-lock-warning-face))))
   `(font-latex-sectioning-5-face ((t (:foreground ,desert-red :weight bold ))))
   `(font-latex-sedate-face ((t (:foreground ,desert-yellow))))
   `(font-latex-italic-face ((t (:foreground ,desert-cyan :slant italic))))
   `(font-latex-string-face ((t (:inherit ,font-lock-string-face))))
   `(font-latex-math-face ((t (:foreground ,desert-orange))))
   `(font-latex-script-char-face ((t (:foreground ,desert-orange))))
;;;;; agda-mode
   `(agda2-highlight-keyword-face ((t (:foreground ,desert-yellow :weight bold))))
   `(agda2-highlight-string-face ((t (:foreground ,desert-red))))
   `(agda2-highlight-symbol-face ((t (:foreground ,desert-orange))))
   `(agda2-highlight-primitive-type-face ((t (:foreground ,desert-blue-1))))
   `(agda2-highlight-inductive-constructor-face ((t (:foreground ,desert-fg))))
   `(agda2-highlight-coinductive-constructor-face ((t (:foreground ,desert-fg))))
   `(agda2-highlight-datatype-face ((t (:foreground ,desert-blue))))
   `(agda2-highlight-function-face ((t (:foreground ,desert-blue))))
   `(agda2-highlight-module-face ((t (:foreground ,desert-blue-1))))
   `(agda2-highlight-error-face ((t (:foreground ,desert-bg :background ,desert-magenta))))
   `(agda2-highlight-unsolved-meta-face ((t (:foreground ,desert-bg :background ,desert-magenta))))
   `(agda2-highlight-unsolved-constraint-face ((t (:foreground ,desert-bg :background ,desert-magenta))))
   `(agda2-highlight-termination-problem-face ((t (:foreground ,desert-bg :background ,desert-magenta))))
   `(agda2-highlight-incomplete-pattern-face ((t (:foreground ,desert-bg :background ,desert-magenta))))
   `(agda2-highlight-typechecks-face ((t (:background ,desert-red-4))))
;;;;; auto-complete
   `(ac-candidate-face ((t (:background ,desert-bg+3 :foreground ,desert-bg-2))))
   `(ac-selection-face ((t (:background ,desert-blue-4 :foreground ,desert-fg))))
   `(popup-tip-face ((t (:background ,desert-yellow-2 :foreground ,desert-bg-2))))
   `(popup-menu-mouse-face ((t (:background ,desert-yellow-2 :foreground ,desert-bg-2))))
   `(popup-summary-face ((t (:background ,desert-bg+3 :foreground ,desert-bg-2))))
   `(popup-scroll-bar-foreground-face ((t (:background ,desert-blue-5))))
   `(popup-scroll-bar-background-face ((t (:background ,desert-bg-1))))
   `(popup-isearch-match ((t (:background ,desert-bg :foreground ,desert-fg))))
;;;;; avy
   `(avy-background-face
     ((t (:foreground ,desert-fg-1 :background ,desert-bg :inverse-video nil))))
   `(avy-lead-face-0
     ((t (:foreground ,desert-green+3 :background ,desert-bg :inverse-video nil :weight bold))))
   `(avy-lead-face-1
     ((t (:foreground ,desert-yellow :background ,desert-bg :inverse-video nil :weight bold))))
   `(avy-lead-face-2
     ((t (:foreground ,desert-red+1 :background ,desert-bg :inverse-video nil :weight bold))))
   `(avy-lead-face
     ((t (:foreground ,desert-cyan :background ,desert-bg :inverse-video nil :weight bold))))
;;;;; company-mode
   `(company-tooltip ((t (:foreground ,desert-fg :background ,desert-bg+1))))
   `(company-tooltip-annotation ((t (:foreground ,desert-orange :background ,desert-bg+1))))
   `(company-tooltip-annotation-selection ((t (:foreground ,desert-orange :background ,desert-bg-1))))
   `(company-tooltip-selection ((t (:foreground ,desert-fg :background ,desert-bg-1))))
   `(company-tooltip-mouse ((t (:background ,desert-bg-1))))
   `(company-tooltip-common ((t (:foreground ,desert-green+2))))
   `(company-tooltip-common-selection ((t (:foreground ,desert-green+2))))
   `(company-scrollbar-fg ((t (:background ,desert-bg-1))))
   `(company-scrollbar-bg ((t (:background ,desert-bg+2))))
   `(company-preview ((t (:background ,desert-green+2))))
   `(company-preview-common ((t (:foreground ,desert-green+2 :background ,desert-bg-1))))
;;;;; corfu
   `(corfu-default ((t (:foreground ,desert-fg :background ,desert-bg+1))))
   `(corfu-current ((t (:foreground ,desert-fg :background ,desert-bg-1))))
   `(corfu-bar ((t (:background ,desert-bg-1))))
   `(corfu-bar ((t (:background ,desert-bg-2))))
;;;;; bm
   `(bm-face ((t (:background ,desert-yellow-1 :foreground ,desert-bg))))
   `(bm-fringe-face ((t (:background ,desert-yellow-1 :foreground ,desert-bg))))
   `(bm-fringe-persistent-face ((t (:background ,desert-green-2 :foreground ,desert-bg))))
   `(bm-persistent-face ((t (:background ,desert-green-2 :foreground ,desert-bg))))
;;;;; calfw
   `(cfw:face-annotation ((t (:foreground ,desert-red :inherit cfw:face-day-title))))
   `(cfw:face-day-title ((t nil)))
   `(cfw:face-default-content ((t (:foreground ,desert-green))))
   `(cfw:face-default-day ((t (:weight bold))))
   `(cfw:face-disable ((t (:foreground ,desert-fg-1))))
   `(cfw:face-grid ((t (:inherit shadow))))
   `(cfw:face-header ((t (:inherit font-lock-keyword-face))))
   `(cfw:face-holiday ((t (:inherit cfw:face-sunday))))
   `(cfw:face-periods ((t (:foreground ,desert-cyan))))
   `(cfw:face-saturday ((t (:foreground ,desert-blue :weight bold))))
   `(cfw:face-select ((t (:background ,desert-blue-5))))
   `(cfw:face-sunday ((t (:foreground ,desert-red :weight bold))))
   `(cfw:face-title ((t (:height 2.0 :inherit (variable-pitch font-lock-keyword-face)))))
   `(cfw:face-today ((t (:foreground ,desert-cyan :weight bold))))
   `(cfw:face-today-title ((t (:inherit highlight bold))))
   `(cfw:face-toolbar ((t (:background ,desert-blue-5))))
   `(cfw:face-toolbar-button-off ((t (:underline nil :inherit link))))
   `(cfw:face-toolbar-button-on ((t (:underline nil :inherit link-visited))))
;;;;; centaur-tabs
   `(centaur-tabs-default ((t (:background ,desert-bg :foreground ,desert-fg :box nil))))
   `(centaur-tabs-selected ((t (:background ,desert-bg :foreground ,desert-fg+2 :box nil))))
   `(centaur-tabs-unselected ((t (:background ,desert-bg-1 :foreground ,desert-fg-05 :box nil))))
   `(centaur-tabs-selected-modified ((t (:background ,desert-bg :foreground ,desert-orange :box nil))))
   `(centaur-tabs-unselected-modified ((t (:background ,desert-bg-1 :foreground ,desert-orange :box nil))))
   `(centaur-tabs-active-bar-face ((t (:background ,desert-yellow :box nil))))
   `(centaur-tabs-modified-marker-selected ((t (:inherit 'centaur-tabs-selected-modified :foreground ,desert-yellow :box nil))))
   `(centaur-tabs-modified-marker-unselected ((t (:inherit 'centaur-tabs-unselected-modified :foreground ,desert-yellow :box nil))))
;;;;; cider
   `(cider-result-overlay-face ((t (:background unspecified))))
   `(cider-enlightened-face ((t (:box (:color ,desert-orange :line-width -1)))))
   `(cider-enlightened-local-face ((t (:weight bold :foreground ,desert-green+1))))
   `(cider-deprecated-face ((t (:background ,desert-yellow-2))))
   `(cider-instrumented-face ((t (:box (:color ,desert-red :line-width -1)))))
   `(cider-traced-face ((t (:box (:color ,desert-cyan :line-width -1)))))
   `(cider-test-failure-face ((t (:background ,desert-red-4))))
   `(cider-test-error-face ((t (:background ,desert-magenta))))
   `(cider-test-success-face ((t (:background ,desert-green-2))))
   `(cider-fringe-good-face ((t (:foreground ,desert-green+4))))
;;;;; circe
   `(circe-highlight-nick-face ((t (:foreground ,desert-cyan))))
   `(circe-my-message-face ((t (:foreground ,desert-fg))))
   `(circe-fool-face ((t (:foreground ,desert-red+1))))
   `(circe-topic-diff-removed-face ((t (:foreground ,desert-red :weight bold))))
   `(circe-originator-face ((t (:foreground ,desert-fg))))
   `(circe-server-face ((t (:foreground ,desert-green))))
   `(circe-topic-diff-new-face ((t (:foreground ,desert-orange :weight bold))))
   `(circe-prompt-face ((t (:foreground ,desert-orange :background ,desert-bg :weight bold))))
;;;;; context-coloring
   `(context-coloring-level-0-face ((t :foreground ,desert-fg)))
   `(context-coloring-level-1-face ((t :foreground ,desert-cyan)))
   `(context-coloring-level-2-face ((t :foreground ,desert-green+4)))
   `(context-coloring-level-3-face ((t :foreground ,desert-yellow)))
   `(context-coloring-level-4-face ((t :foreground ,desert-orange)))
   `(context-coloring-level-5-face ((t :foreground ,desert-magenta)))
   `(context-coloring-level-6-face ((t :foreground ,desert-blue+1)))
   `(context-coloring-level-7-face ((t :foreground ,desert-green+2)))
   `(context-coloring-level-8-face ((t :foreground ,desert-yellow-2)))
   `(context-coloring-level-9-face ((t :foreground ,desert-red+1)))
;;;;; coq
   `(coq-solve-tactics-face ((t (:foreground nil :inherit font-lock-constant-face))))
;;;;; ctable
   `(ctbl:face-cell-select ((t (:background ,desert-blue :foreground ,desert-bg))))
   `(ctbl:face-continue-bar ((t (:background ,desert-bg-05 :foreground ,desert-bg))))
   `(ctbl:face-row-select ((t (:background ,desert-cyan :foreground ,desert-bg))))
;;;;; debbugs
   `(debbugs-gnu-done ((t (:foreground ,desert-fg-1))))
   `(debbugs-gnu-handled ((t (:foreground ,desert-green))))
   `(debbugs-gnu-new ((t (:foreground ,desert-red))))
   `(debbugs-gnu-pending ((t (:foreground ,desert-blue))))
   `(debbugs-gnu-stale ((t (:foreground ,desert-orange))))
   `(debbugs-gnu-tagged ((t (:foreground ,desert-red))))
;;;;; diff
   ;; Please read (info "(magit)Theming Faces") before changing this.
   `(diff-added          ((t (:background "#335533" :foreground ,desert-green))))
   `(diff-changed        ((t (:background "#555511" :foreground ,desert-yellow-1))))
   `(diff-removed        ((t (:background "#553333" :foreground ,desert-red-2))))
   `(diff-refine-added   ((t (:background "#338833" :foreground ,desert-green+4))))
   `(diff-refine-changed ((t (:background "#888811" :foreground ,desert-yellow))))
   `(diff-refine-removed ((t (:background "#883333" :foreground ,desert-red))))
   `(diff-header ((,class (:background ,desert-bg+2))
                  (t (:background ,desert-fg :foreground ,desert-bg))))
   `(diff-file-header
     ((,class (:background ,desert-bg+2 :foreground ,desert-fg :weight bold))
      (t (:background ,desert-fg :foreground ,desert-bg :weight bold))))
;;;;; diff-hl
   `(diff-hl-change ((,class (:foreground ,desert-blue :background ,desert-blue-2))))
   `(diff-hl-delete ((,class (:foreground ,desert-red+1 :background ,desert-red-1))))
   `(diff-hl-insert ((,class (:foreground ,desert-green+1 :background ,desert-green-2))))
;;;;; dim-autoload
   `(dim-autoload-cookie-line ((t :foreground ,desert-bg+1)))
;;;;; dired+
   `(diredp-display-msg ((t (:foreground ,desert-blue))))
   `(diredp-compressed-file-suffix ((t (:foreground ,desert-orange))))
   `(diredp-date-time ((t (:foreground ,desert-magenta))))
   `(diredp-deletion ((t (:foreground ,desert-yellow))))
   `(diredp-deletion-file-name ((t (:foreground ,desert-red))))
   `(diredp-dir-heading ((t (:foreground ,desert-blue :background ,desert-bg-1))))
   `(diredp-dir-priv ((t (:foreground ,desert-cyan))))
   `(diredp-exec-priv ((t (:foreground ,desert-red))))
   `(diredp-executable-tag ((t (:foreground ,desert-green+1))))
   `(diredp-file-name ((t (:foreground ,desert-blue))))
   `(diredp-file-suffix ((t (:foreground ,desert-green))))
   `(diredp-flag-mark ((t (:foreground ,desert-yellow))))
   `(diredp-flag-mark-line ((t (:foreground ,desert-orange))))
   `(diredp-ignored-file-name ((t (:foreground ,desert-red))))
   `(diredp-link-priv ((t (:foreground ,desert-yellow))))
   `(diredp-mode-line-flagged ((t (:foreground ,desert-yellow))))
   `(diredp-mode-line-marked ((t (:foreground ,desert-orange))))
   `(diredp-no-priv ((t (:foreground ,desert-fg))))
   `(diredp-number ((t (:foreground ,desert-green+1))))
   `(diredp-other-priv ((t (:foreground ,desert-yellow-1))))
   `(diredp-rare-priv ((t (:foreground ,desert-red-1))))
   `(diredp-read-priv ((t (:foreground ,desert-green-2))))
   `(diredp-symlink ((t (:foreground ,desert-yellow))))
   `(diredp-write-priv ((t (:foreground ,desert-magenta))))
;;;;; dired-async
   `(dired-async-failures ((t (:foreground ,desert-red :weight bold))))
   `(dired-async-message ((t (:foreground ,desert-yellow :weight bold))))
   `(dired-async-mode-message ((t (:foreground ,desert-yellow))))
;;;;; diredfl
   `(diredfl-compressed-file-suffix ((t (:foreground ,desert-orange))))
   `(diredfl-date-time ((t (:foreground ,desert-magenta))))
   `(diredfl-deletion ((t (:foreground ,desert-yellow))))
   `(diredfl-deletion-file-name ((t (:foreground ,desert-red))))
   `(diredfl-dir-heading ((t (:foreground ,desert-blue :background ,desert-bg-1))))
   `(diredfl-dir-priv ((t (:foreground ,desert-cyan))))
   `(diredfl-exec-priv ((t (:foreground ,desert-red))))
   `(diredfl-executable-tag ((t (:foreground ,desert-green+1))))
   `(diredfl-file-name ((t (:foreground ,desert-blue))))
   `(diredfl-file-suffix ((t (:foreground ,desert-green))))
   `(diredfl-flag-mark ((t (:foreground ,desert-yellow))))
   `(diredfl-flag-mark-line ((t (:foreground ,desert-orange))))
   `(diredfl-ignored-file-name ((t (:foreground ,desert-red))))
   `(diredfl-link-priv ((t (:foreground ,desert-yellow))))
   `(diredfl-no-priv ((t (:foreground ,desert-fg))))
   `(diredfl-number ((t (:foreground ,desert-green+1))))
   `(diredfl-other-priv ((t (:foreground ,desert-yellow-1))))
   `(diredfl-rare-priv ((t (:foreground ,desert-red-1))))
   `(diredfl-read-priv ((t (:foreground ,desert-green-1))))
   `(diredfl-symlink ((t (:foreground ,desert-yellow))))
   `(diredfl-write-priv ((t (:foreground ,desert-magenta))))
;;;;; doom-modeline
   `(doom-modeline-bar  ((t (:background ,desert-yellow))))
   `(doom-modeline-inactive-bar  ((t (:background nil))))
;;;;; ediff
   `(ediff-current-diff-A ((t (:foreground ,desert-fg :background ,desert-red-4))))
   `(ediff-current-diff-Ancestor ((t (:foreground ,desert-fg :background ,desert-red-4))))
   `(ediff-current-diff-B ((t (:foreground ,desert-fg :background ,desert-green-2))))
   `(ediff-current-diff-C ((t (:foreground ,desert-fg :background ,desert-blue-5))))
   `(ediff-even-diff-A ((t (:background ,desert-bg+1))))
   `(ediff-even-diff-Ancestor ((t (:background ,desert-bg+1))))
   `(ediff-even-diff-B ((t (:background ,desert-bg+1))))
   `(ediff-even-diff-C ((t (:background ,desert-bg+1))))
   `(ediff-fine-diff-A ((t (:foreground ,desert-fg :background ,desert-red-2 :weight bold))))
   `(ediff-fine-diff-Ancestor ((t (:foreground ,desert-fg :background ,desert-red-2 weight bold))))
   `(ediff-fine-diff-B ((t (:foreground ,desert-fg :background ,desert-green :weight bold))))
   `(ediff-fine-diff-C ((t (:foreground ,desert-fg :background ,desert-blue-3 :weight bold ))))
   `(ediff-odd-diff-A ((t (:background ,desert-bg+2))))
   `(ediff-odd-diff-Ancestor ((t (:background ,desert-bg+2))))
   `(ediff-odd-diff-B ((t (:background ,desert-bg+2))))
   `(ediff-odd-diff-C ((t (:background ,desert-bg+2))))
;;;;; egg
   `(egg-text-base ((t (:foreground ,desert-fg))))
   `(egg-help-header-1 ((t (:foreground ,desert-yellow))))
   `(egg-help-header-2 ((t (:foreground ,desert-green+3))))
   `(egg-branch ((t (:foreground ,desert-yellow))))
   `(egg-branch-mono ((t (:foreground ,desert-yellow))))
   `(egg-term ((t (:foreground ,desert-yellow))))
   `(egg-diff-add ((t (:foreground ,desert-green+4))))
   `(egg-diff-del ((t (:foreground ,desert-red+1))))
   `(egg-diff-file-header ((t (:foreground ,desert-yellow-2))))
   `(egg-section-title ((t (:foreground ,desert-yellow))))
   `(egg-stash-mono ((t (:foreground ,desert-green+4))))
;;;;; elfeed
   `(elfeed-log-error-level-face ((t (:foreground ,desert-red))))
   `(elfeed-log-info-level-face ((t (:foreground ,desert-blue))))
   `(elfeed-log-warn-level-face ((t (:foreground ,desert-yellow))))
   `(elfeed-search-date-face ((t (:foreground ,desert-yellow-1 :underline t
                                              :weight bold))))
   `(elfeed-search-tag-face ((t (:foreground ,desert-green))))
   `(elfeed-search-feed-face ((t (:foreground ,desert-cyan))))
   `(elfeed-search-title-face ((t (:foreground ,desert-fg-05))))
   `(elfeed-search-unread-title-face ((t (:foreground ,desert-fg :weight bold))))
;;;;; emacs-w3m
   `(w3m-anchor ((t (:foreground ,desert-yellow :underline t
                                 :weight bold))))
   `(w3m-arrived-anchor ((t (:foreground ,desert-yellow-2
                                         :underline t :weight normal))))
   `(w3m-form ((t (:foreground ,desert-red-1 :underline t))))
   `(w3m-header-line-location-title ((t (:foreground ,desert-yellow
                                                     :underline t :weight bold))))
   '(w3m-history-current-url ((t (:inherit match))))
   `(w3m-lnum ((t (:foreground ,desert-green+2 :background ,desert-bg))))
   `(w3m-lnum-match ((t (:background ,desert-bg-1
                                     :foreground ,desert-orange
                                     :weight bold))))
   `(w3m-lnum-minibuffer-prompt ((t (:foreground ,desert-yellow))))
;;;;; erc
   `(erc-action-face ((t (:inherit erc-default-face))))
   `(erc-bold-face ((t (:weight bold))))
   `(erc-current-nick-face ((t (:foreground ,desert-blue :weight bold))))
   `(erc-dangerous-host-face ((t (:inherit font-lock-warning-face))))
   `(erc-default-face ((t (:foreground ,desert-fg))))
   `(erc-direct-msg-face ((t (:inherit erc-default-face))))
   `(erc-error-face ((t (:inherit font-lock-warning-face))))
   `(erc-fool-face ((t (:inherit erc-default-face))))
   `(erc-highlight-face ((t (:inherit hover-highlight))))
   `(erc-input-face ((t (:foreground ,desert-yellow))))
   `(erc-keyword-face ((t (:foreground ,desert-blue :weight bold))))
   `(erc-nick-default-face ((t (:foreground ,desert-yellow :weight bold))))
   `(erc-my-nick-face ((t (:foreground ,desert-red :weight bold))))
   `(erc-nick-msg-face ((t (:inherit erc-default-face))))
   `(erc-notice-face ((t (:foreground ,desert-green))))
   `(erc-pal-face ((t (:foreground ,desert-orange :weight bold))))
   `(erc-prompt-face ((t (:foreground ,desert-orange :background ,desert-bg :weight bold))))
   `(erc-timestamp-face ((t (:foreground ,desert-green+4))))
   `(erc-underline-face ((t (:underline t))))
;;;;; eros
   `(eros-result-overlay-face ((t (:background unspecified))))
;;;;; ert
   `(ert-test-result-expected ((t (:foreground ,desert-green+4 :background ,desert-bg))))
   `(ert-test-result-unexpected ((t (:foreground ,desert-red :background ,desert-bg))))
;;;;; eshell
   `(eshell-prompt ((t (:foreground ,desert-yellow :weight bold))))
   `(eshell-ls-archive ((t (:foreground ,desert-red-1 :weight bold))))
   `(eshell-ls-backup ((t (:inherit font-lock-comment-face))))
   `(eshell-ls-clutter ((t (:inherit font-lock-comment-face))))
   `(eshell-ls-directory ((t (:foreground ,desert-blue+1 :weight bold))))
   `(eshell-ls-executable ((t (:foreground ,desert-red+1 :weight bold))))
   `(eshell-ls-unreadable ((t (:foreground ,desert-fg))))
   `(eshell-ls-missing ((t (:inherit font-lock-warning-face))))
   `(eshell-ls-product ((t (:inherit font-lock-doc-face))))
   `(eshell-ls-special ((t (:foreground ,desert-yellow :weight bold))))
   `(eshell-ls-symlink ((t (:foreground ,desert-cyan :weight bold))))
;;;;; flx
   `(flx-highlight-face ((t (:foreground ,desert-green+2 :weight bold))))
;;;;; flycheck
   `(flycheck-error
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,desert-red-1) :inherit unspecified))
      (t (:foreground ,desert-red-1 :weight bold :underline t))))
   `(flycheck-warning
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,desert-yellow) :inherit unspecified))
      (t (:foreground ,desert-yellow :weight bold :underline t))))
   `(flycheck-info
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,desert-cyan) :inherit unspecified))
      (t (:foreground ,desert-cyan :weight bold :underline t))))
   `(flycheck-fringe-error ((t (:foreground ,desert-red-1 :weight bold))))
   `(flycheck-fringe-warning ((t (:foreground ,desert-yellow :weight bold))))
   `(flycheck-fringe-info ((t (:foreground ,desert-cyan :weight bold))))
;;;;; flymake
   `(flymake-errline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,desert-red)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (t (:foreground ,desert-red-1 :weight bold :underline t))))
   `(flymake-warnline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,desert-orange)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (t (:foreground ,desert-orange :weight bold :underline t))))
   `(flymake-infoline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,desert-green)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (t (:foreground ,desert-green-2 :weight bold :underline t))))
   `(flymake-error
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,desert-red)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (t (:foreground ,desert-red-1 :weight bold :underline t))))
   `(flymake-warning
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,desert-orange)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (t (:foreground ,desert-orange :weight bold :underline t))))
   `(flymake-note
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,desert-green)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (t (:foreground ,desert-green-2 :weight bold :underline t))))
;;;;; flyspell
   `(flyspell-duplicate
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,desert-orange) :inherit unspecified))
      (t (:foreground ,desert-orange :weight bold :underline t))))
   `(flyspell-incorrect
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,desert-red) :inherit unspecified))
      (t (:foreground ,desert-red-1 :weight bold :underline t))))
;;;;; full-ack
   `(ack-separator ((t (:foreground ,desert-fg))))
   `(ack-file ((t (:foreground ,desert-blue))))
   `(ack-line ((t (:foreground ,desert-yellow))))
   `(ack-match ((t (:foreground ,desert-orange :background ,desert-bg-1 :weight bold))))
;;;;; git-annex
   '(git-annex-dired-annexed-available ((t (:inherit success :weight normal))))
   '(git-annex-dired-annexed-unavailable ((t (:inherit error :weight normal))))
;;;;; git-commit
   `(git-commit-comment-action  ((,class (:foreground ,desert-green+1 :weight bold))))
   `(git-commit-comment-branch  ((,class (:foreground ,desert-blue+1  :weight bold)))) ; obsolete
   `(git-commit-comment-branch-local  ((,class (:foreground ,desert-blue+1  :weight bold))))
   `(git-commit-comment-branch-remote ((,class (:foreground ,desert-green  :weight bold))))
   `(git-commit-comment-heading ((,class (:foreground ,desert-yellow  :weight bold))))
;;;;; git-gutter
   `(git-gutter:added ((t (:foreground ,desert-green :weight bold :inverse-video t))))
   `(git-gutter:deleted ((t (:foreground ,desert-red :weight bold :inverse-video t))))
   `(git-gutter:modified ((t (:foreground ,desert-magenta :weight bold :inverse-video t))))
   `(git-gutter:unchanged ((t (:foreground ,desert-fg :weight bold :inverse-video t))))
;;;;; git-gutter-fr
   `(git-gutter-fr:added ((t (:foreground ,desert-green  :weight bold))))
   `(git-gutter-fr:deleted ((t (:foreground ,desert-red :weight bold))))
   `(git-gutter-fr:modified ((t (:foreground ,desert-magenta :weight bold))))
;;;;; git-rebase
   `(git-rebase-hash ((t (:foreground, desert-orange))))
;;;;; gnus
   `(gnus-group-mail-1 ((t (:weight bold :inherit gnus-group-mail-1-empty))))
   `(gnus-group-mail-1-empty ((t (:inherit gnus-group-news-1-empty))))
   `(gnus-group-mail-2 ((t (:weight bold :inherit gnus-group-mail-2-empty))))
   `(gnus-group-mail-2-empty ((t (:inherit gnus-group-news-2-empty))))
   `(gnus-group-mail-3 ((t (:weight bold :inherit gnus-group-mail-3-empty))))
   `(gnus-group-mail-3-empty ((t (:inherit gnus-group-news-3-empty))))
   `(gnus-group-mail-4 ((t (:weight bold :inherit gnus-group-mail-4-empty))))
   `(gnus-group-mail-4-empty ((t (:inherit gnus-group-news-4-empty))))
   `(gnus-group-mail-5 ((t (:weight bold :inherit gnus-group-mail-5-empty))))
   `(gnus-group-mail-5-empty ((t (:inherit gnus-group-news-5-empty))))
   `(gnus-group-mail-6 ((t (:weight bold :inherit gnus-group-mail-6-empty))))
   `(gnus-group-mail-6-empty ((t (:inherit gnus-group-news-6-empty))))
   `(gnus-group-mail-low ((t (:weight bold :inherit gnus-group-mail-low-empty))))
   `(gnus-group-mail-low-empty ((t (:inherit gnus-group-news-low-empty))))
   `(gnus-group-news-1 ((t (:weight bold :inherit gnus-group-news-1-empty))))
   `(gnus-group-news-2 ((t (:weight bold :inherit gnus-group-news-2-empty))))
   `(gnus-group-news-3 ((t (:weight bold :inherit gnus-group-news-3-empty))))
   `(gnus-group-news-4 ((t (:weight bold :inherit gnus-group-news-4-empty))))
   `(gnus-group-news-5 ((t (:weight bold :inherit gnus-group-news-5-empty))))
   `(gnus-group-news-6 ((t (:weight bold :inherit gnus-group-news-6-empty))))
   `(gnus-group-news-low ((t (:weight bold :inherit gnus-group-news-low-empty))))
   `(gnus-header-content ((t (:inherit message-header-other))))
   `(gnus-header-from ((t (:inherit message-header-to))))
   `(gnus-header-name ((t (:inherit message-header-name))))
   `(gnus-header-newsgroups ((t (:inherit message-header-other))))
   `(gnus-header-subject ((t (:inherit message-header-subject))))
   `(gnus-server-opened ((t (:foreground ,desert-green+2 :weight bold))))
   `(gnus-server-denied ((t (:foreground ,desert-red+1 :weight bold))))
   `(gnus-server-closed ((t (:foreground ,desert-blue :slant italic))))
   `(gnus-server-offline ((t (:foreground ,desert-yellow :weight bold))))
   `(gnus-server-agent ((t (:foreground ,desert-blue :weight bold))))
   `(gnus-summary-cancelled ((t (:foreground ,desert-orange))))
   `(gnus-summary-high-ancient ((t (:foreground ,desert-blue))))
   `(gnus-summary-high-read ((t (:foreground ,desert-green :weight bold))))
   `(gnus-summary-high-ticked ((t (:foreground ,desert-orange :weight bold))))
   `(gnus-summary-high-unread ((t (:foreground ,desert-fg :weight bold))))
   `(gnus-summary-low-ancient ((t (:foreground ,desert-blue))))
   `(gnus-summary-low-read ((t (:foreground ,desert-green))))
   `(gnus-summary-low-ticked ((t (:foreground ,desert-orange :weight bold))))
   `(gnus-summary-low-unread ((t (:foreground ,desert-fg))))
   `(gnus-summary-normal-ancient ((t (:foreground ,desert-blue))))
   `(gnus-summary-normal-read ((t (:foreground ,desert-green))))
   `(gnus-summary-normal-ticked ((t (:foreground ,desert-orange :weight bold))))
   `(gnus-summary-normal-unread ((t (:foreground ,desert-fg))))
   `(gnus-summary-selected ((t (:foreground ,desert-yellow :weight bold))))
   `(gnus-cite-1 ((t (:foreground ,desert-blue))))
   `(gnus-cite-10 ((t (:foreground ,desert-yellow-1))))
   `(gnus-cite-11 ((t (:foreground ,desert-yellow))))
   `(gnus-cite-2 ((t (:foreground ,desert-blue-1))))
   `(gnus-cite-3 ((t (:foreground ,desert-blue-2))))
   `(gnus-cite-4 ((t (:foreground ,desert-green+2))))
   `(gnus-cite-5 ((t (:foreground ,desert-green+1))))
   `(gnus-cite-6 ((t (:foreground ,desert-green))))
   `(gnus-cite-7 ((t (:foreground ,desert-red))))
   `(gnus-cite-8 ((t (:foreground ,desert-red-1))))
   `(gnus-cite-9 ((t (:foreground ,desert-red-2))))
   `(gnus-group-news-1-empty ((t (:foreground ,desert-yellow))))
   `(gnus-group-news-2-empty ((t (:foreground ,desert-green+3))))
   `(gnus-group-news-3-empty ((t (:foreground ,desert-green+1))))
   `(gnus-group-news-4-empty ((t (:foreground ,desert-blue-2))))
   `(gnus-group-news-5-empty ((t (:foreground ,desert-blue-3))))
   `(gnus-group-news-6-empty ((t (:foreground ,desert-bg+2))))
   `(gnus-group-news-low-empty ((t (:foreground ,desert-bg+2))))
   `(gnus-signature ((t (:foreground ,desert-yellow))))
   `(gnus-x ((t (:background ,desert-fg :foreground ,desert-bg))))
   `(mm-uu-extract ((t (:background ,desert-bg-05 :foreground ,desert-green+1))))
;;;;; go-guru
   `(go-guru-hl-identifier-face ((t (:foreground ,desert-bg-1 :background ,desert-green+1))))
;;;;; guide-key
   `(guide-key/highlight-command-face ((t (:foreground ,desert-blue))))
   `(guide-key/key-face ((t (:foreground ,desert-green))))
   `(guide-key/prefix-command-face ((t (:foreground ,desert-green+1))))
;;;;; hackernews
   '(hackernews-comment-count ((t (:inherit link-visited :underline nil))))
   '(hackernews-link          ((t (:inherit link         :underline nil))))
;;;;; helm
   `(helm-header
     ((t (:foreground ,desert-green
                      :background ,desert-bg
                      :underline nil
                      :box nil
                      :extend t))))
   `(helm-source-header
     ((t (:foreground ,desert-yellow
                      :background ,desert-bg-1
                      :underline nil
                      :weight bold
                      :box (:line-width -1 :style released-button)
                      :extend t))))
   `(helm-selection ((t (:background ,desert-bg+1 :underline nil))))
   `(helm-selection-line ((t (:background ,desert-bg+1))))
   `(helm-visible-mark ((t (:foreground ,desert-bg :background ,desert-yellow-2))))
   `(helm-candidate-number ((t (:foreground ,desert-green+4 :background ,desert-bg-1))))
   `(helm-separator ((t (:foreground ,desert-red :background ,desert-bg))))
   `(helm-time-zone-current ((t (:foreground ,desert-green+2 :background ,desert-bg))))
   `(helm-time-zone-home ((t (:foreground ,desert-red :background ,desert-bg))))
   `(helm-bookmark-addressbook ((t (:foreground ,desert-orange :background ,desert-bg))))
   `(helm-bookmark-directory ((t (:foreground nil :background nil :inherit helm-ff-directory))))
   `(helm-bookmark-file ((t (:foreground nil :background nil :inherit helm-ff-file))))
   `(helm-bookmark-gnus ((t (:foreground ,desert-magenta :background ,desert-bg))))
   `(helm-bookmark-info ((t (:foreground ,desert-green+2 :background ,desert-bg))))
   `(helm-bookmark-man ((t (:foreground ,desert-yellow :background ,desert-bg))))
   `(helm-bookmark-w3m ((t (:foreground ,desert-magenta :background ,desert-bg))))
   `(helm-buffer-not-saved ((t (:foreground ,desert-red :background ,desert-bg))))
   `(helm-buffer-process ((t (:foreground ,desert-cyan :background ,desert-bg))))
   `(helm-buffer-saved-out ((t (:foreground ,desert-fg :background ,desert-bg))))
   `(helm-buffer-size ((t (:foreground ,desert-fg-1 :background ,desert-bg))))
   `(helm-ff-directory ((t (:foreground ,desert-cyan :background ,desert-bg :weight bold))))
   `(helm-ff-file ((t (:foreground ,desert-fg :background ,desert-bg :weight normal))))
   `(helm-ff-file-extension ((t (:foreground ,desert-fg :background ,desert-bg :weight normal))))
   `(helm-ff-executable ((t (:foreground ,desert-green+2 :background ,desert-bg :weight normal))))
   `(helm-ff-invalid-symlink ((t (:foreground ,desert-red :background ,desert-bg :weight bold))))
   `(helm-ff-symlink ((t (:foreground ,desert-yellow :background ,desert-bg :weight bold))))
   `(helm-ff-prefix ((t (:foreground ,desert-bg :background ,desert-yellow :weight normal))))
   `(helm-grep-cmd-line ((t (:foreground ,desert-cyan :background ,desert-bg))))
   `(helm-grep-file ((t (:foreground ,desert-fg :background ,desert-bg))))
   `(helm-grep-finish ((t (:foreground ,desert-green+2 :background ,desert-bg))))
   `(helm-grep-lineno ((t (:foreground ,desert-fg-1 :background ,desert-bg))))
   `(helm-grep-match ((t (:foreground nil :background nil :inherit helm-match))))
   `(helm-grep-running ((t (:foreground ,desert-red :background ,desert-bg))))
   `(helm-match ((t (:foreground ,desert-orange :background ,desert-bg-1 :weight bold))))
   `(helm-moccur-buffer ((t (:foreground ,desert-cyan :background ,desert-bg))))
   `(helm-mu-contacts-address-face ((t (:foreground ,desert-fg-1 :background ,desert-bg))))
   `(helm-mu-contacts-name-face ((t (:foreground ,desert-fg :background ,desert-bg))))
;;;;; helm-lxc
   `(helm-lxc-face-frozen ((t (:foreground ,desert-blue :background ,desert-bg))))
   `(helm-lxc-face-running ((t (:foreground ,desert-green :background ,desert-bg))))
   `(helm-lxc-face-stopped ((t (:foreground ,desert-red :background ,desert-bg))))
;;;;; helm-swoop
   `(helm-swoop-target-line-face ((t (:foreground ,desert-fg :background ,desert-bg+1))))
   `(helm-swoop-target-word-face ((t (:foreground ,desert-yellow :background ,desert-bg+2 :weight bold))))
;;;;; highlight-numbers
   `(highlight-numbers-number ((t (:foreground ,desert-blue))))
;;;;; highlight-symbol
   `(highlight-symbol-face ((t (:background ,desert-bg+2))))
;;;;; highlight-thing
   `(highlight-thing ((t (:background ,desert-bg+2))))
;;;;; hl-line-mode
   `(hl-line-face ((,class (:background ,desert-bg-05))
                   (t :weight bold)))
   `(hl-line ((,class (:background ,desert-bg-05 :extend t)) ; old emacsen
              (t :weight bold)))
;;;;; hl-sexp
   `(hl-sexp-face ((,class (:background ,desert-bg+1))
                   (t :weight bold)))
;;;;; hydra
   `(hydra-face-red ((t (:foreground ,desert-red-1 :background ,desert-bg))))
   `(hydra-face-amaranth ((t (:foreground ,desert-red-3 :background ,desert-bg))))
   `(hydra-face-blue ((t (:foreground ,desert-blue :background ,desert-bg))))
   `(hydra-face-pink ((t (:foreground ,desert-magenta :background ,desert-bg))))
   `(hydra-face-teal ((t (:foreground ,desert-cyan :background ,desert-bg))))
;;;;; info+
   `(info-command-ref-item ((t (:background ,desert-bg-1 :foreground ,desert-orange))))
   `(info-constant-ref-item ((t (:background ,desert-bg-1 :foreground ,desert-magenta))))
   `(info-double-quoted-name ((t (:inherit font-lock-comment-face))))
   `(info-file ((t (:background ,desert-bg-1 :foreground ,desert-yellow))))
   `(info-function-ref-item ((t (:background ,desert-bg-1 :inherit font-lock-function-name-face))))
   `(info-macro-ref-item ((t (:background ,desert-bg-1 :foreground ,desert-yellow))))
   `(info-menu ((t (:foreground ,desert-yellow))))
   `(info-quoted-name ((t (:inherit font-lock-constant-face))))
   `(info-reference-item ((t (:background ,desert-bg-1))))
   `(info-single-quote ((t (:inherit font-lock-keyword-face))))
   `(info-special-form-ref-item ((t (:background ,desert-bg-1 :foreground ,desert-yellow))))
   `(info-string ((t (:inherit font-lock-string-face))))
   `(info-syntax-class-item ((t (:background ,desert-bg-1 :foreground ,desert-blue+1))))
   `(info-user-option-ref-item ((t (:background ,desert-bg-1 :foreground ,desert-red))))
   `(info-variable-ref-item ((t (:background ,desert-bg-1 :foreground ,desert-orange))))
;;;;; irfc
   `(irfc-head-name-face ((t (:foreground ,desert-red :weight bold))))
   `(irfc-head-number-face ((t (:foreground ,desert-red :weight bold))))
   `(irfc-reference-face ((t (:foreground ,desert-blue-1 :weight bold))))
   `(irfc-requirement-keyword-face ((t (:inherit font-lock-keyword-face))))
   `(irfc-rfc-link-face ((t (:inherit link))))
   `(irfc-rfc-number-face ((t (:foreground ,desert-cyan :weight bold))))
   `(irfc-std-number-face ((t (:foreground ,desert-green+4 :weight bold))))
   `(irfc-table-item-face ((t (:foreground ,desert-green+3))))
   `(irfc-title-face ((t (:foreground ,desert-yellow
                                      :underline t :weight bold))))
;;;;; ivy
   `(ivy-confirm-face ((t (:foreground ,desert-green :background ,desert-bg))))
   `(ivy-current-match ((t (:foreground ,desert-yellow :weight bold :underline t))))
   `(ivy-cursor ((t (:foreground ,desert-bg :background ,desert-fg))))
   `(ivy-match-required-face ((t (:foreground ,desert-red :background ,desert-bg))))
   `(ivy-minibuffer-match-face-1 ((t (:background ,desert-bg+1))))
   `(ivy-minibuffer-match-face-2 ((t (:background ,desert-green-2))))
   `(ivy-minibuffer-match-face-3 ((t (:background ,desert-green))))
   `(ivy-minibuffer-match-face-4 ((t (:background ,desert-green+1))))
   `(ivy-remote ((t (:foreground ,desert-blue :background ,desert-bg))))
   `(ivy-subdir ((t (:foreground ,desert-yellow :background ,desert-bg))))
;;;;; ido-mode
   `(ido-first-match ((t (:foreground ,desert-yellow :weight bold))))
   `(ido-only-match ((t (:foreground ,desert-orange :weight bold))))
   `(ido-subdir ((t (:foreground ,desert-yellow))))
   `(ido-indicator ((t (:foreground ,desert-yellow :background ,desert-red-4))))
;;;;; iedit-mode
   `(iedit-occurrence ((t (:background ,desert-bg+2 :weight bold))))
;;;;; jabber-mode
   `(jabber-roster-user-away ((t (:foreground ,desert-green+2))))
   `(jabber-roster-user-online ((t (:foreground ,desert-blue-1))))
   `(jabber-roster-user-dnd ((t (:foreground ,desert-red+1))))
   `(jabber-roster-user-xa ((t (:foreground ,desert-magenta))))
   `(jabber-roster-user-chatty ((t (:foreground ,desert-orange))))
   `(jabber-roster-user-error ((t (:foreground ,desert-red+1))))
   `(jabber-rare-time-face ((t (:foreground ,desert-green+1))))
   `(jabber-chat-prompt-local ((t (:foreground ,desert-blue-1))))
   `(jabber-chat-prompt-foreign ((t (:foreground ,desert-red+1))))
   `(jabber-chat-prompt-system ((t (:foreground ,desert-green+3))))
   `(jabber-activity-face((t (:foreground ,desert-red+1))))
   `(jabber-activity-personal-face ((t (:foreground ,desert-blue+1))))
   `(jabber-title-small ((t (:height 1.1 :weight bold))))
   `(jabber-title-medium ((t (:height 1.2 :weight bold))))
   `(jabber-title-large ((t (:height 1.3 :weight bold))))
;;;;; js2-mode
   `(js2-warning ((t (:underline ,desert-orange))))
   `(js2-error ((t (:foreground ,desert-red :weight bold))))
   `(js2-jsdoc-tag ((t (:foreground ,desert-green-2))))
   `(js2-jsdoc-type ((t (:foreground ,desert-green+2))))
   `(js2-jsdoc-value ((t (:foreground ,desert-green+3))))
   `(js2-function-param ((t (:foreground, desert-orange))))
   `(js2-external-variable ((t (:foreground ,desert-orange))))
;;;;; additional js2 mode attributes for better syntax highlighting
   `(js2-instance-member ((t (:foreground ,desert-green-2))))
   `(js2-jsdoc-html-tag-delimiter ((t (:foreground ,desert-orange))))
   `(js2-jsdoc-html-tag-name ((t (:foreground ,desert-red-1))))
   `(js2-object-property ((t (:foreground ,desert-blue+1))))
   `(js2-magic-paren ((t (:foreground ,desert-blue-5))))
   `(js2-private-function-call ((t (:foreground ,desert-cyan))))
   `(js2-function-call ((t (:foreground ,desert-cyan))))
   `(js2-private-member ((t (:foreground ,desert-blue-1))))
   `(js2-keywords ((t (:foreground ,desert-magenta))))
;;;;; ledger-mode
   `(ledger-font-payee-uncleared-face ((t (:foreground ,desert-red-1 :weight bold))))
   `(ledger-font-payee-cleared-face ((t (:foreground ,desert-fg :weight normal))))
   `(ledger-font-payee-pending-face ((t (:foreground ,desert-red :weight normal))))
   `(ledger-font-xact-highlight-face ((t (:background ,desert-bg+1))))
   `(ledger-font-auto-xact-face ((t (:foreground ,desert-yellow-1 :weight normal))))
   `(ledger-font-periodic-xact-face ((t (:foreground ,desert-green :weight normal))))
   `(ledger-font-pending-face ((t (:foreground ,desert-orange weight: normal))))
   `(ledger-font-other-face ((t (:foreground ,desert-fg))))
   `(ledger-font-posting-date-face ((t (:foreground ,desert-orange :weight normal))))
   `(ledger-font-posting-account-face ((t (:foreground ,desert-blue-1))))
   `(ledger-font-posting-account-cleared-face ((t (:foreground ,desert-fg))))
   `(ledger-font-posting-account-pending-face ((t (:foreground ,desert-orange))))
   `(ledger-font-posting-amount-face ((t (:foreground ,desert-orange))))
   `(ledger-occur-narrowed-face ((t (:foreground ,desert-fg-1 :invisible t))))
   `(ledger-occur-xact-face ((t (:background ,desert-bg+1))))
   `(ledger-font-comment-face ((t (:foreground ,desert-green))))
   `(ledger-font-reconciler-uncleared-face ((t (:foreground ,desert-red-1 :weight bold))))
   `(ledger-font-reconciler-cleared-face ((t (:foreground ,desert-fg :weight normal))))
   `(ledger-font-reconciler-pending-face ((t (:foreground ,desert-orange :weight normal))))
   `(ledger-font-report-clickable-face ((t (:foreground ,desert-orange :weight normal))))
;;;;; linum-mode
   `(linum ((t (:foreground ,desert-green+2 :background ,desert-bg))))
;;;;; lispy
   `(lispy-command-name-face ((t (:background ,desert-bg-05 :inherit font-lock-function-name-face))))
   `(lispy-cursor-face ((t (:foreground ,desert-bg :background ,desert-fg))))
   `(lispy-face-hint ((t (:inherit highlight :foreground ,desert-yellow))))
;;;;; ruler-mode
   `(ruler-mode-column-number ((t (:inherit 'ruler-mode-default :foreground ,desert-fg))))
   `(ruler-mode-fill-column ((t (:inherit 'ruler-mode-default :foreground ,desert-yellow))))
   `(ruler-mode-goal-column ((t (:inherit 'ruler-mode-fill-column))))
   `(ruler-mode-comment-column ((t (:inherit 'ruler-mode-fill-column))))
   `(ruler-mode-tab-stop ((t (:inherit 'ruler-mode-fill-column))))
   `(ruler-mode-current-column ((t (:foreground ,desert-yellow :box t))))
   `(ruler-mode-default ((t (:foreground ,desert-green+2 :background ,desert-bg))))

;;;;; lui
   `(lui-time-stamp-face ((t (:foreground ,desert-blue-1))))
   `(lui-hilight-face ((t (:foreground ,desert-green+2 :background ,desert-bg))))
   `(lui-button-face ((t (:inherit hover-highlight))))
;;;;; macrostep
   `(macrostep-gensym-1
     ((t (:foreground ,desert-green+2 :background ,desert-bg-1))))
   `(macrostep-gensym-2
     ((t (:foreground ,desert-red+1 :background ,desert-bg-1))))
   `(macrostep-gensym-3
     ((t (:foreground ,desert-blue+1 :background ,desert-bg-1))))
   `(macrostep-gensym-4
     ((t (:foreground ,desert-magenta :background ,desert-bg-1))))
   `(macrostep-gensym-5
     ((t (:foreground ,desert-yellow :background ,desert-bg-1))))
   `(macrostep-expansion-highlight-face
     ((t (:inherit highlight))))
   `(macrostep-macro-face
     ((t (:underline t))))
;;;;; magit
;;;;;; headings and diffs
   ;; Please read (info "(magit)Theming Faces") before changing this.
   `(magit-section-highlight           ((t (:background ,desert-bg+05))))
   `(magit-section-heading             ((t (:foreground ,desert-yellow :weight bold))))
   `(magit-section-heading-selection   ((t (:foreground ,desert-orange :weight bold))))
   `(magit-diff-file-heading           ((t (:weight bold))))
   `(magit-diff-file-heading-highlight ((t (:background ,desert-bg+05 :weight bold))))
   `(magit-diff-file-heading-selection ((t (:background ,desert-bg+05 :weight bold
                                                        :foreground ,desert-orange))))
   `(magit-diff-added                  ((t (:background ,desert-green-2))))
   `(magit-diff-added-highlight        ((t (:background ,desert-green))))
   `(magit-diff-removed                ((t (:background ,desert-red-4))))
   `(magit-diff-removed-highlight      ((t (:background ,desert-red-3))))
   `(magit-diff-hunk-heading           ((t (:background ,desert-bg+1))))
   `(magit-diff-hunk-heading-highlight ((t (:background ,desert-bg+2))))
   `(magit-diff-hunk-heading-selection ((t (:background ,desert-bg+2
                                                        :foreground ,desert-orange))))
   `(magit-diff-lines-heading          ((t (:background ,desert-orange
                                                        :foreground ,desert-bg+2))))
   `(magit-diff-context-highlight      ((t (:background ,desert-bg+05
                                                        :foreground "grey70"))))
   `(magit-diffstat-added              ((t (:foreground ,desert-green+4))))
   `(magit-diffstat-removed            ((t (:foreground ,desert-red))))
;;;;;; popup
   `(magit-popup-heading             ((t (:foreground ,desert-yellow  :weight bold))))
   `(magit-popup-key                 ((t (:foreground ,desert-green-2 :weight bold))))
   `(magit-popup-argument            ((t (:foreground ,desert-green   :weight bold))))
   `(magit-popup-disabled-argument   ((t (:foreground ,desert-fg-1    :weight normal))))
   `(magit-popup-option-value        ((t (:foreground ,desert-blue-2  :weight bold))))
;;;;;; process
   `(magit-process-ok    ((t (:foreground ,desert-green  :weight bold))))
   `(magit-process-ng    ((t (:foreground ,desert-red    :weight bold))))
;;;;;; log
   `(magit-log-author    ((t (:foreground ,desert-orange))))
   `(magit-log-date      ((t (:foreground ,desert-fg-1))))
   `(magit-log-graph     ((t (:foreground ,desert-fg+1))))
;;;;;; sequence
   `(magit-sequence-pick ((t (:foreground ,desert-yellow-2))))
   `(magit-sequence-stop ((t (:foreground ,desert-green))))
   `(magit-sequence-part ((t (:foreground ,desert-yellow))))
   `(magit-sequence-head ((t (:foreground ,desert-blue))))
   `(magit-sequence-drop ((t (:foreground ,desert-red))))
   `(magit-sequence-done ((t (:foreground ,desert-fg-1))))
   `(magit-sequence-onto ((t (:foreground ,desert-fg-1))))
;;;;;; bisect
   `(magit-bisect-good ((t (:foreground ,desert-green))))
   `(magit-bisect-skip ((t (:foreground ,desert-yellow))))
   `(magit-bisect-bad  ((t (:foreground ,desert-red))))
;;;;;; blame
   `(magit-blame-heading ((t (:background ,desert-bg-1 :foreground ,desert-blue-2))))
   `(magit-blame-hash    ((t (:background ,desert-bg-1 :foreground ,desert-blue-2))))
   `(magit-blame-name    ((t (:background ,desert-bg-1 :foreground ,desert-orange))))
   `(magit-blame-date    ((t (:background ,desert-bg-1 :foreground ,desert-orange))))
   `(magit-blame-summary ((t (:background ,desert-bg-1 :foreground ,desert-blue-2
                                          :weight bold))))
;;;;;; references etc
   `(magit-dimmed         ((t (:foreground ,desert-bg+3))))
   `(magit-hash           ((t (:foreground ,desert-bg+3))))
   `(magit-tag            ((t (:foreground ,desert-orange :weight bold))))
   `(magit-branch-remote  ((t (:foreground ,desert-green  :weight bold))))
   `(magit-branch-local   ((t (:foreground ,desert-blue   :weight bold))))
   `(magit-branch-current ((t (:foreground ,desert-blue   :weight bold :box t))))
   `(magit-head           ((t (:foreground ,desert-blue   :weight bold))))
   `(magit-refname        ((t (:background ,desert-bg+2 :foreground ,desert-fg :weight bold))))
   `(magit-refname-stash  ((t (:background ,desert-bg+2 :foreground ,desert-fg :weight bold))))
   `(magit-refname-wip    ((t (:background ,desert-bg+2 :foreground ,desert-fg :weight bold))))
   `(magit-signature-good      ((t (:foreground ,desert-green))))
   `(magit-signature-bad       ((t (:foreground ,desert-red))))
   `(magit-signature-untrusted ((t (:foreground ,desert-yellow))))
   `(magit-signature-expired   ((t (:foreground ,desert-orange))))
   `(magit-signature-revoked   ((t (:foreground ,desert-magenta))))
   '(magit-signature-error     ((t (:inherit    magit-signature-bad))))
   `(magit-cherry-unmatched    ((t (:foreground ,desert-cyan))))
   `(magit-cherry-equivalent   ((t (:foreground ,desert-magenta))))
   `(magit-reflog-commit       ((t (:foreground ,desert-green))))
   `(magit-reflog-amend        ((t (:foreground ,desert-magenta))))
   `(magit-reflog-merge        ((t (:foreground ,desert-green))))
   `(magit-reflog-checkout     ((t (:foreground ,desert-blue))))
   `(magit-reflog-reset        ((t (:foreground ,desert-red))))
   `(magit-reflog-rebase       ((t (:foreground ,desert-magenta))))
   `(magit-reflog-cherry-pick  ((t (:foreground ,desert-green))))
   `(magit-reflog-remote       ((t (:foreground ,desert-cyan))))
   `(magit-reflog-other        ((t (:foreground ,desert-cyan))))
;;;;; markup-faces
   `(markup-anchor-face ((t (:foreground ,desert-blue+1))))
   `(markup-code-face ((t (:inherit font-lock-constant-face))))
   `(markup-command-face ((t (:foreground ,desert-yellow))))
   `(markup-emphasis-face ((t (:inherit bold))))
   `(markup-internal-reference-face ((t (:foreground ,desert-yellow-2 :underline t))))
   `(markup-list-face ((t (:foreground ,desert-fg+1))))
   `(markup-meta-face ((t (:foreground ,desert-yellow))))
   `(markup-meta-hide-face ((t (:foreground ,desert-yellow))))
   `(markup-secondary-text-face ((t (:foreground ,desert-yellow-1))))
   `(markup-title-0-face ((t (:inherit font-lock-function-name-face :weight bold))))
   `(markup-title-1-face ((t (:inherit font-lock-function-name-face :weight bold))))
   `(markup-title-2-face ((t (:inherit font-lock-function-name-face :weight bold))))
   `(markup-title-3-face ((t (:inherit font-lock-function-name-face :weight bold))))
   `(markup-title-4-face ((t (:inherit font-lock-function-name-face :weight bold))))
   `(markup-typewriter-face ((t (:inherit font-lock-constant-face))))
   `(markup-verbatim-face ((t (:inherit font-lock-constant-face))))
   `(markup-value-face ((t (:foreground ,desert-yellow))))
;;;;; message-mode
   `(message-cited-text ((t (:inherit font-lock-comment-face))))
   `(message-header-name ((t (:foreground ,desert-green+1))))
   `(message-header-other ((t (:foreground ,desert-green))))
   `(message-header-to ((t (:foreground ,desert-yellow :weight bold))))
   `(message-header-cc ((t (:foreground ,desert-yellow :weight bold))))
   `(message-header-newsgroups ((t (:foreground ,desert-yellow :weight bold))))
   `(message-header-subject ((t (:foreground ,desert-orange :weight bold))))
   `(message-header-xheader ((t (:foreground ,desert-green))))
   `(message-mml ((t (:foreground ,desert-yellow :weight bold))))
   `(message-separator ((t (:inherit font-lock-comment-face))))
;;;;; mew
   `(mew-face-header-subject ((t (:foreground ,desert-orange))))
   `(mew-face-header-from ((t (:foreground ,desert-yellow))))
   `(mew-face-header-date ((t (:foreground ,desert-green))))
   `(mew-face-header-to ((t (:foreground ,desert-red))))
   `(mew-face-header-key ((t (:foreground ,desert-green))))
   `(mew-face-header-private ((t (:foreground ,desert-green))))
   `(mew-face-header-important ((t (:foreground ,desert-blue))))
   `(mew-face-header-marginal ((t (:foreground ,desert-fg :weight bold))))
   `(mew-face-header-warning ((t (:foreground ,desert-red))))
   `(mew-face-header-xmew ((t (:foreground ,desert-green))))
   `(mew-face-header-xmew-bad ((t (:foreground ,desert-red))))
   `(mew-face-body-url ((t (:foreground ,desert-orange))))
   `(mew-face-body-comment ((t (:foreground ,desert-fg :slant italic))))
   `(mew-face-body-cite1 ((t (:foreground ,desert-green))))
   `(mew-face-body-cite2 ((t (:foreground ,desert-blue))))
   `(mew-face-body-cite3 ((t (:foreground ,desert-orange))))
   `(mew-face-body-cite4 ((t (:foreground ,desert-yellow))))
   `(mew-face-body-cite5 ((t (:foreground ,desert-red))))
   `(mew-face-mark-review ((t (:foreground ,desert-blue))))
   `(mew-face-mark-escape ((t (:foreground ,desert-green))))
   `(mew-face-mark-delete ((t (:foreground ,desert-red))))
   `(mew-face-mark-unlink ((t (:foreground ,desert-yellow))))
   `(mew-face-mark-refile ((t (:foreground ,desert-green))))
   `(mew-face-mark-unread ((t (:foreground ,desert-red-2))))
   `(mew-face-eof-message ((t (:foreground ,desert-green))))
   `(mew-face-eof-part ((t (:foreground ,desert-yellow))))
;;;;; mic-paren
   `(paren-face-match ((t (:foreground ,desert-cyan :background ,desert-bg :weight bold))))
   `(paren-face-mismatch ((t (:foreground ,desert-bg :background ,desert-magenta :weight bold))))
   `(paren-face-no-match ((t (:foreground ,desert-bg :background ,desert-red :weight bold))))
;;;;; mingus
   `(mingus-directory-face ((t (:foreground ,desert-blue))))
   `(mingus-pausing-face ((t (:foreground ,desert-magenta))))
   `(mingus-playing-face ((t (:foreground ,desert-cyan))))
   `(mingus-playlist-face ((t (:foreground ,desert-cyan ))))
   `(mingus-mark-face ((t (:bold t :foreground ,desert-magenta))))
   `(mingus-song-file-face ((t (:foreground ,desert-yellow))))
   `(mingus-artist-face ((t (:foreground ,desert-cyan))))
   `(mingus-album-face ((t (:underline t :foreground ,desert-red+1))))
   `(mingus-album-stale-face ((t (:foreground ,desert-red+1))))
   `(mingus-stopped-face ((t (:foreground ,desert-red))))
;;;;; nav
   `(nav-face-heading ((t (:foreground ,desert-yellow))))
   `(nav-face-button-num ((t (:foreground ,desert-cyan))))
   `(nav-face-dir ((t (:foreground ,desert-green))))
   `(nav-face-hdir ((t (:foreground ,desert-red))))
   `(nav-face-file ((t (:foreground ,desert-fg))))
   `(nav-face-hfile ((t (:foreground ,desert-red-4))))
;;;;; merlin
   `(merlin-type-face ((t (:inherit highlight))))
   `(merlin-compilation-warning-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,desert-orange)))
      (t
       (:underline ,desert-orange))))
   `(merlin-compilation-error-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,desert-red)))
      (t
       (:underline ,desert-red))))
;;;;; mu4e
   `(mu4e-cited-1-face ((t (:foreground ,desert-blue    :slant italic))))
   `(mu4e-cited-2-face ((t (:foreground ,desert-green+2 :slant italic))))
   `(mu4e-cited-3-face ((t (:foreground ,desert-blue-2  :slant italic))))
   `(mu4e-cited-4-face ((t (:foreground ,desert-green   :slant italic))))
   `(mu4e-cited-5-face ((t (:foreground ,desert-blue-4  :slant italic))))
   `(mu4e-cited-6-face ((t (:foreground ,desert-green-2 :slant italic))))
   `(mu4e-cited-7-face ((t (:foreground ,desert-blue    :slant italic))))
   `(mu4e-replied-face ((t (:foreground ,desert-bg+3))))
   `(mu4e-trashed-face ((t (:foreground ,desert-bg+3 :strike-through t))))
;;;;; mumamo
   `(mumamo-background-chunk-major ((t (:background nil))))
   `(mumamo-background-chunk-submode1 ((t (:background ,desert-bg-1))))
   `(mumamo-background-chunk-submode2 ((t (:background ,desert-bg+2))))
   `(mumamo-background-chunk-submode3 ((t (:background ,desert-bg+3))))
   `(mumamo-background-chunk-submode4 ((t (:background ,desert-bg+1))))
;;;;; neotree
   `(neo-banner-face ((t (:foreground ,desert-blue+1 :weight bold))))
   `(neo-header-face ((t (:foreground ,desert-fg))))
   `(neo-root-dir-face ((t (:foreground ,desert-blue+1 :weight bold))))
   `(neo-dir-link-face ((t (:foreground ,desert-blue))))
   `(neo-file-link-face ((t (:foreground ,desert-fg))))
   `(neo-expand-btn-face ((t (:foreground ,desert-blue))))
   `(neo-vc-default-face ((t (:foreground ,desert-fg+1))))
   `(neo-vc-user-face ((t (:foreground ,desert-red :slant italic))))
   `(neo-vc-up-to-date-face ((t (:foreground ,desert-fg))))
   `(neo-vc-edited-face ((t (:foreground ,desert-magenta))))
   `(neo-vc-needs-merge-face ((t (:foreground ,desert-red+1))))
   `(neo-vc-unlocked-changes-face ((t (:foreground ,desert-red :background ,desert-blue-5))))
   `(neo-vc-added-face ((t (:foreground ,desert-green+1))))
   `(neo-vc-conflict-face ((t (:foreground ,desert-red+1))))
   `(neo-vc-missing-face ((t (:foreground ,desert-red+1))))
   `(neo-vc-ignored-face ((t (:foreground ,desert-fg-1))))
;;;;; notmuch
   `(notmuch-crypto-decryption ((t (:foreground ,desert-bg :background ,desert-magenta))))
   `(notmuch-crypto-part-header ((t (:foreground ,desert-blue+1))))
   `(notmuch-crypto-signature-bad ((t (:foreground ,desert-bg :background ,desert-red))))
   `(notmuch-crypto-signature-good ((t (:foreground ,desert-bg :background ,desert-green+1))))
   `(notmuch-crypto-signature-good-key ((t (:foreground ,desert-bg :background ,desert-orange))))
   `(notmuch-crypto-signature-unknown ((t (:foreground ,desert-bg :background ,desert-red))))
   `(notmuch-hello-logo-background ((t (:background ,desert-bg+2))))
   `(notmuch-message-summary-face ((t (:background ,desert-bg-08))))
   `(notmuch-search-flagged-face ((t (:foreground ,desert-blue+1))))
   `(notmuch-search-non-matching-authors ((t (:foreground ,desert-fg-1))))
   `(notmuch-tag-added ((t (:underline ,desert-green+1))))
   `(notmuch-tag-deleted ((t (:strike-through ,desert-red))))
   `(notmuch-tag-face ((t (:foreground ,desert-green+1))))
   `(notmuch-tag-flagged ((t (:foreground ,desert-blue+1))))
   `(notmuch-tag-unread ((t (:foreground ,desert-red))))
   `(notmuch-tree-match-author-face ((t (:foreground ,desert-green+1))))
   `(notmuch-tree-match-tag-face ((t (:foreground ,desert-green+1))))
;;;;; orderless
   `(orderless-match-face-0 ((t (:foreground ,desert-green))))
   `(orderless-match-face-1 ((t (:foreground ,desert-magenta))))
   `(orderless-match-face-2 ((t (:foreground ,desert-blue))))
   `(orderless-match-face-3 ((t (:foreground ,desert-orange))))
;;;;; org-mode
   `(org-agenda-date-today
     ((t (:foreground ,desert-fg+1 :slant italic :weight bold))) t)
   `(org-agenda-structure
     ((t (:inherit font-lock-comment-face))))
   `(org-archived ((t (:foreground ,desert-fg :weight bold))))
   `(org-block ((t (:background ,desert-bg+05 :extend t))))
   `(org-checkbox ((t (:background ,desert-bg+2 :foreground ,desert-fg+1
                                   :box (:line-width 1 :style released-button)))))
   `(org-date ((t (:foreground ,desert-blue :underline t))))
   `(org-deadline-announce ((t (:foreground ,desert-red-1))))
   `(org-done ((t (:weight bold :weight bold :foreground ,desert-green+3))))
   `(org-formula ((t (:foreground ,desert-yellow-2))))
   `(org-headline-done ((t (:foreground ,desert-green+3))))
   `(org-hide ((t (:foreground ,desert-bg))))
   `(org-level-1 ((t (:inherit ,z-variable-pitch :foreground ,desert-orange
                               ,@(when desert-scale-org-headlines
                                   (list :height desert-height-plus-4))))))
   `(org-level-2 ((t (:inherit ,z-variable-pitch :foreground ,desert-green+4
                               ,@(when desert-scale-org-headlines
                                   (list :height desert-height-plus-3))))))
   `(org-level-3 ((t (:inherit ,z-variable-pitch :foreground ,desert-blue-1
                               ,@(when desert-scale-org-headlines
                                   (list :height desert-height-plus-2))))))
   `(org-level-4 ((t (:inherit ,z-variable-pitch :foreground ,desert-yellow-2
                               ,@(when desert-scale-org-headlines
                                   (list :height desert-height-plus-1))))))
   `(org-level-5 ((t (:inherit ,z-variable-pitch :foreground ,desert-cyan))))
   `(org-level-6 ((t (:inherit ,z-variable-pitch :foreground ,desert-green+2))))
   `(org-level-7 ((t (:inherit ,z-variable-pitch :foreground ,desert-red+2))))
   `(org-level-8 ((t (:inherit ,z-variable-pitch :foreground ,desert-magenta))))
   `(org-link ((t (:foreground ,desert-yellow-2 :underline t))))
   `(org-quote ((t (:background ,desert-bg+05 :extend t))))
   `(org-scheduled ((t (:foreground ,desert-green+4))))
   `(org-scheduled-previously ((t (:foreground ,desert-red))))
   `(org-scheduled-today ((t (:foreground ,desert-blue+1))))
   `(org-sexp-date ((t (:foreground ,desert-blue+1 :underline t))))
   `(org-special-keyword ((t (:inherit font-lock-comment-face))))
   `(org-table ((t (:foreground ,desert-green+2))))
   `(org-tag ((t (:weight bold :weight bold))))
   `(org-time-grid ((t (:foreground ,desert-orange))))
   `(org-todo ((t (:weight bold :foreground ,desert-red :weight bold))))
   `(org-upcoming-deadline ((t (:inherit font-lock-keyword-face))))
   `(org-warning ((t (:weight bold :foreground ,desert-red :weight bold :underline nil))))
   `(org-column ((t (:background ,desert-bg-1))))
   `(org-column-title ((t (:background ,desert-bg-1 :underline t :weight bold))))
   `(org-mode-line-clock ((t (:foreground ,desert-fg :background ,desert-bg-1))))
   `(org-mode-line-clock-overrun ((t (:foreground ,desert-bg :background ,desert-red-1))))
   `(org-ellipsis ((t (:foreground ,desert-yellow-1 :underline t))))
   `(org-footnote ((t (:foreground ,desert-cyan :underline t))))
   `(org-document-title ((t (:inherit ,z-variable-pitch :foreground ,desert-blue
                                      :weight bold
                                      ,@(when desert-scale-org-headlines
                                          (list :height desert-height-plus-4))))))
   `(org-document-info ((t (:foreground ,desert-blue))))
   `(org-habit-ready-face ((t :background ,desert-green)))
   `(org-habit-alert-face ((t :background ,desert-yellow-1 :foreground ,desert-bg)))
   `(org-habit-clear-face ((t :background ,desert-blue-3)))
   `(org-habit-overdue-face ((t :background ,desert-red-3)))
   `(org-habit-clear-future-face ((t :background ,desert-blue-4)))
   `(org-habit-ready-future-face ((t :background ,desert-green-2)))
   `(org-habit-alert-future-face ((t :background ,desert-yellow-2 :foreground ,desert-bg)))
   `(org-habit-overdue-future-face ((t :background ,desert-red-4)))
;;;;; org-ref
   `(org-ref-ref-face ((t :underline t)))
   `(org-ref-label-face ((t :underline t)))
   `(org-ref-cite-face ((t :underline t)))
   `(org-ref-glossary-face ((t :underline t)))
   `(org-ref-acronym-face ((t :underline t)))
;;;;; outline
   `(outline-1 ((t (:inherit ,z-variable-pitch :foreground ,desert-orange
                             ,@(when desert-scale-outline-headlines
                                 (list :height desert-height-plus-4))))))
   `(outline-2 ((t (:inherit ,z-variable-pitch :foreground ,desert-green+4
                             ,@(when desert-scale-outline-headlines
                                 (list :height desert-height-plus-3))))))
   `(outline-3 ((t (:inherit ,z-variable-pitch :foreground ,desert-blue-1
                             ,@(when desert-scale-outline-headlines
                                 (list :height desert-height-plus-2))))))
   `(outline-4 ((t (:inherit ,z-variable-pitch :foreground ,desert-yellow-2
                             ,@(when desert-scale-outline-headlines
                                 (list :height desert-height-plus-1))))))
   `(outline-5 ((t (:inherit ,z-variable-pitch :foreground ,desert-cyan))))
   `(outline-6 ((t (:inherit ,z-variable-pitch :foreground ,desert-green+2))))
   `(outline-7 ((t (:inherit ,z-variable-pitch :foreground ,desert-red-4))))
   `(outline-8 ((t (:inherit ,z-variable-pitch :foreground ,desert-blue-4))))
;;;;; p4
   `(p4-depot-added-face ((t :inherit diff-added)))
   `(p4-depot-branch-op-face ((t :inherit diff-changed)))
   `(p4-depot-deleted-face ((t :inherit diff-removed)))
   `(p4-depot-unmapped-face ((t :inherit diff-changed)))
   `(p4-diff-change-face ((t :inherit diff-changed)))
   `(p4-diff-del-face ((t :inherit diff-removed)))
   `(p4-diff-file-face ((t :inherit diff-file-header)))
   `(p4-diff-head-face ((t :inherit diff-header)))
   `(p4-diff-ins-face ((t :inherit diff-added)))
;;;;; c/perl
   `(cperl-nonoverridable-face ((t (:foreground ,desert-magenta))))
   `(cperl-array-face ((t (:foreground ,desert-yellow, :background ,desert-bg))))
   `(cperl-hash-face ((t (:foreground ,desert-yellow-1, :background ,desert-bg))))
;;;;; paren-face
   `(parenthesis ((t (:foreground ,desert-fg-1))))
;;;;; perspective
   `(persp-selected-face ((t (:foreground ,desert-yellow-2))))
;;;;; powerline
   `(powerline-active1 ((t (:background ,desert-bg-05 :inherit mode-line))))
   `(powerline-active2 ((t (:background ,desert-bg+2 :inherit mode-line))))
   `(powerline-inactive1 ((t (:background ,desert-bg+1 :inherit mode-line-inactive))))
   `(powerline-inactive2 ((t (:background ,desert-bg+3 :inherit mode-line-inactive))))
;;;;; proofgeneral
   `(proof-active-area-face ((t (:underline t))))
   `(proof-boring-face ((t (:foreground ,desert-fg :background ,desert-bg+2))))
   `(proof-command-mouse-highlight-face ((t (:inherit proof-mouse-highlight-face))))
   `(proof-debug-message-face ((t (:inherit proof-boring-face))))
   `(proof-declaration-name-face ((t (:inherit font-lock-keyword-face :foreground nil))))
   `(proof-eager-annotation-face ((t (:foreground ,desert-bg :background ,desert-orange))))
   `(proof-error-face ((t (:foreground ,desert-fg :background ,desert-red-4))))
   `(proof-highlight-dependency-face ((t (:foreground ,desert-bg :background ,desert-yellow-1))))
   `(proof-highlight-dependent-face ((t (:foreground ,desert-bg :background ,desert-orange))))
   `(proof-locked-face ((t (:background ,desert-blue-5))))
   `(proof-mouse-highlight-face ((t (:foreground ,desert-bg :background ,desert-orange))))
   `(proof-queue-face ((t (:background ,desert-red-4))))
   `(proof-region-mouse-highlight-face ((t (:inherit proof-mouse-highlight-face))))
   `(proof-script-highlight-error-face ((t (:background ,desert-red-2))))
   `(proof-tacticals-name-face ((t (:inherit font-lock-constant-face :foreground nil :background ,desert-bg))))
   `(proof-tactics-name-face ((t (:inherit font-lock-constant-face :foreground nil :background ,desert-bg))))
   `(proof-warning-face ((t (:foreground ,desert-bg :background ,desert-yellow-1))))
;;;;; racket-mode
   `(racket-keyword-argument-face ((t (:inherit font-lock-constant-face))))
   `(racket-selfeval-face ((t (:inherit font-lock-type-face))))
;;;;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face ((t (:foreground ,desert-fg))))
   `(rainbow-delimiters-depth-2-face ((t (:foreground ,desert-green+4))))
   `(rainbow-delimiters-depth-3-face ((t (:foreground ,desert-yellow-2))))
   `(rainbow-delimiters-depth-4-face ((t (:foreground ,desert-cyan))))
   `(rainbow-delimiters-depth-5-face ((t (:foreground ,desert-green+2))))
   `(rainbow-delimiters-depth-6-face ((t (:foreground ,desert-blue+1))))
   `(rainbow-delimiters-depth-7-face ((t (:foreground ,desert-yellow-1))))
   `(rainbow-delimiters-depth-8-face ((t (:foreground ,desert-green+1))))
   `(rainbow-delimiters-depth-9-face ((t (:foreground ,desert-blue-2))))
   `(rainbow-delimiters-depth-10-face ((t (:foreground ,desert-orange))))
   `(rainbow-delimiters-depth-11-face ((t (:foreground ,desert-green))))
   `(rainbow-delimiters-depth-12-face ((t (:foreground ,desert-blue-5))))
;;;;; rcirc
   `(rcirc-my-nick ((t (:foreground ,desert-blue))))
   `(rcirc-other-nick ((t (:foreground ,desert-orange))))
   `(rcirc-bright-nick ((t (:foreground ,desert-blue+1))))
   `(rcirc-dim-nick ((t (:foreground ,desert-blue-2))))
   `(rcirc-server ((t (:foreground ,desert-green))))
   `(rcirc-server-prefix ((t (:foreground ,desert-green+1))))
   `(rcirc-timestamp ((t (:foreground ,desert-green+2))))
   `(rcirc-nick-in-message ((t (:foreground ,desert-yellow))))
   `(rcirc-nick-in-message-full-line ((t (:weight bold))))
   `(rcirc-prompt ((t (:foreground ,desert-yellow :weight bold))))
   `(rcirc-track-nick ((t (:inverse-video t))))
   `(rcirc-track-keyword ((t (:weight bold))))
   `(rcirc-url ((t (:weight bold))))
   `(rcirc-keyword ((t (:foreground ,desert-yellow :weight bold))))
;;;;; re-builder
   `(reb-match-0 ((t (:foreground ,desert-bg :background ,desert-magenta))))
   `(reb-match-1 ((t (:foreground ,desert-bg :background ,desert-blue))))
   `(reb-match-2 ((t (:foreground ,desert-bg :background ,desert-orange))))
   `(reb-match-3 ((t (:foreground ,desert-bg :background ,desert-red))))
;;;;; realgud
   `(realgud-overlay-arrow1 ((t (:foreground ,desert-green))))
   `(realgud-overlay-arrow2 ((t (:foreground ,desert-yellow))))
   `(realgud-overlay-arrow3 ((t (:foreground ,desert-orange))))
   `(realgud-bp-enabled-face ((t (:inherit error))))
   `(realgud-bp-disabled-face ((t (:inherit secondary-selection))))
   `(realgud-bp-line-enabled-face ((t (:box (:color ,desert-red :style nil)))))
   `(realgud-bp-line-disabled-face ((t (:box (:color "grey70" :style nil)))))
   `(realgud-line-number ((t (:foreground ,desert-yellow))))
   `(realgud-backtrace-number ((t (:foreground ,desert-yellow, :weight bold))))
;;;;; regex-tool
   `(regex-tool-matched-face ((t (:background ,desert-blue-4 :weight bold))))
;;;;; rmail
   `(rmail-highlight ((t (:foreground ,desert-yellow :weight bold))))
   `(rmail-header-name ((t (:foreground ,desert-blue))))
;;;;; rpm-mode
   `(rpm-spec-dir-face ((t (:foreground ,desert-green))))
   `(rpm-spec-doc-face ((t (:foreground ,desert-green))))
   `(rpm-spec-ghost-face ((t (:foreground ,desert-red))))
   `(rpm-spec-macro-face ((t (:foreground ,desert-yellow))))
   `(rpm-spec-obsolete-tag-face ((t (:foreground ,desert-red))))
   `(rpm-spec-package-face ((t (:foreground ,desert-red))))
   `(rpm-spec-section-face ((t (:foreground ,desert-yellow))))
   `(rpm-spec-tag-face ((t (:foreground ,desert-blue))))
   `(rpm-spec-var-face ((t (:foreground ,desert-red))))
;;;;; rst-mode
   `(rst-level-1-face ((t (:foreground ,desert-orange))))
   `(rst-level-2-face ((t (:foreground ,desert-green+1))))
   `(rst-level-3-face ((t (:foreground ,desert-blue-1))))
   `(rst-level-4-face ((t (:foreground ,desert-yellow-2))))
   `(rst-level-5-face ((t (:foreground ,desert-cyan))))
   `(rst-level-6-face ((t (:foreground ,desert-green-2))))
;;;;; selectrum
   `(selectrum-current-candidate ((t (:foreground ,desert-yellow :weight bold :underline t))))
   `(selectrum-primary-highlight ((t (:background ,desert-green-2))))
   `(selectrum-secondary-highlight ((t (:background ,desert-green))))
;;;;; sh-mode
   `(sh-heredoc     ((t (:foreground ,desert-yellow :weight bold))))
   `(sh-quoted-exec ((t (:foreground ,desert-red))))
;;;;; show-paren
   `(show-paren-mismatch ((t (:foreground ,desert-red+1 :background ,desert-bg+3 :weight bold))))
   `(show-paren-match ((t (:foreground ,desert-fg :background ,desert-bg+3 :weight bold))))
;;;;; smart-mode-line
   ;; use (setq sml/theme nil) to enable desert for sml
   `(sml/global ((,class (:foreground ,desert-fg :weight bold))))
   `(sml/modes ((,class (:foreground ,desert-yellow :weight bold))))
   `(sml/minor-modes ((,class (:foreground ,desert-fg-1 :weight bold))))
   `(sml/filename ((,class (:foreground ,desert-yellow :weight bold))))
   `(sml/line-number ((,class (:foreground ,desert-blue :weight bold))))
   `(sml/col-number ((,class (:foreground ,desert-blue+1 :weight bold))))
   `(sml/position-percentage ((,class (:foreground ,desert-blue-1 :weight bold))))
   `(sml/prefix ((,class (:foreground ,desert-orange))))
   `(sml/git ((,class (:foreground ,desert-green+3))))
   `(sml/process ((,class (:weight bold))))
   `(sml/sudo ((,class  (:foreground ,desert-orange :weight bold))))
   `(sml/read-only ((,class (:foreground ,desert-red-2))))
   `(sml/outside-modified ((,class (:foreground ,desert-orange))))
   `(sml/modified ((,class (:foreground ,desert-red))))
   `(sml/vc-edited ((,class (:foreground ,desert-green+2))))
   `(sml/charging ((,class (:foreground ,desert-green+4))))
   `(sml/discharging ((,class (:foreground ,desert-red+1))))
;;;;; smartparens
   `(sp-show-pair-mismatch-face ((t (:foreground ,desert-red+1 :background ,desert-bg+3 :weight bold))))
   `(sp-show-pair-match-face ((t (:background ,desert-bg+3 :weight bold))))
;;;;; sml-mode-line
   '(sml-modeline-end-face ((t :inherit default :width condensed)))
;;;;; SLIME
   `(slime-repl-output-face ((t (:foreground ,desert-red))))
   `(slime-repl-inputed-output-face ((t (:foreground ,desert-green))))
   `(slime-error-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,desert-red)))
      (t
       (:underline ,desert-red))))
   `(slime-warning-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,desert-orange)))
      (t
       (:underline ,desert-orange))))
   `(slime-style-warning-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,desert-yellow)))
      (t
       (:underline ,desert-yellow))))
   `(slime-note-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,desert-green)))
      (t
       (:underline ,desert-green))))
   `(slime-highlight-face ((t (:inherit highlight))))
;;;;; SLY
   `(sly-mrepl-output-face ((t (:foreground ,desert-red))))
   `(sly-error-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,desert-red)))
      (t
       (:underline ,desert-red))))
   `(sly-warning-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,desert-orange)))
      (t
       (:underline ,desert-orange))))
   `(sly-style-warning-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,desert-yellow)))
      (t
       (:underline ,desert-yellow))))
   `(sly-note-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,desert-green)))
      (t
       (:underline ,desert-green))))
   `(sly-stickers-placed-face ((t (:foreground ,desert-fg :background ,desert-bg+3))))
;;;;; solaire
   `(solaire-default-face ((t (:inherit default :background ,desert-bg-08))))
   `(solaire-minibuffer-face ((t (:inherit default :background ,desert-bg-08))))
   `(solaire-hl-line-face ((t (:inherit hl-line :background ,desert-bg))))
   `(solaire-org-hide-face ((t (:inherit org-hide :background ,desert-bg-08))))
;;;;; speedbar
   `(speedbar-button-face ((t (:foreground ,desert-green+2))))
   `(speedbar-directory-face ((t (:foreground ,desert-cyan))))
   `(speedbar-file-face ((t (:foreground ,desert-fg))))
   `(speedbar-highlight-face ((t (:foreground ,desert-bg :background ,desert-green+2))))
   `(speedbar-selected-face ((t (:foreground ,desert-red))))
   `(speedbar-separator-face ((t (:foreground ,desert-bg :background ,desert-blue-1))))
   `(speedbar-tag-face ((t (:foreground ,desert-yellow))))
;;;;; swiper
   `(swiper-line-face ((t (:underline t))))
;;;;; sx
   `(sx-custom-button
     ((t (:background ,desert-fg :foreground ,desert-bg-1
                      :box (:line-width 3 :style released-button) :height 0.9))))
   `(sx-question-list-answers
     ((t (:foreground ,desert-green+3
                      :height 1.0 :inherit sx-question-list-parent))))
   `(sx-question-mode-accepted
     ((t (:foreground ,desert-green+3
                      :height 1.3 :inherit sx-question-mode-title))))
   '(sx-question-mode-content-face ((t (:inherit highlight))))
   `(sx-question-mode-kbd-tag
     ((t (:box (:color ,desert-bg-1 :line-width 3 :style released-button)
               :height 0.9 :weight semi-bold))))
;;;;; tabbar
   `(tabbar-button ((t (:foreground ,desert-fg
                                    :background ,desert-bg))))
   `(tabbar-selected ((t (:foreground ,desert-fg
                                      :background ,desert-bg
                                      :box (:line-width -1 :style pressed-button)))))
   `(tabbar-unselected ((t (:foreground ,desert-fg
                                        :background ,desert-bg+1
                                        :box (:line-width -1 :style released-button)))))
;;;;; tab-bar
   `(tab-bar ((t (:background ,desert-bg+1))))
   `(tab-bar-tab ((t (:foreground ,desert-fg
                                  :background ,desert-bg
                                  :weight bold
                                  :box (:line-width -1 :style released-button)))))
   `(tab-bar-tab-inactive ((t (:foreground ,desert-fg
                                           :background ,desert-bg+1
                                           :box (:line-width -1 :style released-button)))))
;;;;; tab-line
   `(tab-line ((t (:background ,desert-bg+1))))
   `(tab-line-tab ((t (:foreground ,desert-fg
                                  :background ,desert-bg
                                  :weight bold
                                  :box (:line-width -1 :style released-button)))))
   `(tab-line-tab-inactive ((t (:foreground ,desert-fg
                                           :background ,desert-bg+1
                                           :box (:line-width -1 :style released-button)))))
   `(tab-line-tab-current ((t (:foreground ,desert-fg
                                           :background ,desert-bg+1
                                           :box (:line-width -1 :style pressed-button)))))
;;;;; term
   `(term-color-black ((t (:foreground ,desert-bg
                                       :background ,desert-bg-1))))
   `(term-color-red ((t (:foreground ,desert-red-2
                                     :background ,desert-red-4))))
   `(term-color-green ((t (:foreground ,desert-green
                                       :background ,desert-green+2))))
   `(term-color-yellow ((t (:foreground ,desert-orange
                                        :background ,desert-yellow))))
   `(term-color-blue ((t (:foreground ,desert-blue-1
                                      :background ,desert-blue-4))))
   `(term-color-magenta ((t (:foreground ,desert-magenta
                                         :background ,desert-red))))
   `(term-color-cyan ((t (:foreground ,desert-cyan
                                      :background ,desert-blue))))
   `(term-color-white ((t (:foreground ,desert-fg
                                       :background ,desert-fg-1))))
   '(term-default-fg-color ((t (:inherit term-color-white))))
   '(term-default-bg-color ((t (:inherit term-color-black))))
;;;;; undo-tree
   `(undo-tree-visualizer-active-branch-face ((t (:foreground ,desert-fg+1 :weight bold))))
   `(undo-tree-visualizer-current-face ((t (:foreground ,desert-red-1 :weight bold))))
   `(undo-tree-visualizer-default-face ((t (:foreground ,desert-fg))))
   `(undo-tree-visualizer-register-face ((t (:foreground ,desert-yellow))))
   `(undo-tree-visualizer-unmodified-face ((t (:foreground ,desert-cyan))))
;;;;; vertico
   `(vertico-current ((t (:foreground ,desert-yellow :weight bold :underline t))))
;;;;; visual-regexp
   `(vr/group-0 ((t (:foreground ,desert-bg :background ,desert-green :weight bold))))
   `(vr/group-1 ((t (:foreground ,desert-bg :background ,desert-orange :weight bold))))
   `(vr/group-2 ((t (:foreground ,desert-bg :background ,desert-blue :weight bold))))
   `(vr/match-0 ((t (:inherit isearch))))
   `(vr/match-1 ((t (:foreground ,desert-yellow-2 :background ,desert-bg-1 :weight bold))))
   `(vr/match-separator-face ((t (:foreground ,desert-red :weight bold))))
;;;;; volatile-highlights
   `(vhl/default-face ((t (:background ,desert-bg-05))))
;;;;; web-mode
   `(web-mode-builtin-face ((t (:inherit ,font-lock-builtin-face))))
   `(web-mode-comment-face ((t (:inherit ,font-lock-comment-face))))
   `(web-mode-constant-face ((t (:inherit ,font-lock-constant-face))))
   `(web-mode-css-at-rule-face ((t (:foreground ,desert-orange ))))
   `(web-mode-css-prop-face ((t (:foreground ,desert-orange))))
   `(web-mode-css-pseudo-class-face ((t (:foreground ,desert-green+3 :weight bold))))
   `(web-mode-css-rule-face ((t (:foreground ,desert-blue))))
   `(web-mode-doctype-face ((t (:inherit ,font-lock-comment-face))))
   `(web-mode-folded-face ((t (:underline t))))
   `(web-mode-function-name-face ((t (:foreground ,desert-blue))))
   `(web-mode-html-attr-name-face ((t (:foreground ,desert-orange))))
   `(web-mode-html-attr-value-face ((t (:inherit ,font-lock-string-face))))
   `(web-mode-html-tag-face ((t (:foreground ,desert-cyan))))
   `(web-mode-keyword-face ((t (:inherit ,font-lock-keyword-face))))
   `(web-mode-preprocessor-face ((t (:inherit ,font-lock-preprocessor-face))))
   `(web-mode-string-face ((t (:inherit ,font-lock-string-face))))
   `(web-mode-type-face ((t (:inherit ,font-lock-type-face))))
   `(web-mode-variable-name-face ((t (:inherit ,font-lock-variable-name-face))))
   `(web-mode-server-background-face ((t (:background ,desert-bg))))
   `(web-mode-server-comment-face ((t (:inherit web-mode-comment-face))))
   `(web-mode-server-string-face ((t (:inherit web-mode-string-face))))
   `(web-mode-symbol-face ((t (:inherit font-lock-constant-face))))
   `(web-mode-warning-face ((t (:inherit font-lock-warning-face))))
   `(web-mode-whitespaces-face ((t (:background ,desert-red))))
;;;;; whitespace-mode
   `(whitespace-space ((t (:background ,desert-bg+1 :foreground ,desert-bg+1))))
   `(whitespace-hspace ((t (:background ,desert-bg+1 :foreground ,desert-bg+1))))
   `(whitespace-tab ((t (:background ,desert-red-1))))
   `(whitespace-newline ((t (:foreground ,desert-bg+1))))
   `(whitespace-trailing ((t (:background ,desert-red))))
   `(whitespace-line ((t (:background ,desert-bg :foreground ,desert-magenta))))
   `(whitespace-space-before-tab ((t (:background ,desert-orange :foreground ,desert-orange))))
   `(whitespace-indentation ((t (:background ,desert-yellow :foreground ,desert-red))))
   `(whitespace-empty ((t (:background ,desert-yellow))))
   `(whitespace-space-after-tab ((t (:background ,desert-yellow :foreground ,desert-red))))
;;;;; wanderlust
   `(wl-highlight-folder-few-face ((t (:foreground ,desert-red-2))))
   `(wl-highlight-folder-many-face ((t (:foreground ,desert-red-1))))
   `(wl-highlight-folder-path-face ((t (:foreground ,desert-orange))))
   `(wl-highlight-folder-unread-face ((t (:foreground ,desert-blue))))
   `(wl-highlight-folder-zero-face ((t (:foreground ,desert-fg))))
   `(wl-highlight-folder-unknown-face ((t (:foreground ,desert-blue))))
   `(wl-highlight-message-citation-header ((t (:foreground ,desert-red-1))))
   `(wl-highlight-message-cited-text-1 ((t (:foreground ,desert-red))))
   `(wl-highlight-message-cited-text-2 ((t (:foreground ,desert-green+2))))
   `(wl-highlight-message-cited-text-3 ((t (:foreground ,desert-blue))))
   `(wl-highlight-message-cited-text-4 ((t (:foreground ,desert-blue+1))))
   `(wl-highlight-message-header-contents-face ((t (:foreground ,desert-green))))
   `(wl-highlight-message-headers-face ((t (:foreground ,desert-red+1))))
   `(wl-highlight-message-important-header-contents ((t (:foreground ,desert-green+2))))
   `(wl-highlight-message-header-contents ((t (:foreground ,desert-green+1))))
   `(wl-highlight-message-important-header-contents2 ((t (:foreground ,desert-green+2))))
   `(wl-highlight-message-signature ((t (:foreground ,desert-green))))
   `(wl-highlight-message-unimportant-header-contents ((t (:foreground ,desert-fg))))
   `(wl-highlight-summary-answered-face ((t (:foreground ,desert-blue))))
   `(wl-highlight-summary-disposed-face ((t (:foreground ,desert-fg
                                                         :slant italic))))
   `(wl-highlight-summary-new-face ((t (:foreground ,desert-blue))))
   `(wl-highlight-summary-normal-face ((t (:foreground ,desert-fg))))
   `(wl-highlight-summary-thread-top-face ((t (:foreground ,desert-yellow))))
   `(wl-highlight-thread-indent-face ((t (:foreground ,desert-magenta))))
   `(wl-highlight-summary-refiled-face ((t (:foreground ,desert-fg))))
   `(wl-highlight-summary-displaying-face ((t (:underline t :weight bold))))
;;;;; which-func-mode
   `(which-func ((t (:foreground ,desert-green+4))))
;;;;; window-tool-bar-mode
   `(window-tool-bar-button ((t (:foreground ,desert-fg
                                 :background ,desert-bg
                                 :box (:line-width -1 :style released-button)))))
   `(window-tool-bar-button-hover ((t (:foreground ,desert-fg
                                       :background ,desert-bg+1
                                       :box (:line-width -1 :style released-button)))))
   `(window-tool-bar-button-disabled ((t (:foreground ,desert-fg
                                          :background ,desert-bg+3
                                          :box (:line-width -1 :style released-button)))))
;;;;; xcscope
   `(cscope-file-face ((t (:foreground ,desert-yellow :weight bold))))
   `(cscope-function-face ((t (:foreground ,desert-cyan :weight bold))))
   `(cscope-line-number-face ((t (:foreground ,desert-red :weight bold))))
   `(cscope-mouse-face ((t (:foreground ,desert-bg :background ,desert-blue+1))))
   `(cscope-separator-face ((t (:foreground ,desert-red :weight bold
                                            :underline t :overline t))))
;;;;; yascroll
   `(yascroll:thumb-text-area ((t (:background ,desert-bg-1))))
   `(yascroll:thumb-fringe ((t (:background ,desert-bg-1 :foreground ,desert-bg-1))))
   ))

;;; Theme Variables
(desert-with-color-variables
  (custom-theme-set-variables
   'desert
;;;;; ansi-color
   `(ansi-color-names-vector [,desert-bg ,desert-red ,desert-green ,desert-yellow
                                          ,desert-blue ,desert-magenta ,desert-cyan ,desert-fg])
;;;;; company-quickhelp
   `(company-quickhelp-color-background ,desert-bg+1)
   `(company-quickhelp-color-foreground ,desert-fg)
;;;;; fill-column-indicator
   `(fci-rule-color ,desert-bg-05)
;;;;; nrepl-client
   `(nrepl-message-colors
     '(,desert-red ,desert-orange ,desert-yellow ,desert-green ,desert-green+4
       ,desert-cyan ,desert-blue+1 ,desert-magenta))
;;;;; pdf-tools
   `(pdf-view-midnight-colors '(,desert-fg . ,desert-bg-05))
;;;;; vc-annotate
   `(vc-annotate-color-map
     '(( 20. . ,desert-red-1)
       ( 40. . ,desert-red)
       ( 60. . ,desert-orange)
       ( 80. . ,desert-yellow-2)
       (100. . ,desert-yellow-1)
       (120. . ,desert-yellow)
       (140. . ,desert-green-2)
       (160. . ,desert-green)
       (180. . ,desert-green+1)
       (200. . ,desert-green+2)
       (220. . ,desert-green+3)
       (240. . ,desert-green+4)
       (260. . ,desert-cyan)
       (280. . ,desert-blue-2)
       (300. . ,desert-blue-1)
       (320. . ,desert-blue)
       (340. . ,desert-blue+1)
       (360. . ,desert-magenta)))
   `(vc-annotate-very-old-color ,desert-magenta)
   `(vc-annotate-background ,desert-bg-1)
   ))

;;; Rainbow Support

(declare-function rainbow-mode 'rainbow-mode)
(declare-function rainbow-colorize-by-assoc 'rainbow-mode)

(defcustom desert-add-font-lock-keywords nil
  "Whether to add font-lock keywords for desert color names.

In buffers visiting library `desert-theme.el' the desert
specific keywords are always added, provided that library has
been loaded (because that is where the code that does it is
defined).  If you visit this file and only enable the theme,
then you have to turn `rainbow-mode' off and on again for the
desert-specific font-lock keywords to be used.

In all other Emacs-Lisp buffers this variable controls whether
this should be done.  This requires library `rainbow-mode'."
  :type 'boolean
  :group 'desert-theme)

(defvar desert-colors-font-lock-keywords nil)

(defun desert--rainbow-turn-on ()
  "Maybe also add font-lock keywords for desert colors."
  (when (and (derived-mode-p 'emacs-lisp-mode)
             (or desert-add-font-lock-keywords
                 (and (buffer-file-name)
                      (equal (file-name-nondirectory (buffer-file-name))
                             "desert-theme.el"))))
    (unless desert-colors-font-lock-keywords
      (setq desert-colors-font-lock-keywords
            `((,(regexp-opt (mapcar 'car desert-default-colors-alist) 'words)
               (0 (rainbow-colorize-by-assoc desert-default-colors-alist))))))
    (font-lock-add-keywords nil desert-colors-font-lock-keywords 'end)))

(defun desert--rainbow-turn-off ()
  "Also remove font-lock keywords for desert colors."
  (font-lock-remove-keywords nil desert-colors-font-lock-keywords))

(when (fboundp 'advice-add)
  (advice-add 'rainbow-turn-on :after  #'desert--rainbow-turn-on)
  (advice-add 'rainbow-turn-off :after #'desert--rainbow-turn-off))

;;; Footer

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'desert)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; eval: (when (require 'rainbow-mode nil t) (rainbow-mode 1))
;; End:
;;; desert-theme.el ends here
