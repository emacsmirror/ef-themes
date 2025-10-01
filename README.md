# Ef (εὖ) themes for GNU Emacs

IMAGES HERE: <https://protesilaos.com/emacs/ef-themes-pictures>.

The `ef-themes` are a collection of light and dark themes for GNU Emacs
whose goal is to provide colorful ("pretty") yet legible options for
users who want something with a bit more flair than the `modus-themes`
(also designed by me).

Starting with version `2.0.0`, the `ef-themes` are built on top of the
`modus-themes`. This means that all customisation options of the Modus
themes apply to the Ef themes. Same for all Modus commands that load a
theme. Enable `ef-themes-take-over-modus-themes-mode` to set up this
arrangement.

+ Package name (GNU ELPA): `ef-themes`
+ Official manual: <https://protesilaos.com/emacs/ef-themes>
+ Change log: <https://protesilaos.com/emacs/ef-themes-changelog>
+ Sample pictures: <https://protesilaos.com/emacs/ef-themes-pictures>
+ Git repositories:
  + GitHub: <https://github.com/protesilaos/ef-themes>
  + GitLab: <https://gitlab.com/protesilaos/ef-themes>
+ Backronym: Eclectic Fashion in Themes Hides Exaggerated Markings,
  Embellishments, and Sparkles.

```elisp
(use-package ef-themes
  :ensure t
  :init
  ;; This makes the Modus commands listed below consider only the Ef
  ;; themes.  For an alternative that includes Modus and all
  ;; derivative themes (like Ef), enable the
  ;; `modus-themes-include-derivatives-mode' instead.
  (ef-themes-take-over-modus-themes-mode 1)
  :bind
  (("<f5>" . modus-themes-rotate)
   ("C-<f5>" . modus-themes-select)
   ("M-<f5>" . modus-themes-load-random))
  :config
  ;; All customisations here.
  (setq modus-themes-mixed-fonts t)
  (setq modus-themes-italic-constructs t))
```
