;;; key config

;; exchange alt <-> meta
(custom-set-variables
 '(ns-alternate-modifier 'alt)
 '(ns-command-modifier   'meta))

;; exchange C-j <-> C-m
;; (keyboard-translate ?\C-j ?\C-m)
;; (keyboard-translate ?\C-m ?\C-j)

;; full screen setting
(defun my-mac-toggle-max-window ()
  (interactive)
  (if (frame-parameter nil 'fullscreen)
      (set-frame-parameter nil 'fullscreen nil)
    (set-frame-parameter nil 'fullscreen 'fullboth)))
(global-set-key "\C-cm" 'my-mac-toggle-max-window)


;; global-set-key
(define-key global-map (kbd "C-h") 'delete-backward-char)
(define-key global-map (kbd "C-o") 'other-window)

;; sticky
;; (auto-install-from-emacswiki "sticky.el")
;; (require 'sticky)
;; (use-sticky-key ?\; sticky-alist:en)
