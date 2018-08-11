(add-hook 'org-capture-after-finalize-hook #'sg/delete-org-capture-frame)

;; Disble Helm for org-capture (do not show previous TODO titles)
(spacemacs|use-package-add-hook helm
  :post-config
    (add-to-list 'helm-completing-read-handlers-alist '(org-capture))
  )
