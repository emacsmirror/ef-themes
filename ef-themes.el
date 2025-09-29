;;; ef-themes.el --- Colorful and legible themes -*- lexical-binding:t -*-

;; Copyright (C) 2022-2025  Free Software Foundation, Inc.

;; Author: Protesilaos Stavrou <info@protesilaos.com>
;; Maintainer: Protesilaos Stavrou <info@protesilaos.com>
;; URL: https://github.com/protesilaos/ef-themes
;; Version: 1.11.0
;; Package-Requires: ((emacs "28.1") (modus-themes "4.9.0"))
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
;;
;; "Ef" is a Greek word (ευ), commonly used as a prefix to denote
;; something good, nice, and/or easy.  For example, eftopia (ευτοπία)
;; is the opposite of dystopia (δυστοπία): a good place as opposed to
;; a bad place.
;;
;; The backronym of the `ef-themes' is: Eclectic Fashion in Themes
;; Hides Exaggerated Markings, Embellishments, and Sparkles.

;;; Code:



(require 'seq)
(require 'modus-themes)
(eval-when-compile (require 'subr-x))

;;;; Basics for building on top of Modus

(defconst ef-themes-light-themes
  '(ef-arbutus
    ef-cyprus
    ef-day
    ef-deuteranopia-light
    ef-duo-light
    ef-eagle
    ef-elea-light
    ef-frost
    ef-kassio
    ef-light
    ef-maris-light
    ef-melissa-light
    ef-reverie
    ef-spring
    ef-summer
    ef-trio-light
    ef-tritanopia-light)
  "List of symbols with the light Ef themes.")

(defconst ef-themes-dark-themes
  '(ef-autumn
    ef-bio
    ef-cherie
    ef-dark
    ef-deuteranopia-dark
    ef-dream
    ef-duo-dark
    ef-elea-dark
    ef-maris-dark
    ef-melissa-dark
    ef-night
    ef-owl
    ef-rosa
    ef-symbiosis
    ef-trio-dark
    ef-tritanopia-dark
    ef-winter)
  "List of symbols with the dark Ef themes.")

(defvaralias 'ef-themes-collection 'ef-themes-items
  "Alias of `ef-themes-items'.")

(defconst ef-themes-items
  (append ef-themes-light-themes ef-themes-dark-themes)
  "Symbols of all the Ef themes.")

