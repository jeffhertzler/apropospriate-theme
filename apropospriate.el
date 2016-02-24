;;; apropospriate.el --- A light & dark theme set for Emacs.

;; Copyright (C) 2015 Justin Talbott

;; Author: Justin Talbott <justin@waymondo.com>
;; URL: http://github.com/waymondo/apropospriate-theme
;; Version: 0.1.0

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

;; A light & dark theme set for Emacs.

;;; Code:

(require 'color)

(defmacro apropospriate-with-color-variables (variant &rest body)
  (declare (indent 0))
  `(let* ((class '((class color) (min-colors 89)))
          (variant ,variant)
          (base00   (if (eq variant 'light) "#FAFAFA" "#424242"))
          (base01   (if (eq variant 'light) "#90A4AE" "#757575"))
          (base02   (if (eq variant 'light) "#78909C" "#9E9E9E"))
          (base03   (if (eq variant 'light) "#546E7A" "#E0E0E0"))
          (yellow   (if (eq variant 'light) "#F57F17" "#FFEE58"))
          (yellow-1 (if (eq variant 'light) "#F9A725" "#FFF59D"))
          (brown    (if (eq variant 'light) "#4E342E" "#BCAAA4"))
          (brown-1  (if (eq variant 'light) "#6D4C41" "#D7CCC8"))
          (orange   (if (eq variant 'light) "#D84315" "#FFCC80"))
          (orange-1 (if (eq variant 'light) "#FF5722" "#FFA726"))
          (red      (if (eq variant 'light) "#D50000" "#E57373"))
          (red-1    (if (eq variant 'light) "#FF1744" "#EF9A9A"))
          (pink     (if (eq variant 'light) "#F8BBD0" "#F8BBD0"))
          (pink-1   (if (eq variant 'light) "#EC407A" "#FF80AB"))
          (purple   (if (eq variant 'light) "#7E57C2" "#E1BEE7"))
          (purple-1 (if (eq variant 'light) "#B388FF" "#9575CD"))
          (blue     (if (eq variant 'light) "#42A5F5" "#64B5F6"))
          (blue-1   (if (eq variant 'light) "#1E88E5" "#42A5F5"))
          (indigo   (if (eq variant 'light) "#5C6BC0" "#C5CAE9"))
          (indigo-1 (if (eq variant 'light) "#9FA8DA" "#7986CB"))
          (cyan     (if (eq variant 'light) "#0097A7" "#80DEEA"))
          (cyan-1   (if (eq variant 'light) "#00B8D4" "#26C6DA"))
          (teal     (if (eq variant 'light) "#26A69A" "#80CBC4"))
          (teal-1   (if (eq variant 'light) "#00897B" "#4DB6AC"))
          (green    (if (eq variant 'light) "#66BB6A" "#C5E1A5"))
          (green-1  (if (eq variant 'light) "#558B2F" "#F4FF81"))
          (base00-1 (if (eq variant 'light)
                        (color-lighten-name base00 3)
                      (color-darken-name base00 3)))
          (base00-2 (if (eq variant 'light)
                        (color-lighten-name base00 5)
                      (color-darken-name base00 5)))
          (base00-3 (if (eq variant 'light)
                        (color-lighten-name base00 10)
                      (color-darken-name base00 10)))
          (base00+1 (if (eq variant 'light)
                        (color-darken-name base00 2)
                      (color-lighten-name base00 2)))
          (base00+2 (if (eq variant 'light)
                        (color-darken-name base00 8)
                      (color-lighten-name base00 8)))
          (base00+3 (if (eq variant 'light)
                        (color-darken-name base00 12)
                      (color-lighten-name base00 12)))
          (light-emphasis (if (eq variant 'light) base00+3 base00-3))
          (light-emphasis-1 (if (eq variant 'light) base00+2 base00-2))
          (light-emphasis-2 (if (eq variant 'light) base00+1 base00-1))
          (flashing-color (if (eq variant 'light) pink (color-darken-name pink 25)))
          (highlight-line-color (if (eq variant 'light) base00-1 base00+1)))
     ,@body))

(defun create-apropospriate-theme (variant theme-name)
  "Create a VARIANT of the theme named THEME-NAME."
  (apropospriate-with-color-variables variant
    (custom-theme-set-faces
     theme-name
     `(default ((,class (:background ,base00 :foreground ,base03))))
     `(bold ((,class (:weight bold))))
     `(border ((,class (:background ,base02))))
     `(cursor ((,class (:background ,pink-1 :inverse-video t))))
     `(highlight ((,class (:background ,base00+1))))
     `(hl-line ((,class (:background ,highlight-line-color))))
     `(link ((,class (:foreground ,blue :underline t))))
     `(link-visited ((,class (:inherit link :foreground ,purple))))
     `(minibuffer-prompt ((,class (:foreground ,blue))))
     `(region ((,class (:background ,base00+2))))
     `(vhl/default-face ((,class (:background ,base00+1))))
     `(trailing-whitespace ((,class (:background ,base00+1 :foreground ,yellow))))
     `(next-error ((,class (:background ,base01))))
     `(secondary-selection ((,class (:background ,base00-1))))
     `(header-line ((,class (:foreground ,purple :background nil))))
     `(auto-dim-other-buffers-face ((,class (:background ,base00+1))))
     `(fringe ((,class (:background ,base00+1 :foreground ,base02))))
     `(linum ((,class (:inherit fringe :foreground ,base01))))
     `(vertical-border ((,class (:foreground ,base00+3))))
     `(widget-button ((,class (:underline t))))
     `(widget-field ((,class (:background ,base02 :box (:line-width 1 :color ,base03)))))
     `(error ((,class (:foreground ,red :weight bold))))
     `(warning ((,class (:foreground ,orange :weight bold))))
     `(success ((,class (:foreground ,green :weight bold))))
     `(ace-jump-face-background ((,class (:foreground ,base00+3))))
     `(ace-jump-face-foreground ((,class (:foreground ,pink-1 :background nil :weight bold))))
     `(ajb-face ((,class (:background ,base00+1))))
     `(avy-lead-face ((,class (:inherit ace-jump-face-foreground))))
     `(avy-lead-face-0 ((,class (:inherit ace-jump-face-foreground))))
     `(avy-lead-face-1 ((,class (:inherit ace-jump-face-foreground))))
     `(avy-lead-face-2 ((,class (:inherit ace-jump-face-foreground))))
     `(avy-background-face ((,class (:inherit ace-jump-face-background))))
     `(aw-leading-char-face ((,class (:inherit ace-jump-face-foreground))))
     `(aw-background-face ((,class (:inherit ace-jump-face-background))))
     `(parenthesis ((,class (:foreground ,base00+3))))
     `(font-lock-comment-face ((,class (:foreground ,base01))))
     `(font-lock-comment-delimiter-face ((,class (:foreground ,base01))))
     `(font-lock-builtin-face ((,class (:foreground ,cyan))))
     `(font-lock-doc-face ((,class (:foreground ,base02))))
     `(font-lock-constant-face ((,class (:foreground ,indigo))))
     `(font-lock-function-name-face ((,class (:foreground ,blue))))
     `(font-lock-keyword-face ((,class (:foreground ,purple))))
     `(font-lock-negation-char-face ((,class (:foreground ,red-1))))
     `(font-lock-preprocessor-face ((,class (:foreground ,blue-1))))
     `(font-lock-regexp-grouping-backslash ((,class (:foreground ,purple-1))))
     `(font-lock-regexp-grouping-construct ((,class (:foreground ,purple-1))))
     `(font-lock-string-face ((,class (:foreground ,green))))
     `(font-lock-type-face ((,class (:foreground ,orange))))
     `(font-lock-variable-name-face ((,class (:foreground ,teal))))
     `(font-lock-warning-face ((,class (:foreground ,red))))
     `(mode-line ((,class (:box (:line-width 4 :color ,light-emphasis :style nil) :background ,base00-2 :foreground ,base03))))
     `(mode-line-inactive ((,class (:box (:line-width 4 :color ,base00+1 :style nil) :background ,base00+1 :foreground ,base02))))
     `(mode-line-buffer-id ((,class (:foreground unspecified :background nil))))
     `(mode-line-emphasis ((,class (:foreground ,base02 :slant italic))))
     `(mode-line-highlight ((,class (:foreground ,base02 :box nil :weight bold))))
     `(powerline-active1 ((,class (:background ,base00))))
     `(powerline-active2 ((,class (:background ,base00+1))))
     `(powerline-inactive1 ((,class (:background ,base00+1))))
     `(powerline-inactive2 ((,class (:background ,base00+1))))
     `(alert-trivial-face ((,class (:inherit nil :foreground nil :background nil))))
     `(anzu-mode-line ((,class (:foreground ,yellow))))
     `(persp-selected-face ((,class (:foreground ,base03))))
     `(mm-command-output ((,class (:foreground unspecified :background unspecified))))
     `(spaceline-highlight-face ((,class (:background ,light-emphasis :foreground ,base03))))
     `(spaceline-evil-normal ((,class (:background ,yellow :foreground ,base00))))
     `(spaceline-evil-insert ((,class (:background ,red :foreground ,base00))))
     `(spaceline-evil-emacs ((,class (:background ,cyan-1 :foreground ,base00))))
     `(spaceline-evil-replace ((,class (:background ,brown :foreground ,base00))))
     `(spaceline-evil-visual ((,class (:background ,green :foreground ,base00))))
     `(spaceline-evil-motion ((,class (:background ,purple :foreground ,base00))))
     `(spaceline-unmodified ((,class (:background ,orange-1 :foreground ,base00))))
     `(spaceline-modified ((,class (:background ,cyan-1 :foreground ,base00))))
     `(spaceline-read-only ((,class (:background ,purple :foreground ,base00))))
     `(match ((,class (:foreground ,yellow :background ,base00+1 :inverse-video t :weight bold))))
     `(isearch ((,class (:inherit match))))
     `(query-replace ((,class (:inherit isearch))))
     `(anzu-replace-to ((,class (:foreground ,yellow :background ,base00+1))))
     `(lazy-highlight ((,class (:foreground ,yellow))))
     `(isearch-lazy-highlight-face ((,class (:foreground ,yellow))))
     `(isearch-fail ((,class (:inherit font-lock-warning-face))))
     `(regex-tool-matched-face ((,class (:foreground nil :background nil :inherit match))))
     `(ag-match-face ((,class (:inherit isearch-lazy-highlight-face))))
     `(custom-state ((,class (:foreground ,green))))
     `(visible-mark-active ((,class (:foreground unspecified :background ,light-emphasis))))
     `(visible-mark-face1 ((,class (:background ,light-emphasis-1))))
     `(visible-mark-face2 ((,class (:background ,light-emphasis-2))))
     `(ivy-current-match ((,class (:foreground unspecified :background ,light-emphasis-1))))
     `(ivy-confirm-face ((,class (:foregroud ,green))))
     `(ivy-match-required-face ((,class (:foregroud ,red))))
     `(ivy-remote ((,class (:foregroud ,cyan))))
     `(swiper-minibuffer-match-face-1 ((,class (:background ,light-emphasis-1))))
     `(swiper-minibuffer-match-face-2 ((,class (:inherit match))))
     `(swiper-minibuffer-match-face-3 ((,class (:background ,cyan))))
     `(swiper-minibuffer-match-face-4 ((,class (:background ,pink-1))))
     `(wgrep-face ((,class (:background ,base00+2))))
     `(wgrep-file-face ((,class (:background ,base00+1))))
     `(wgrep-delete-face ((,class (:foreground ,red))))
     `(wgrep-reject-face ((,class (:foreground ,red))))
     `(wgrep-done-face ((,class (:foreground ,green))))
     `(guide-key/highlight-command-face ((,class (:foreground ,yellow))))
     `(guide-key/key-face ((,class (:foreground ,pink-1))))
     `(guide-key/prefix-command-face ((,class (:foreground ,cyan))))
     `(which-key-key-face ((,class (:foreground ,pink-1))))
     `(which-key-special-key-face ((,class (:inherit which-key-key-face :inverse-video nil))))
     `(tabbar-default ((,class (:inherit default :foreground ,base02 :background "black" :box (:line-width 4 :color ,base00 :style nil)))))
     `(tabbar-button ((,class (:height 0.8 :box (:line-width 4 :color ,base00-2 :style nil)))))
     `(tabbar-unselected ((,class (:inherit tabbar-button :background ,base00-2))))
     `(tabbar-modified ((,class (:inherit tabbar-unselected))))
     `(tabbar-selected ((,class (:inherit tabbar-button :box (:line-width 4 :color ,base00 :style nil)))))
     `(tabbar-separator ((,class (:inherit tabbar-selected))))
     `(company-tooltip ((,class (:background ,base00-1 :foreground ,base02))))
     `(company-tooltip-selection ((,class (:background ,base00-2 :foreground ,base03))))
     `(company-tooltip-common ((,class (:inherit company-tooltip))))
     `(company-tooltip-common-selection ((,class (:inherit company-tooltip-selection))))
     `(company-tooltip-search ((,class (:foreground ,yellow))))
     `(company-echo-common ((,class (:inherit company-tooltip :foreground ,yellow))))
     `(company-scrollbar-bg ((,class (:background ,base00+1))))
     `(company-scrollbar-fg ((,class (:background ,base00+3))))
     `(company-tooltip-annotation ((,class (:inherit company-tooltip :foreground ,base01))))
     `(company-preview ((,class (:background ,base00 :foreground ,base02))))
     `(company-preview-common ((,class (:foreground ,base02))))
     `(company-preview-search ((,class (:background ,base00))))
     `(tooltip ((,class (:background ,base03 :foreground ,base00 :height 0.9))))
     `(popup-tip-face ((,class (:inherit tooltip))))
     `(popup-face ((,class (:foreground ,base00+1 :background ,base03))))
     `(popup-menu-selection-face ((,class (:foreground ,base03 :background ,blue))))
     `(popup-isearch-match ((,class (:foreground ,yellow :background nil))))
     `(popup-scroll-bar-foreground-face ((,class (:inherit company-scrollbar-fg))))
     `(popup-scroll-bar-background-face ((,class (:background ,base02))))
     `(flymake-warnline ((,class (:underline ,orange :background ,base00+1))))
     `(flymake-errline ((,class (:underline ,red :background ,base00+1))))
     `(flycheck-error ((,class (:underline (:style wave :color ,red) :inherit unspecified))))
     `(flycheck-info ((,class (:underline (:style wave :color ,green) :inherit unspecified))))
     `(flycheck-warning ((,class (:underline (:style wave :color ,orange) :inherit unspecified))))
     `(swoop-face-target-words ((,class (:foreground ,yellow))))
     `(swoop-face-target-line ((,class (:background ,base01))))
     `(swoop-face-line-buffer-name ((,class (:inherit header-line :foreground ,base02))))
     `(swoop-face-header-format-line ((,class (:inherit swoop-face-line-buffer-name :foreground ,purple))))
     `(swoop-face-line-number ((,class (:foreground ,base02))))
     `(helm-swoop-target-word-face ((,class (:foreground ,yellow))))
     `(helm-swoop-target-line-face ((,class (:background ,base00+2))))
     `(helm-swoop-target-line-block-face ((,class (:background ,base00+1))))
     `(helm-swoop-line-number-face ((,class (:foreground ,base01))))
     `(helm-match ((,class (:foreground ,yellow-1))))
     `(helm-source-header ((,class (:family inherit :inherit header-line :foreground ,purple))))
     `(helm-visible-mark ((,class (:background ,green))))
     `(helm-header ((,class (:inherit header-line))))
     `(helm-candidate-number ((,class (:background unspecified))))
     `(helm-selection ((,class (:background ,base00+2))))
     `(helm-selection-line ((,class (:inherit helm-selection))))
     `(helm-separator ((,class (:foreground ,base01))))
     `(helm-action ((,class (:underline nil))))
     `(helm-prefarg ((,class (:foreground ,green))))
     `(helm-buffer-saved-out ((,class (:foreground ,red))))
     `(helm-buffer-not-saved ((,class (:foreground ,red))))
     `(helm-buffer-size ((,class (:foreground ,base02))))
     `(helm-buffer-process ((,class (:foreground ,base02))))
     `(helm-buffer-directory ((,class (:foreground ,brown))))
     `(helm-M-x-key ((,class (:foreground ,base02))))
     `(helm-ff-prefix ((,class (:foreground ,yellow))))
     `(helm-ff-executable ((,class (:foreground ,green))))
     `(helm-ff-directory ((,class (:inherit helm-buffer-directory))))
     `(helm-ff-symlink ((,class (:foreground ,brown))))
     `(helm-ff-invalid-symlink ((,class (:inherit helm-ff-symlink :underline (:style wave :color ,red)))))
     `(helm-grep-match ((,class (:inherit match))))
     `(helm-grep-file ((,class (:foreground ,base01))))
     `(helm-grep-lineno ((,class (:foreground ,base02))))
     `(helm-grep-running ((,class (:inherit compilation-mode-line-run))))
     `(helm-grep-finish ((,class (:inherit success))))
     `(helm-visible-mark ((,class (:inverse-video t))))
     `(helm-ls-git-added-modified-face ((,class (:foreground ,cyan))))
     `(helm-ls-git-conflict-face ((,class (:foreground ,purple-1))))
     `(helm-ls-git-deleted-and-staged-face ((,class (:foreground ,base02))))
     `(helm-ls-git-deleted-not-staged-face ((,class (:foreground ,orange))))
     `(helm-ls-git-modified-and-staged-face ((,class (:foreground ,orange-1))))
     `(helm-ls-git-modified-not-staged-face ((,class (:foreground ,orange-1))))
     `(helm-ls-git-renamed-modified-face ((,class (:foreground ,orange-1))))
     `(helm-ls-git-untracked-face ((,class (:foreground ,blue))))
     `(show-paren-match ((,class (:background unspecified :underline (:style line :color ,pink)))))
     `(show-paren-mismatch ((,class (:background unspecified :foreground ,red :inverse-video t :underline (:style line :color ,red)))))
     `(highlight-symbol-face ((,class (:foreground unspecified :background unspecified :underline (:style line :color ,base02)))))
     `(sp-show-pair-match-face ((,class (:inherit show-paren-match))))
     `(sp-show-pair-mismatch-face ((,class (:inherit show-paren-mismatch))))
     `(rainbow-delimiters-depth-1-face ((,class (:foreground ,purple-1))))
     `(rainbow-delimiters-depth-2-face ((,class (:foreground ,indigo-1))))
     `(rainbow-delimiters-depth-3-face ((,class (:foreground ,cyan-1))))
     `(rainbow-delimiters-depth-4-face ((,class (:foreground ,blue-1))))
     `(rainbow-delimiters-depth-5-face ((,class (:foreground ,teal-1))))
     `(rainbow-delimiters-depth-6-face ((,class (:foreground ,pink-1))))
     `(rainbow-delimiters-depth-7-face ((,class (:foreground ,purple))))
     `(rainbow-delimiters-depth-8-face ((,class (:foreground ,indigo))))
     `(rainbow-delimiters-depth-9-face ((,class (:foreground ,cyan))))
     `(rainbow-delimiters-depth-10-face ((,class (:foreground ,blue))))
     `(rainbow-delimiters-depth-11-face ((,class (:foreground ,teal))))
     `(rainbow-delimiters-depth-12-face ((,class (:foreground ,pink))))
     `(rainbow-delimiters-mismatched-face ((,class (:foreground ,red))))
     `(rainbow-delimiters-unmatched-face ((,class (:foreground ,red))))
     `(highlight-blocks-depth-1-face ((,class (:background ,base00-1))))
     `(highlight-blocks-depth-2-face ((,class (:background ,base00-2))))
     `(highlight-blocks-depth-3-face ((,class (:background ,base00-3))))
     `(highlight-blocks-depth-4-face ((,class (:background ,base00-3))))
     `(highlight-blocks-depth-5-face ((,class (:background ,base00-3))))
     `(highlight-blocks-depth-6-face ((,class (:background ,base00-3))))
     `(highlight-blocks-depth-7-face ((,class (:background ,base00-3))))
     `(highlight-blocks-depth-8-face ((,class (:background ,base00-3))))
     `(highlight-blocks-depth-9-face ((,class (:background ,base00-3))))
     `(ido-subdir ((,class (:foreground ,brown :weight bold))))
     `(ido-first-match ((,class (:foreground ,orange :weight bold))))
     `(ido-only-match ((,class (:inherit ido-first-match))))
     `(ido-indicator ((,class (:foreground ,red :background ,base00+1))))
     `(ido-virtual ((,class (:foreground ,cyan))))
     `(ido-vertical-match-face ((,class (:foreground unspecified :underline (:style line :color ,yellow)))))
     `(flx-highlight-face ((,class (:foreground ,yellow))))
     `(diff-added ((,class (:foreground ,green))))
     `(diff-changed ((,class (:foreground ,blue))))
     `(diff-removed ((,class (:foreground ,red))))
     `(diff-header ((,class (:background ,base00+1))))
     `(diff-file-header ((,class (:foreground ,base01))))
     `(diff-hunk-header ((,class (:foreground ,base01))))
     `(ediff-even-diff-A ((,class (:foreground nil :background nil :inverse-video t))))
     `(ediff-even-diff-B ((,class (:foreground nil :background nil :inverse-video t))))
     `(ediff-odd-diff-A ((,class ( :foreground ,base03 :background nil :inverse-video t))))
     `(ediff-odd-diff-B ((,class ( :foreground ,base03 :background nil :inverse-video t))))
     `(git-gutter:added ((,class (:foreground ,base01))))
     `(git-gutter:deleted ((,class (:foreground ,base01))))
     `(git-gutter:modified ((,class (:foreground ,base01))))
     `(diff-hl-insert ((,class (:foreground ,green :background ,base00+1))))
     `(diff-hl-unknown ((,class (:foreground ,orange-1 :background ,base00+1))))
     `(diff-hl-delete ((,class (:foreground ,red-1 :background ,base00+1))))
     `(diff-hl-change ((,class (:foreground ,blue-1 :background ,base00+1))))
     `(eldoc-highlight-function-argument ((,class (:foreground ,green :weight bold))))
     `(undo-tree-visualizer-default-face ((,class (:foreground ,base03))))
     `(undo-tree-visualizer-current-face ((,class (:foreground ,green :weight bold))))
     `(undo-tree-visualizer-active-branch-face ((,class (:foreground ,red))))
     `(undo-tree-visualizer-register-face ((,class (:foreground ,yellow))))
     `(dired-directory ((,class (:inherit ido-subdir))))
     `(dired-header ((,class (:inherit header-line))))
     `(diredp-compressed-file-suffix ((,class (:foreground ,blue))))
     `(diredp-dir-heading ((,class (:inherit dired-header))))
     `(diredp-dir-priv ((,class (:foreground ,cyan :background nil))))
     `(diredp-exec-priv ((,class (:foreground ,blue :background nil))))
     `(diredp-executable-tag ((,class (:foreground ,red :background nil))))
     `(diredp-file-name ((,class (:foreground ,orange))))
     `(diredp-file-suffix ((,class (:foreground ,green))))
     `(diredp-flag-mark-line ((,class (:background nil :inherit highlight))))
     `(diredp-ignored-file-name ((,class (:foreground ,base03))))
     `(diredp-link-priv ((,class (:background nil :foreground ,purple))))
     `(diredp-mode-line-flagged ((,class (:foreground ,red))))
     `(diredp-mode-line-marked ((,class (:foreground ,green))))
     `(diredp-no-priv ((,class (:background nil))))
     `(diredp-number ((,class (:foreground ,orange-1))))
     `(diredp-other-priv ((,class (:background nil :foreground ,purple))))
     `(diredp-rare-priv ((,class (:foreground ,red :background nil))))
     `(diredp-read-priv ((,class (:foreground ,green :background nil))))
     `(diredp-symlink ((,class (:foreground ,purple))))
     `(diredp-write-priv ((,class (:foreground ,yellow :background nil))))
     `(magit-process-ok ((,class (:foreground ,green))))
     `(magit-process-ng ((,class (:foreground ,red))))
     `(magit-tag ((,class (:foreground ,cyan-1))))
     `(magit-log-author ((,class (:foreground ,base02))))
     `(magit-log-date ((,class (:foreground ,base02))))
     `(magit-log-graph ((,class (:foreground ,base02))))
     `(magit-log-head-label-head ((,class (:box nil :background ,base00+1 :foreground ,green-1))))
     `(magit-log-head-label-remote ((,class (:box nil :background ,base00+1 :foreground ,green-1))))
     `(magit-log-head-label-local ((,class (:box nil :background ,base00+1 :foreground ,green-1))))
     `(magit-log-head-label-tags ((,class (:box nil :background ,base00+1 :foreground ,green-1))))
     `(magit-log-head-label-patches ((,class (:box nil :background ,base00+1 :foreground ,green-1))))
     `(magit-hash ((,class (:foreground ,cyan))))
     `(magit-branch ((,class (:background ,base00+1 :foreground ,green-1))))
     `(magit-branch-local ((,class (:foreground ,green-1))))
     `(magit-branch-remote ((,class (:foreground ,green-1))))
     `(magit-branch-label ((,class (:foreground ,green-1))))
     `(magit-branch-current ((,class (:foreground ,green-1))))
     `(magit-head ((,class (:foreground ,indigo))))
     `(magit-section-highlight ((,class (:inherit highlight))))
     `(magit-section-heading ((,class (:foreground ,purple :weight bold))))
     `(magit-dimmed ((,class (:background ,base00-2))))
     `(magit-refname ((,class (:foreground ,orange))))
     `(magit-diff-added ((,class (:foreground ,green :background unspecified))))
     `(magit-diff-removed ((,class (:foreground ,red :background unspecified))))
     `(magit-diff-context ((,class (:foreground unspecified :background unspecified))))
     `(magit-diff-added-highlight ((,class (:foreground ,green :background ,base00-1))))
     `(magit-diff-removed-highlight ((,class (:foreground ,red :background ,base00-1))))
     `(magit-diff-context-highlight ((,class (:foreground unspecified :background ,base00-1))))
     `(magit-diffstat-added ((,class (:foreground ,green :background unspecified))))
     `(magit-diffstat-removed ((,class (:foreground ,red :background unspecified))))
     `(magit-cherry-unmatched ((,class (:foreground ,cyan))))
     `(magit-cherry-equivalent ((,class (:foreground ,purple))))
     `(magit-blame-heading ((,class (:foreground unspecified :background unspecified))))
     `(magit-diff-hunk-heading ((,class (:foreground ,base01))))
     `(magit-diff-hunk-heading-highlight ((,class (:inherit magit-diff-hunk-heading :background ,base00-1))))
     `(magit-diff-hunk-heading-selection ((,class (:foregroud unspecified))))
     `(magit-diff-lines-heading ((,class (:background unspecified))))
     `(magit-popup-argument ((,class (:foreground ,base02))))
     `(magit-popup-disabled-argument ((,class (:foreground ,base01))))
     `(magit-item-highlight ((,class (:background ,highlight-line-color))))
     `(git-commit-summary ((,class (:foreground ,base03))))
     `(git-timemachine-minibuffer-detail-face ((,class (:foreground ,orange))))
     `(ediff-current-diff-A ((,class (:foreground ,base03 :background ,red-1))))
     `(ediff-current-diff-Ancestor ((,class (:foreground ,base03 :background ,red-1))))
     `(ediff-current-diff-B ((,class (:foreground ,base03 :background ,green-1))))
     `(ediff-current-diff-C ((,class (:foreground ,base03 :background ,blue-1))))
     `(ediff-even-diff-A ((,class (:background ,base00+2))))
     `(ediff-even-diff-Ancestor ((,class (:background ,base00+2))))
     `(ediff-even-diff-B ((,class (:background ,base00+2))))
     `(ediff-even-diff-C ((,class (:background ,base00+2))))
     `(ediff-fine-diff-A ((,class (:foreground ,base03 :background ,red-1 :weight bold))))
     `(ediff-fine-diff-Ancestor ((,class (:foreground ,base03 :background ,red-1 :weight bold))))
     `(ediff-fine-diff-B ((,class (:foreground ,base03 :background ,green-1 :weight bold))))
     `(ediff-fine-diff-C ((,class (:foreground ,base03 :background ,blue-1 :weight bold ))))
     `(ediff-odd-diff-A ((,class (:background ,base01))))
     `(ediff-odd-diff-Ancestor ((,class (:background ,base01))))
     `(ediff-odd-diff-B ((,class (:background ,base01))))
     `(ediff-odd-diff-C ((,class (:background ,base01))))
     `(compilation-info ((,class (:foreground ,base02 :underline t))))
     `(compilation-column-number ((,class (:foreground ,base02))))
     `(compilation-line-number ((,class (:foreground ,base02))))
     `(compilation-message-face ((,class (:foreground ,blue))))
     `(compilation-mode-line-exit ((,class (:inherit nil :foreground unspecified :background unspecified))))
     `(compilation-mode-line-fail ((,class (:inherit nil :foreground unspecified :background unspecified))))
     `(compilation-mode-line-run ((,class (:inherit nil :foreground unspecified :background unspecified))))
     `(org-date ((,class (:foreground ,purple))))
     `(org-done ((,class (:foreground ,green))))
     `(org-checkbox ((,class (:foreground ,purple))))
     `(org-agenda-structure ((,class (:foreground ,purple))))
     `(org-agenda-date ((,class (:foreground ,blue :underline nil))))
     `(org-agenda-done ((,class (:foreground ,green))))
     `(org-agenda-dimmed-todo-face ((,class (:foreground ,base03))))
     `(org-code ((,class (:foreground ,orange-1))))
     `(org-column ((,class (:background ,base00+1))))
     `(org-column-title ((,class (:background ,base00 :weight bold :underline t))))
     `(org-document-info ((,class (:foreground ,cyan))))
     `(org-document-info-keyword ((,class (:foreground ,green))))
     `(org-document-title ((,class (:weight bold :foreground ,orange :height 1.44))))
     `(org-ellipsis ((,class (:foreground ,base03))))
     `(org-footnote ((,class (:foreground ,cyan))))
     `(org-formula ((,class (:foreground ,red))))
     `(org-hide ((,class (:foreground ,base02))))
     `(org-link ((,class (:foreground ,blue))))
     `(org-scheduled ((,class (:foreground ,green))))
     `(org-scheduled-previously ((,class (:foreground ,orange))))
     `(org-scheduled-today ((,class (:foreground ,green))))
     `(org-special-keyword ((,class (:foreground ,orange))))
     `(org-table ((,class (:foreground ,purple))))
     `(org-todo ((,class (:foreground ,red))))
     `(org-upcoming-deadline ((,class (:foreground ,orange))))
     `(org-warning ((,class (:weight bold :foreground ,red))))
     `(org-block ((,class (:foreground ,orange :background ,base00+1))))
     `(org-meta-line ((,class (:inherit font-lock-comment-face))))
     `(org-block-end-line ((,class (:inherit font-lock-comment-face))))
     `(org-block-end-line ((,class (:inherit font-lock-comment-face))))
     `(org-block-background ((,class (:background ,base00+1))))
     `(markdown-url-face ((,class (:inherit link))))
     `(markdown-link-face ((,class (:foreground ,blue :underline t))))
     `(js2-warning ((,class (:inherit flycheck-warning))))
     `(js2-error ((,class (:foreground nil :inherit flycheck-error))))
     `(js2-external-variable ((,class (:foreground ,orange))))
     `(js2-function-param ((,class (:foreground ,indigo))))
     `(js2-instance-member ((,class (:foreground ,blue))))
     `(js2-private-function-call ((,class (:foreground ,pink))))
     `(js3-warning-face ((,class (:inherit js2-warning))))
     `(js3-error-face ((,class (:inherit js2-error))))
     `(js3-external-variable-face ((,class (:inherit js2-external-variable))))
     `(js3-function-param-face ((,class (:inherit js2-function-param))))
     `(js3-instance-member-face ((,class (:inherit js2-instance-member))))
     `(js3-private-function-call-face ((,class (:inherit js2-private-function-call))))
     `(js3-jsdoc-tag-face ((,class (:foreground ,orange))))
     `(js3-jsdoc-type-face ((,class (:foreground ,cyan))))
     `(js3-jsdoc-value-face ((,class (:foreground ,orange-1))))
     `(js3-jsdoc-html-tag-name-face ((,class (:foreground ,blue))))
     `(js3-jsdoc-html-tag-delimiter-face ((,class (:foreground ,green))))
     `(erb-face ((,class (:background ,base00+1 :foreground ,base03))))
     `(erb-delim-face ((,class (:background ,base00+1 :foreground ,red))))
     `(erb-exec-face ((,class (:background ,base00+1 :foreground ,base02))))
     `(erb-exec-delim-face ((,class (:background ,base00+1 :foreground ,red))))
     `(erb-out-face ((,class (:background ,base00+1 :foreground ,base03))))
     `(erb-out-delim-face ((,class (:background ,base00+1 :foreground ,red))))
     `(erb-comment-face ((,class (:background ,base00+1 :foreground ,base02))))
     `(erb-comment-delim-face ((,class (:background ,base00+1 :foreground ,base01))))
     `(web-mode-error-face ((,class (:inherit error))))
     `(web-mode-symbol-face ((,class (:inherit font-lock-constant-face))))
     `(web-mode-doctype-face ((,class (:inherit font-lock-comment-face))))
     `(web-mode-html-tag-face ((,class (:inherit font-lock-function-name-face))))
     `(web-mode-html-tag-bracket-face ((,class (:foreground ,purple))))
     `(web-mode-html-attr-name-face ((,class (:inherit font-lock-variable-name-face))))
     `(web-mode-current-element-highlight-face ((,class (:inherit highlight-symbol-face))))
     `(web-mode-current-column-highlight-face ((,class (:inherit hl-line))))
     `(pulse-highlight-face ((,class (:background ,pink))))
     `(pulse-highlight-start-face ((,class (:background ,pink))))
     `(eshell-prompt ((,class (:foreground ,green :weight bold))))
     `(eshell-ls-archive ((,class (:foreground ,teal :weight bold))))
     `(eshell-ls-backup ((,class (:inherit font-lock-comment-face))))
     `(eshell-ls-clutter ((,class (:inherit font-lock-comment-face))))
     `(eshell-ls-directory ((,class (:foreground ,brown :weight bold))))
     `(eshell-ls-executable ((,class (:foreground ,red :weight bold))))
     `(eshell-ls-unreadable ((,class (:inherit font-lock-comment-face))))
     `(eshell-ls-missing ((,class (:inherit font-lock-warning-face))))
     `(eshell-ls-product ((,class (:inherit font-lock-doc-face))))
     `(eshell-ls-special ((,class (:foreground ,orange :weight bold))))
     `(eshell-ls-symlink ((,class (:foreground ,purple :weight bold))))
     `(erc-action-face ((,class (:inherit erc-default-face))))
     `(erc-bold-face ((,class (:weight bold))))
     `(erc-current-nick-face ((,class (:foreground ,blue :weight bold))))
     `(erc-dangerous-host-face ((,class (:inherit font-lock-warning-face))))
     `(erc-default-face ((,class (:foreground ,base03))))
     `(erc-direct-msg-face ((,class (:inherit erc-default))))
     `(erc-error-face ((,class (:inherit font-lock-warning-face))))
     `(erc-fool-face ((,class (:inherit erc-default))))
     `(erc-highlight-face ((,class (:inherit hover-highlight))))
     `(erc-input-face ((,class (:foreground ,yellow))))
     `(erc-keyword-face ((,class (:foreground ,blue :weight bold))))
     `(erc-nick-default-face ((,class (:foreground ,yellow :weight bold))))
     `(erc-my-nick-face ((,class (:foreground ,red :weight bold))))
     `(erc-nick-msg-face ((,class (:inherit erc-default))))
     `(erc-notice-face ((,class (:foreground ,green))))
     `(erc-pal-face ((,class (:foreground ,orange :weight bold))))
     `(erc-prompt-face ((,class (:foreground ,orange :background ,base00 :weight bold))))
     `(erc-timestamp-face ((,class (:foreground ,green))))
     `(erc-underline-face ((,class (:underline t)))))

    (custom-theme-set-variables
     theme-name
     `(evil-emacs-state-cursor '(,red bar))
     `(evil-insert-state-cursor '(,red hbar))
     `(evil-normal-state-cursor '(,yellow box))
     `(evil-visual-state-cursor '(,green box))
     `(pos-tip-foreground-color ,base02)
     `(pos-tip-background-color ,base00-1)

     `(highlight-symbol-foreground-color ,base03)
     `(highlight-symbol-colors '(,yellow
                                 ,green
                                 ,cyan
                                 ,blue
                                 ,purple
                                 ,orange))
     `(beacon-color ,flashing-color)
     `(highlight-tail-colors
       '((,flashing-color . 0) (,base00 . 100)))

     `(tabbar-background-color ,base00-2)

     `(ansi-color-names-vector
       [,base00 ,red-1 ,green ,yellow ,blue ,purple ,cyan ,base03])
     `(ansi-term-color-vector
       [unspecified ,base00 ,red-1 ,green ,yellow ,blue ,purple ,cyan ,base03]))))

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide 'apropospriate)

;; Local Variables:
;; no-byte-compile: t
;; eval: (when (require 'rainbow-mode nil t) (rainbow-mode 1))
;; fill-column: 105
;; End:
;;; apropospriate.el ends here
