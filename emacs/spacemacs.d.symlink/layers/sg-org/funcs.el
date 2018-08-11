;; Inspired by:
;; https://cestlaz.github.io/posts/using-emacs-24-capture-2/
;; http://www.windley.com/archives/2010/12/capture_mode_and_emacs.shtml
;;
;; Bind key to: emacsclient --eval "(sg/make-org-capture-frame)"
;; For example with Keyboard Maestro, Alfred, Quicksilver, OSX AppleScript services, XMonad, etc

(provide 'sg-org)

(defun sg/make-org-capture-frame ()
  "Create a new frame and run `org-capture'."
  (interactive)
  (select-frame (make-frame '((sg/org-capture-frame . t))))
  (sg/move-frame-center)
  (x-focus-frame nil)
  (delete-other-windows)
  (cl-letf (((symbol-function 'switch-to-buffer-other-window) #'switch-to-buffer))
    (condition-case err
        (org-capture)
      ;; Delete the newly-created frame in case of any error: typing "q", choosing an illegal
      ;; template key, aborting with C-c C-k all generate errors (among other error cases).
      (error (delete-frame)))))

(defun sg/delete-org-capture-frame ()
  "Delete the newly-created `org-mode' frame."
  (when (frame-parameter nil 'sg/org-capture-frame)
    (delete-frame)))

(defun sg/move-frame-center ()
  "Move the selected frame to the center of the display."
  (interactive)
  (let* ((FHEIGHT   (frame-pixel-height))
         (FWIDTH    (frame-pixel-width))
         (DGEOMETRY (assoc 'geometry (car (display-monitor-attributes-list))))
         (DWIDTH    (nth 3 DGEOMETRY))
         (DHEIGHT   (nth 4 DGEOMETRY))
         (CX        (- (/ DWIDTH 2) (/ FWIDTH 2)))
         (CY        (- (/ DHEIGHT 2) (/ FHEIGHT 2))))
    (set-frame-position (selected-frame) CX CY)))