(defconst ef-themes-with-properties
  '((ef-arbutus ef-themes "Legible light pink theme with red and green colors." light modus-operandi-palette ef-arbutus-palette ef-arbutus-palette-overrides)
    (ef-autumn ef-themes "Legible dark brown-black theme with warm colors (red, yellow, green, teal)." dark modus-vivendi-palette ef-autumn-palette ef-autumn-palette-overrides)
    (ef-bio ef-themes "Legible dark green-black theme with green, teal, blue, purple colors." dark modus-vivendi-palette ef-bio-palette ef-bio-palette-overrides)
    (ef-cherie ef-themes "Legible dark purple-black theme with warm colors (mostly pink, magenta, gold)." dark modus-vivendi-palette ef-cherie-palette ef-cherie-palette-overrides)
    (ef-cyprus ef-themes "Legible light ochre theme with green, yellow, teal, red colors." light modus-operandi-palette ef-cyprus-palette ef-cyprus-palette-overrides)
    (ef-dark ef-themes "Legible dark theme with blue, magenta, cyan, purple colors." dark modus-vivendi-palette ef-dark-palette ef-dark-palette-overrides)
    (ef-day ef-themes "Legible light sandy theme with warm, varied colors (yellow, red, green, purple)." light modus-operandi-palette ef-day-palette ef-day-palette-overrides)
    (ef-deuteranopia-dark ef-themes "Legible dark theme, optimized for red-green color deficiency." dark modus-vivendi-deuteranopia-palette ef-deuteranopia-dark-palette ef-deuteranopia-dark-palette-overrides)
    (ef-deuteranopia-light ef-themes "Legible light theme, optimized for red-green color deficiency." light modus-operandi-deuteranopia-palette ef-deuteranopia-light-palette ef-deuteranopia-light-palette-overrides)
    (ef-dream ef-themes "Legible dark purple grey theme with gold and nuanced colors." dark modus-vivendi-palette ef-dream-palette ef-dream-palette-overrides)
    (ef-duo-dark ef-themes "Legible dark theme with mostly blue and orange colors." dark modus-vivendi-palette ef-duo-dark-palette ef-duo-dark-palette-overrides)
    (ef-duo-light ef-themes "Legible light theme with mostly blue and yellow colors." light modus-operandi-palette ef-duo-light-palette ef-duo-light-palette-overrides)
    (ef-eagle ef-themes "Legible light beige theme with brown, red, and desatured colors." light modus-operandi-palette ef-eagle-palette ef-eagle-palette-overrides)
    (ef-elea-dark ef-themes "Legible dark green theme with brown, magenta, and green colors." dark modus-vivendi-palette ef-elea-dark-palette ef-elea-dark-palette-overrides)
    (ef-elea-light ef-themes "Legible light green theme with brown, magenta, and green colors." light modus-operandi-palette ef-elea-light-palette ef-elea-light-palette-overrides)
    (ef-frost ef-themes "Legible light cool theme with blue, cyan, teal, purple colors." light modus-operandi-palette ef-frost-palette ef-frost-palette-overrides)
    (ef-kassio ef-themes "Legible light grey theme with blue, red, magenta, and earthly colors." light modus-operandi-palette ef-kassio-palette ef-kassio-palette-overrides)
    (ef-light ef-themes "Legible light theme with blue, magenta, cyan, purple colors." light modus-operandi-palette ef-light-palette ef-light-palette-overrides)
    (ef-maris-dark ef-themes "Legible dark marine theme with blue, cyan, and green colors." dark modus-vivendi-palette ef-maris-dark-palette ef-maris-dark-palette-overrides)
    (ef-maris-light ef-themes "Legible light marine theme with blue, cyan, and green colors." light modus-operandi-palette ef-maris-light-palette ef-maris-light-palette-overrides)
    (ef-melissa-dark ef-themes "Legible dark honeybee theme with warm colors (yellow, red, green, cyan)." dark modus-vivendi-palette ef-melissa-dark-palette ef-melissa-dark-palette-overrides)
    (ef-melissa-light ef-themes "Legible light honeybee theme with warm colors (yellow, red, green, cyan)." light modus-operandi-palette ef-melissa-light-palette ef-melissa-light-palette-overrides)
    (ef-night ef-themes "Legible dark sky blue theme with mostly green, blue, purple colors." dark modus-vivendi-palette ef-night-palette ef-night-palette-overrides)
    (ef-owl ef-themes "Legible dark grey theme with blue, cyan, magenta and desaturated colors." dark modus-vivendi-palette ef-owl-palette ef-owl-palette-overrides)
    (ef-reverie ef-themes "Legible light cream theme with gold and nuanced colors." light modus-operandi-palette ef-reverie-palette ef-reverie-palette-overrides)
    (ef-rosa ef-themes "Legible dark rosewood theme with magenta and green colors." dark modus-vivendi-palette ef-rosa-palette ef-rosa-palette-overrides)
    (ef-spring ef-themes "Legible light floral theme with cool, varied colors (green, cyan, red)." light modus-operandi-palette ef-spring-palette ef-spring-palette-overrides)
    (ef-summer ef-themes "Legible light warm pink theme with magenta, purple, gold, cyan colors." light modus-operandi-palette ef-summer-palette ef-summer-palette-overrides)
    (ef-symbiosis ef-themes "Legible dark brown-black theme with blue, green, cyan, gold colors." dark modus-vivendi-palette ef-symbiosis-palette ef-symbiosis-palette-overrides)
    (ef-trio-dark ef-themes "Legible dark purple grey theme with magenta, blue, teal colors." dark modus-vivendi-palette ef-trio-dark-palette ef-trio-dark-palette-overrides)
    (ef-trio-light ef-themes "Legible light purple grey theme with magenta, blue, and teal colors." light modus-operandi-palette ef-trio-light-palette ef-trio-light-palette-overrides)
    (ef-tritanopia-dark ef-themes "Legible dark theme, optimized for blue-yellow color deficiency." dark modus-vivendi-tritanopia-palette ef-tritanopia-dark-palette ef-tritanopia-dark-palette-overrides)
    (ef-tritanopia-light ef-themes "Legible light theme, optimized for blue-yellow color deficiency." light modus-operandi-tritanopia-palette ef-tritanopia-light-palette ef-tritanopia-light-palette-overrides)
    (ef-winter ef-themes "Legible dark purple-black theme with magenta, purple, fawn, teal colors." dark modus-vivendi-palette ef-winter-palette ef-winter-palette-overrides)))

(defvar ef-themes--declared-p nil)

