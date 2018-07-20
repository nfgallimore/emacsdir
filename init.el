(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files
(load "~/.emacs.d/tuareg/tuareg-site-file")

(let ((opam-share (ignore-errors (car (process-lines "opam" "config" "var" "share")))))
  (when (and opam-share (file-directory-p opam-share))
    (add-to-list 'load-path (expand-file-name "emacs/site-lisp" opam-share))
    (autoload 'merlin-mode "merlin" nil t nil)
    (add-hook 'tuareg-mode-hook 'merlin-mode t)
      (add-hook 'caml-mode-hook 'merlin-mode t)))


(setq tuareg-match-patterns-aligned t)

(add-hook 'tuareg-mode-hook
	  (lambda()
	    (when (functionp 'prettify-symbols-mode)
	      (prettify-symbols-mode))))

(add-hook 'tuareg-mode-hook 'merlin-mode)

(setq merlin-ac-setup 'easy)

(add-hook 'after-init-hook 'global-company-mode)
