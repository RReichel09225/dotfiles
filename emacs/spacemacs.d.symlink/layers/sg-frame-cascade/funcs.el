;; Cascade new frames from the last actively focussed frame.
;; Requires emacs 26.x

(provide 'sg-frame-cascade)

;; Set hooks
;; move-frame-functions requires emacs 26.x
(add-hook 'move-frame-functions (lambda (&optional arg) (sg/set-frame-cascade-default-frame-alist arg "move-frame-functons")))
(add-hook 'focus-in-hook (lambda (&optional arg) (sg/set-frame-cascade-default-frame-alist arg "focus-in-hook")))
(advice-add 'select-frame :after (lambda (&optional arg &rest args) (sg/set-frame-cascade-default-frame-alist arg "select-frame" args)))

;; move-frame-functions requires emacs 26.x
;; (add-hook 'move-frame-functions #'sg/set-frame-cascade-default-frame-alist)
;; (add-hook 'focus-in-hook #'sg/set-frame-cascade-default-frame-alist)
;; (advice-add 'select-frame-set-input-focus :after #'sg/set-frame-cascade-default-frame-alist)
;; (advice-add 'handle-switch-frame :after #'sg/set-frame-cascade-default-frame-alist)
;; (add-hook 'after-make-frame-functions #'sg/set-frame-cascade-default-frame-alist)

(defun sg/set-frame-cascade-default-frame-alist (&optional arg name &rest _)
  "Set `default-frame-alist' with a cascade offset."
  (let* ((FRAME (if (frame-live-p arg) arg nil))
         (NAME (if name name "anon"))
         (LEFT (+ 22 (car (frame-position FRAME))))
         (TOP  (+ 22 (cdr (frame-position FRAME)))))
    (setf (alist-get 'left default-frame-alist) LEFT)
    (setf (alist-get 'top default-frame-alist) TOP)
    ;; (message "%s: LEFT %s, TOP %s" NAME LEFT TOP)
    )
  nil)
