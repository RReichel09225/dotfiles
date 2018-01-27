;;; packages.el --- beancount layer packages file for Spacemacs.

(defconst beancount-packages
  '(
    (beancount :location local)
    ))

(defun beancount/init-beancount ()
  (use-package beancount
    :mode ("\\.beancount\\'" . beancount-mode)
    :defer t
    ))