(defun ef-themes-declare-themes ()
  "Declare the Ef themes."
  (unless ef-themes--declared-p
    (dolist (theme ef-themes-with-properties)
      (apply #'modus-themes-declare theme)
      (modus-themes-register (car theme)))
    (setq ef-themes--declared-p t)))

(ef-themes-declare-themes)

(defconst ef-themes-palette-common
  '((bg-diff-context bg-dim)
    (bg-line-number-active unspecified)
    (bg-line-number-inactive unspecified)
    (bg-mode-line-inactive bg-alt)
    (bg-space unspecified)
    (bg-tab-bar bg-alt)
    (bg-tab-current bg-main)
    (bg-tab-other bg-active)
    (border-mode-line-active border)
    (border-mode-line-inactive border)
    (fg-line-number-active accent-0)
    (fg-mode-line-inactive fg-dim)
    (fg-region unspecified)
    (fg-space border)
    (fringe unspecified)

    (fg-heading-0 rainbow-0)
    (fg-heading-1 rainbow-1)
    (fg-heading-2 rainbow-2)
    (fg-heading-3 rainbow-3)
    (fg-heading-4 rainbow-4)
    (fg-heading-5 rainbow-5)
    (fg-heading-6 rainbow-6)
    (fg-heading-7 rainbow-7)
    (fg-heading-8 rainbow-8))
  "Common palette mappings for the Ef themes.")

;;;; Compatibility with older versions of the Ef themes

(define-obsolete-function-alias 'ef-themes-rotate 'modus-themes-rotate
  "Since version 2.0.0, `ef-themes' derive from the `modus-themes'; enable `ef-themes-take-over-modus-themes-mode'")

(define-obsolete-function-alias 'ef-themes-toggle 'modus-themes-toggle
  "Since version 2.0.0, `ef-themes' derive from the `modus-themes'; enable `ef-themes-take-over-modus-themes-mode'")

(define-obsolete-variable-alias 'ef-themes-disable-other-themes 'modus-themes-disable-other-themes
  "Since version 2.0.0, `ef-themes' derive from the `modus-themes'; enable `ef-themes-take-over-modus-themes-mode'")

(define-obsolete-variable-alias 'ef-themes-headings 'modus-themes-headings
  "Since version 2.0.0, `ef-themes' derive from the `modus-themes'; enable `ef-themes-take-over-modus-themes-mode'")

(define-obsolete-variable-alias 'ef-themes-mixed-fonts 'modus-themes-mixed-fonts
  "Since version 2.0.0, `ef-themes' derive from the `modus-themes'; enable `ef-themes-take-over-modus-themes-mode'")

(define-obsolete-variable-alias 'ef-themes-to-rotate 'modus-themes-to-rotate
  "Since version 2.0.0, `ef-themes' derive from the `modus-themes'; enable `ef-themes-take-over-modus-themes-mode'")

(define-obsolete-variable-alias 'ef-themes-to-toggle 'modus-themes-to-toggle
  "Since version 2.0.0, `ef-themes' derive from the `modus-themes'; enable `ef-themes-take-over-modus-themes-mode'")

(define-obsolete-variable-alias 'ef-themes-common-palette-overrides 'modus-themes-common-palette-overrides
  "Since version 2.0.0, `ef-themes' derive from the `modus-themes'; enable `ef-themes-take-over-modus-themes-mode'")

(define-obsolete-variable-alias 'ef-themes-variable-pitch-ui 'modus-themes-variable-pitch-ui
  "Since version 2.0.0, `ef-themes' derive from the `modus-themes'; enable `ef-themes-take-over-modus-themes-mode'")

(define-obsolete-variable-alias 'ef-themes-after-load-theme-hook 'modus-themes-after-load-theme-hook
  "Since version 2.0.0, `ef-themes' derive from the `modus-themes'; enable `ef-themes-take-over-modus-themes-mode'")

(define-obsolete-variable-alias 'ef-themes-post-load-hook 'modus-themes-post-load-hook
  "Since version 2.0.0, `ef-themes' derive from the `modus-themes'; enable `ef-themes-take-over-modus-themes-mode'")

;;;; Limit the Modus themes to only Ef themes

;;;###autoload
(define-minor-mode ef-themes-take-over-modus-themes-mode
  "When enabled, all Modus themes commands consider only Ef themes."
  :global t
  :init-value nil)

(cl-defmethod modus-themes-get-themes (&context (ef-themes-take-over-modus-themes-mode (eql t)))
  (modus-themes-get-all-known-themes 'ef-themes))

;;;; Add themes from package to path

;;;###autoload
(when load-file-name
  (let ((dir (file-name-directory load-file-name)))
    (unless (file-equal-p dir (expand-file-name "themes/" data-directory))
      (add-to-list 'custom-theme-load-path dir))))

(provide 'ef-themes)
;;; ef-themes.el ends here
