;;; flycheck-neut.el --- flycheck: neut support -*- lexical-binding: t; -*-

;; Author: u2zv1wx <u2zv1wx@protonmail.ch>
;; Package-Requires: ((emacs "24.1") (flycheck "28"))

;;; Code:

(require 'flycheck)

(flycheck-define-checker neut
  "A syntax checker fon Neut using the compiler."
  ;; :command ("neut check --no-color --end-of-entry EOE" source-inplace) ;; inplace must be used to handle relative include
  :command ("neut" "check" "--no-color" "--end-of-entry" "EOE" source-inplace) ;; inplace must be used to handle relative include
  :error-patterns
  ((info line-start (file-name) ":" line ":" column ":" (? "\r") "\n"
         "note: " (message (minimal-match (one-or-more anything))) (? "\r") "\n"
         "EOE" line-end)
   (warning line-start (file-name) ":" line ":" column ":" (? "\r") "\n"
            "warning: " (message (minimal-match (one-or-more anything))) (? "\r") "\n"
            "EOE" line-end)
   (error line-start (file-name) ":" line ":" column ":" (? "\r") "\n"
          "error: " (message (minimal-match (one-or-more anything))) (? "\r") "\n"
          "EOE" line-end)
   (error line-start (file-name) ":" line ":" column ":" (? "\r") "\n"
          "critical: " (message (minimal-match (one-or-more anything))) (? "\r") "\n"
          "EOE" line-end))
  :modes (neut-mode))

(provide 'flycheck-neut)

;;; flycheck-neut ends here
