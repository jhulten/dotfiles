(setq org-publish-project-alist
           '(("orgfiles"
               :base-directory "~/Dropbox/todo/"
               :base-extension "org"
               :publishing-directory "/ssh:user@host:~/html/notebook/"
               :publishing-function org-html-publish-to-html
               :exclude "PrivatePage.org"   ;; regexp
               :headline-levels 3
               :section-numbers nil
               :with-toc nil
               :html-head "<link rel=\"stylesheet\"
                       href=\"../other/mystyle.css\" type=\"text/css\"/>"
               :html-preamble t)))
     
