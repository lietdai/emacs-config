;;设置用户名和邮件地址
(setq user-full-name "liet")
(setq user-mail-address "lietdai@gmail.com")
;;tab and space
;;when true,emacs use mixture of tab and space to achieve offse
(setq-default indent-tabs-mode nil)
;;control length used to offset.
(setq-default c-basic-offset 4)
;;control how emaces explain TAB
(setq-default tab-width 4)
;;显示行号
;;(column-number-mode t)
(global-linum-mode t)
;;启动窗口最大化
(setq default-frame-alist '(
    (top .42 )
    (left . 42)
    (height . 100)
    (width . 200)
    (menu-bar-lines . 20)
    (tool-bar-lines . 20)
    ))
;;M+0..9跳转
(add-to-list 'load-path "~/.emacs.d/plugins") 
(require 'window-numbering)
(window-numbering-mode 1)

;;菜单栏设置
(menu-bar-mode 1)
;;工具栏设置
(tool-bar-mode -1)
;;滚动条设置
(scroll-bar-mode -1) ;;不显示

;;语法高亮
(global-font-lock-mode t)
;;状态条上显示当前光标在那个函数体内部
(which-function-mode t)
;;不要总是没完没了的问yes or no，用y/n
(fset 'yes-or-no-p 'y-or-n-p )

;;支持php
(require 'php-mode)
;;网上的那个破脚本,吐曹一下
(setq php-completion-file "~/.emacs.d/php/php-completion-file")
(add-hook 'php-mode-user-hook 'turn-on-font-lock)
;;设置emacs在console方式的自动补全的功能键为F9，如果使用emacs 的窗口方式则不必设置这个。
;;因为php-model只设置了在窗口方式下的功能键M-tab。
;;(global-set-key [(f9)] 'php-complete-function)
;;支持w3m
;;(add-to-list 'load-path "/usr/share/emacs/site-lisp/w3m-master") 
;;(require 'w3m)
;;(setq w3m-home-page "http://www.google.com.hk") ;设置主页 
;(require 'mime-w3m) 
;设置显示图片
;(setq w3m-default-display-inline-images t)
;(setq w3m-default-toggle-inline-images t)
;;显示图标  
;(setq w3m-show-graphic-icons-in-header-line t) 
;(setq w3m-show-graphic-icons-in-mode-line t)
;;启用cookie  
;(setq w3m-use-cookies t)
;设定w3m运行的参数，分别为使用cookie和使用框架 
;(setq w3m-command-arguments '("-cookie" "-F"))
;;不要生成临时文件
(setq-default make-backup-files nil)
;;设置自动备份文件保存的目录
(setq backup-directory-alist '(("." . "~/.autosave")))
;;emacs登入微薄
;(add-to-list 'load-path "/usr/share/emacs/site-lisp/weibo.emacs-master")
;(require 'weibo)
;;emacs 显示tab
(require 'tab-display)

;;支持markdown
;(autoload 'markdown-mode "markdown-mode.el"
;     "Major mode for editing Markdown files" t)
;(setq auto-mode-alist
;     (cons '("\\.md" . markdown-mode) auto-mode-alist))
;(define-derived-mode gfm-mode markdown-mode "GFM"
;   "Major mode for editing GitHub Flavored Markdown files."
;     (setq markdown-link-space-sub-char "-")
;       (set (make-local-variable 'font-lock-defaults)
;               '(gfm-font-lock-keywords))
;         (auto-fill-mode 0)
;           ;; Use visual-line-mode if available, fall back to longlines-mode:
;(if (fboundp 'visual-line-mode)
;     (visual-line-mode 1)
;     (longlines-mode 1))
;;; do the initial link fontification
;(markdown-fontify-buffer-wiki-links))
;(provide 'markdown-mode)

;;支持emacs和外部程序的拷贝粘贴
(transient-mark-mode t)
(setq x-select-enable-clipboard t)

;;代码折叠
(load-library "hideshow")
(add-hook 'perl-mode-hook 'hs-minor-mode)
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode)
(add-hook 'javascript-mode-hook 'hs-minor-mode)
(add-hook 'python-mode-hook 'hs-minor-mode)

;;所有模式中都自动填充
(setq-default auto-fill-function 'do-auto-fill)

(require 'yasnippet-bundle)
(yas/initialize)
(yas/load-directory "~/.emacs.d/snippets")


;;C-c C-g line跳到n行
(define-key global-map "\C-c\C-g" 'goto-line)

;;auto-complete
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/auto-complete/dict")
(ac-config-default)


;;templat
(require 'template)
;;find tpl file
(define-key global-map "\C-c\C-t" 'template-expand-template)
(defun template-settings ()
  ;;"settings for `template'."
  (setq template-default-directories  "~/emacs.d/templates/"))
(template-initialize)
