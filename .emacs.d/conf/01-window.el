;;; window
(custom-set-variables
 '(menu-bar-mode nil))

;; color
;;   temp
(set-foreground-color "white")
(set-background-color "black")
(custom-set-faces
 '(default ((t
             (:background "black" :foreground "#FFFFFF")
             )))
 '(cursor ((((class color)
             (background dark))
            (:background "light blue"))
           (((class color)
             (background light))
            (:background "#999999"))
           (t ())
           )))

;; @ color-theme
(require 'color-theme)
(color-theme-initialize)
(color-theme-arjen)