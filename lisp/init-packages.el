(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			   ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/"))))

;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar my/packages '() "Default packages")

(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
  (loop for pkg in my/packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))

(unless (my/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg my/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(setq package-selected-packages (quote (company
					hungry-delete
					ivy
					swiper
					counsel
					smex
					org
					popwin
					monokai-theme)))


;; company
(require 'company)
(global-company-mode t)


;; hungry-delete
;; (require 'hungry-delete)
;; (global-hungry-delete-mode)


;; counsel
(require 'counsel)

;; swiper
(require 'swiper)


;; ivy
(require 'ivy)
(ivy-mode t)
(setq ivy-use-virtual-buffers t)

;; smex
(require 'smex)
(smex-initialize)


;; popwin
(require 'popwin)
(popwin-mode t)


(provide 'init-packages)
