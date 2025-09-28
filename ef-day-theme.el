;;; ef-day-theme.el --- Legible light theme with warm, varied colors (yellow, red, green, purple) -*- lexical-binding:t -*-

;; Copyright (C) 2022-2024  Free Software Foundation, Inc.

;; Author: Protesilaos Stavrou <info@protesilaos.com>
;; Maintainer: Protesilaos Stavrou <info@protesilaos.com>
;; URL: https://github.com/protesilaos/ef-themes
;; Keywords: faces, theme, accessibility

;; This file is NOT part of GNU Emacs.

;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; The `ef-themes' are a collection of light and dark themes for GNU
;; Emacs whose goal is to provide colorful ("pretty") yet legible
;; options for users who want something with a bit more flair than the
;; `modus-themes' (also designed by me).

;;; Code:



(eval-and-compile
  (require 'ef-themes)

  (defconst ef-day-partial
    '((cursor "#cf1f00")
      (bg-main "#fff5ea")
      (bg-dim "#f2e9db")
      (bg-alt "#e9e0d8")
      (fg-main "#584141")
      (fg-dim "#63728f")
      (fg-alt "#8f5f4a")
      (bg-active "#c9c0b8")
      (bg-inactive "#f7efe6")
      (border "#c8bdb6")

      (red "#ba2d2f")
      (red-warmer "#ce3f00")
      (red-cooler "#cf2f4f")
      (red-faint "#b05350")
      (green "#007a0a")
      (green-warmer "#5f7200")
      (green-cooler "#0f7f5f")
      (green-faint "#527545")
      (yellow "#a45a22")
      (yellow-warmer "#b75515")
      (yellow-cooler "#aa4f30")
      (yellow-faint "#9a625a")
      (blue "#375cc6")
      (blue-warmer "#5f5fdf")
      (blue-cooler "#265fbf")
      (blue-faint "#4a659f")
      (magenta "#ca3e54")
      (magenta-warmer "#cb2f80")
      (magenta-cooler "#8448aa")
      (magenta-faint "#a04450")
      (cyan "#3f60af")
      (cyan-warmer "#3f6faf")
      (cyan-cooler "#0f7b8f")
      (cyan-faint "#4f6f8f")

      (bg-red-intense "#ff8f88")
      (bg-green-intense "#96df80")
      (bg-yellow-intense "#efbf00")
      (bg-blue-intense "#cfceff")
      (bg-magenta-intense "#df9fff")
      (bg-cyan-intense "#88cfd0")

      (bg-red-subtle "#ffc6bf")
      (bg-green-subtle "#c4f2af")
      (bg-yellow-subtle "#f0f07f")
      (bg-blue-subtle "#ccdfff")
      (bg-magenta-subtle "#fad3ff")
      (bg-cyan-subtle "#bfefff")

      (bg-added "#ccefcf")
      (bg-added-faint "#e0f3e0")
      (bg-added-refine "#bae0c0")
      (fg-added "#005000")

      (bg-changed "#ffe5b9")
      (bg-changed-faint "#ffefc5")
      (bg-changed-refine "#ffd09f")
      (fg-changed "#553d00")

      (bg-removed "#ffd4d8")
      (bg-removed-faint "#ffe3e3")
      (bg-removed-refine "#ffc0ca")
      (fg-removed "#8f1313")

      (bg-mode-line-active "#ffaf72")
      (fg-mode-line-active "#542f38")
      (bg-completion "#ffd5d3")
      (bg-hover "#b0e0df")
      (bg-hover-secondary "#febccf")
      (bg-hl-line "#f9e2b2")
      (bg-paren-match "#8fcfdf")
      (bg-region "#f0d2df")
      (bg-err "#ffdde5") ; check with err
      (bg-warning "#ffe0aa") ; check with warning
      (bg-info "#ddf5cc") ; check with info

      (err red-warmer)
      (warning yellow)
      (info green)

      (link cyan-warmer)
      (link-alt green-warmer)
      (name yellow)
      (keybind red-warmer)
      (identifier magenta-faint)
      (prompt yellow)
      
      (builtin red-cooler)
      (comment green-faint)
      (constant red-warmer)
      (fnname magenta)
      (keyword yellow)
      (preprocessor cyan-warmer)
      (docstring yellow-faint)
      (string green-warmer)
      (type green-cooler)
      (variable magenta-cooler)
      (rx-escape blue) ; compare with `string'
      (rx-construct magenta-warmer)

      (accent-0 red)
      (accent-1 green-cooler)
      (accent-2 yellow)
      (accent-3 magenta-warmer)

      (date-common cyan-cooler)
      (date-deadline red)
      (date-deadline-subtle red-faint)
      (date-event fg-alt)
      (date-holiday red-warmer)
      (date-now fg-main)
      (date-range fg-alt)
      (date-scheduled yellow)
      (date-scheduled-subtle yellow-faint)
      (date-weekday cyan)
      (date-weekend red-faint)

      (prose-code green-cooler)
      (prose-done green)
      (prose-macro yellow)
      (prose-metadata fg-dim)
      (prose-metadata-value fg-alt)
      (prose-table fg-alt)
      (prose-table-formula info)
      (prose-tag yellow-faint)
      (prose-todo red-warmer)
      (prose-verbatim red)

      (mail-cite-0 red)
      (mail-cite-1 green-cooler)
      (mail-cite-2 yellow)
      (mail-cite-3 cyan-warmer)
      (mail-part red-faint)
      (mail-recipient yellow)
      (mail-subject red-warmer)
      (mail-other green-warmer)

      (bg-search-match bg-warning)
      (bg-search-current bg-yellow-intense)
      (bg-search-lazy bg-blue-intense)
      (bg-search-replace bg-red-intense)

      (bg-search-rx-group-0 bg-magenta-intense)
      (bg-search-rx-group-1 bg-green-intense)
      (bg-search-rx-group-2 bg-red-subtle)
      (bg-search-rx-group-3 bg-cyan-subtle)

      (bg-space-err bg-yellow-intense)

      (rainbow-0 yellow)
      (rainbow-1 red)
      (rainbow-2 green-warmer)
      (rainbow-3 magenta-warmer)
      (rainbow-4 cyan)
      (rainbow-5 yellow-cooler)
      (rainbow-6 magenta-cooler)
      (rainbow-7 red-cooler)
      (rainbow-8 green-cooler))
    "Legible light sandy theme with warm, varied colors (yellow, red, green, purple).")

  (defcustom ef-day-palette-overrides nil
    "Overrides for `ef-day-palette'.

Mirror the elements of the aforementioned palette, overriding
their value.

For overrides that are shared across all of the Ef themes,
refer to `ef-themes-common-palette-overrides'.

To preview the palette entries, use `ef-themes-preview-colors' or
`ef-themes-preview-colors-current' (read the documentation for
further details)."
  :group 'ef-themes
  :package-version '(ef-themes . "1.0.0")
  :type '(repeat (list symbol (choice symbol string)))
  :link '(info-link "(ef-themes) Palette overrides"))

  (defconst ef-themes-day-palette
    (append ef-themes-common-palette-overrides ef-day-partial ef-themes-palette-common))

  (modus-themes-theme
    ef-day
    ef-themes
    "Legible light sandy theme with warm, varied colors (yellow, red, green, purple)."
    light
    modus-operandi-palette
    ef-themes-day-palette
    ef-day-palette-overrides))

;;; ef-day-theme.el ends here
