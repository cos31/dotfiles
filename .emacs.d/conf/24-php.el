(require 'php-mode nil t)

(defun ac-php-mode-setup ()
  (setq ac-sources (append '(ac-source-yasnippet ac-source-gtags) ac-sources)))
(add-hook 'php-mode-hook 'ac-php-mode-setup)

;; (when (and (require 'flymake nil t)
;;            (fboundp 'flymake-php-init))
;;   (add-hook 'php-mode-hook 'xcezx/flymake-mode-on))

(c-add-style "php/symfony"
             '((c-basic-offset . 2)
               (c-offsets-alist . (
                                   (defun-open            . 0)
                                   (defun-close           . 0)
                                   (defun-block-intro     . +)
                                   (topmost-intro         . 0)
                                   (topmost-intro-cont    . c-lineup-topmost-intro-cont)
                                   (block-open            . 0)
                                   (block-close           . 0)
                                   (statement             . 0)
                                   (statement-cont        . +)
                                   (statement-block-intro . +)
                                   (statement-case-intro  . +)
                                   (statement-case-open   . 0)
                                   (substatement          . +)
                                   (substatement-open     . 0)
                                   (case-label            . +)
                                   (comment-intro         . (c-lineup-knr-region-comment c-lineup-comment))
                                   (arglist-intro         . +)
                                   (arglist-cont          . (c-lineup-gcc-asm-reg 0))
                                   (arglist-cont-nonempty . +)
                                   (arglist-close         . 0)
                                   ))))

(c-add-style "php/zend"
             '((c-basic-offset . 4)
               (c-offsets-alist . (
                                   (defun-open            . 0)
                                   (defun-close           . 0)
                                   (defun-block-intro     . +)
                                   (topmost-intro         . 0)
                                   (topmost-intro-cont    . c-lineup-topmost-intro-cont)
                                   (block-open            . 0)
                                   (block-close           . 0)
                                   (statement             . 0)
                                   (statement-cont        . +)
                                   (statement-block-intro . +)
                                   (statement-case-intro  . +)
                                   (statement-case-open   . +)
                                   (substatement          . +)
                                   (substatement-open     . 0)
                                   (case-label            . +)
                                   (arglist-intro         . +)
                                   (arglist-cont          . (c-lineup-gcc-asm-reg 0))
                                   (arglist-cont-nonempty . +)
                                   (arglist-close         . 0)
                                   ))))

(c-add-style "php/dietcake"
             '((c-basic-offset . 4)
               (c-offsets-alist . (
                                   (defun-open            . 0)
                                   (defun-close           . 0)
                                   (defun-block-intro     . +)
                                   (topmost-intro         . 0)
                                   (topmost-intro-cont    . c-lineup-topmost-intro-cont)
                                   (block-open            . 0)
                                   (block-close           . 0)
                                   (statement             . 0)
                                   (statement-cont        . +)
                                   (statement-block-intro . +)
                                   (statement-case-intro  . +)
                                   (statement-case-open   . +)
                                   (substatement          . +)
                                   (substatement-open     . 0)
                                   (case-label            . 0)
                                   (arglist-intro         . +)
                                   (arglist-cont          . (c-lineup-gcc-asm-reg 0))
                                   (arglist-cont-nonempty . +)
                                   (arglist-close         . 0)
                                   ))))

(defcustom xcezx/default-php-indentation-style "php/symfony"
  "PHP indentation style."
  :type '(choice (string :tag "Symfony" "php/symfony")
                 (string :tag "Zend Framework" "php/zend")
                 (string :tag "Dietcake" "php/dietcake"))
  :group 'xcezx)

(defun xcezx/php-mode-hook ()
  (hs-minor-mode t)
  (define-key hs-minor-mode-map (kbd "C-c h c") 'hs-toggle-hiding)
  (define-key hs-minor-mode-map (kbd "C-c h h") 'hs-hide-block)
  (define-key hs-minor-mode-map (kbd "C-c h s") 'hs-show-block)
  (define-key hs-minor-mode-map (kbd "C-c h H") 'hs-hide-all)
  (define-key hs-minor-mode-map (kbd "C-c h S") 'hs-show-all)
  (define-key hs-minor-mode-map (kbd "C-c h l") 'hs-hide-level)
  (c-set-style xcezx/default-php-indentation-style)

  (when (require 'php-completion nil t)
    (php-completion-mode t)
    (define-key php-mode-map (kbd "C-o") 'dabbrev-expand)
    (define-key php-mode-map (kbd "M-o") 'phpcmp-complete)
    (when (require 'auto-complete nil t)
      (add-to-list 'ac-sources 'ac-source-php-completion))))

(add-hook 'php-mode-hook 'xcezx/php-mode-hook)


;; Local Variables:
;; mode: Emacs-Lisp
;; coding: utf-8
;; End:
