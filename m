Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 769017D2F0
	for <lwn-linux-doc@archive.lwn.net>; Thu, 18 Jul 2019 17:47:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727781AbfGRRrA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 18 Jul 2019 13:47:00 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:41834 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726715AbfGRRq7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Jul 2019 13:46:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=d0BclGLNqcAAwzmYNgAQDSEyNjN28DUtbGsctmjB2Oo=; b=JmiWbb5yOrRekz9CDx1bkys+y
        eb4QpQqSNg22LsrivMv5wGJpNaYtC57ryx1pZ2p0IuwvalzAZmCoc32or7tUtxAfgLfeX0gGxbqhb
        b+EN6kAhS2yvpwVPS4Qi70lk3TVpiloy+eJUuFyaVAIcRJFhvhweYtBTV9SFAInb8lJHdt9lHkJgZ
        w9F273eKtBRSX+i+Mwab6g9f8VR1kIOOF16BxntkRzZM5qAKzRmLrJ9sNvL1aBszg7w9ugXCLIliK
        SDHUK0cDdwZn6uFfeuAYnJMnfCv6aEx9a4MP4uzvTveN//BDN1PJtDXK4QYo3XzdkgPd0kbq3aZlw
        jXr5H+j9Q==;
Received: from [191.33.154.161] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hoAUd-0004on-0U; Thu, 18 Jul 2019 17:46:59 +0000
Date:   Thu, 18 Jul 2019 14:46:55 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org
Subject: Using rst2pdf for PDF output - Was: Re: [PATCH 0/5] PDF output
 fixes
Message-ID: <20190718144655.5aa7deb4@coco.lan>
In-Reply-To: <20190713004125.6009b661@coco.lan>
References: <cover.1562696797.git.mchehab+samsung@kernel.org>
        <20190712141921.7f8a1d02@lwn.net>
        <20190712192705.71b97717@coco.lan>
        <20190713004125.6009b661@coco.lan>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Sat, 13 Jul 2019 00:41:25 -0300
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> escreveu:

> Em Fri, 12 Jul 2019 19:27:05 -0300
> Mauro Carvalho Chehab <mchehab+samsung@kernel.org> escreveu:
> 
> > Em Fri, 12 Jul 2019 14:19:21 -0600
> > Jonathan Corbet <corbet@lwn.net> escreveu:
> >   
> > > Can't you just make rst2pdf work instead? :)
> > 
> > Well, we can try. 

Doing some tests right now with upstream version of it. I actually
created a fork:

	https://github.com/mchehab/rst2pdf

basically upstream + some pending PRs + 2 fixes and a hack:

	https://github.com/mchehab/rst2pdf/commits/master


> > Also, right now, rst2pdf only supports Python 2.7.
> > 
> > I would wait for it to support Python 3.x before doing the actual
> > migration.

The upstream version runs on python 3.x. There are a few issues there
yet to be solved.

> There are a few issues with the quick hack to use rst2pdf. The
> enclosed one works better.

Did another improvement (see enclosed). This one should be applied
after my PDF fixes branch:

	https://git.linuxtv.org/mchehab/experimental.git/log/?h=pdf_fixes_v1

I suspect that we'll also need a patch for kfigure.py, in order for it
to support kernel-figure output.

> 
> Yet, from the existing 70 books (on my experimental tree), rst2pdf breaks 
> with 14 ones.

I was able to find one of the reason some books failed: rst2pdf has a
"hidden" dependency:

	svglib

Without that, it will silently ignore SVG images, causing the script
to break.


Even with that, it will still break (reporting success), even on not
so complex books. For example:


$ make  SPHINXDIRS=hwmon pdfdocs

writing hwmon... 
[ERROR] pdfbuilder.py:150 More than 10 pages generated without content - halting layout.  Likely that a flowable is too large for any frame.
Traceback (most recent call last):
  File "/devel/v4l/docs_temp/sphinx_2.0.1/lib/python3.7/site-packages/rst2pdf-0.95.dev0-py3.7.egg/rst2pdf/pdfbuilder.py", line 147, in write
    docwriter.write(doctree, destination)
  File "/devel/v4l/docs_temp/sphinx_2.0.1/lib/python3.7/site-packages/docutils/writers/__init__.py", line 80, in write
    self.translate()
  File "/devel/v4l/docs_temp/sphinx_2.0.1/lib/python3.7/site-packages/rst2pdf-0.95.dev0-py3.7.egg/rst2pdf/pdfbuilder.py", line 643, in translate
    compressed=self.compressed)
  File "/devel/v4l/docs_temp/sphinx_2.0.1/lib/python3.7/site-packages/rst2pdf-0.95.dev0-py3.7.egg/rst2pdf/createpdf.py", line 643, in createPdf
    pdfdoc.multiBuild(elements)
  File "/devel/v4l/docs_temp/sphinx_2.0.1/lib/python3.7/site-packages/reportlab/platypus/doctemplate.py", line 1144, in multiBuild
    self.build(tempStory, **buildKwds)
  File "/devel/v4l/docs_temp/sphinx_2.0.1/lib/python3.7/site-packages/reportlab/platypus/doctemplate.py", line 1057, in build
    self.handle_flowable(flowables)
  File "/devel/v4l/docs_temp/sphinx_2.0.1/lib/python3.7/site-packages/rst2pdf-0.95.dev0-py3.7.egg/rst2pdf/createpdf.py", line 791, in handle_flowable
    self.handle_frameEnd()
  File "/devel/v4l/docs_temp/sphinx_2.0.1/lib/python3.7/site-packages/reportlab/platypus/doctemplate.py", line 709, in handle_frameEnd
    self.handle_pageEnd()
  File "/devel/v4l/docs_temp/sphinx_2.0.1/lib/python3.7/site-packages/reportlab/platypus/doctemplate.py", line 651, in handle_pageEnd
    raise LayoutError(ident)
reportlab.platypus.doctemplate.LayoutError: More than 10 pages generated without content - halting layout.  Likely that a flowable is too large for any frame.
FAILED
build succeeded.

Patch enclosed.

Thanks,
Mauro

---

[PATCH] docs: experimental: build PDF with rst2pdf

Change the logic to use rst2pdf instead of LaTeX.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

diff --git a/Documentation/Makefile b/Documentation/Makefile
index 638c4c11d102..565acf6e6ee7 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -94,18 +94,22 @@ latexdocs:
 
 ifeq ($(HAVE_PDFLATEX),0)
 
-pdfdocs:
+oldpdfdocs:
 	$(warning The '$(PDFLATEX)' command was not found. Make sure you have it installed and in PATH to produce PDF output.)
 	@echo "  SKIP    Sphinx $@ target."
 
 else # HAVE_PDFLATEX
 
-pdfdocs: latexdocs
+oldpdfdocs: latexdocs
 	@$(srctree)/scripts/sphinx-pre-install --version-check
 	$(foreach var,$(SPHINXDIRS), $(MAKE) PDFLATEX="$(PDFLATEX)" LATEXOPTS="$(LATEXOPTS)" -C $(BUILDDIR)/$(var)/latex || exit;)
 
 endif # HAVE_PDFLATEX
 
+pdfdocs:
+	@$(srctree)/scripts/sphinx-pre-install --version-check
+	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,pdf,$(var),pdf,$(var)))
+
 epubdocs:
 	@$(srctree)/scripts/sphinx-pre-install --version-check
 	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,epub,$(var),epub,$(var)))
@@ -131,6 +135,7 @@ dochelp:
 	@echo  '  htmldocs        - HTML'
 	@echo  '  latexdocs       - LaTeX'
 	@echo  '  pdfdocs         - PDF'
+	@echo  '  rst2pdf         - PDF, using experimental rst2pdf support'
 	@echo  '  epubdocs        - EPUB'
 	@echo  '  xmldocs         - XML'
 	@echo  '  linkcheckdocs   - check for broken external links (will connect to external hosts)'
diff --git a/Documentation/conf.py b/Documentation/conf.py
index c698f453bfab..4aa76e4b30ab 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -46,6 +46,8 @@ if (major == 1 and minor > 3) or (major > 1):
 else:
     extensions.append("sphinx.ext.pngmath")
 
+extensions.append("rst2pdf.pdfbuilder")
+
 # Add any paths that contain templates here, relative to this directory.
 templates_path = ['_templates']
 
@@ -574,12 +576,15 @@ epub_exclude_files = ['search.html']
 #
 # See the Sphinx chapter of http://ralsina.me/static/manual.pdf
 #
-# FIXME: Do not add the index file here; the result will be too big. Adding
-# multiple PDF files here actually tries to get the cross-referencing right
-# *between* PDF files.
-pdf_documents = [
-    ('kernel-documentation', u'Kernel', u'Kernel', u'J. Random Bozo'),
-]
+
+# Add all LaTeX files to PDF documents as well
+pdf_documents = []
+for l in latex_documents:
+    doc = l[0]
+    fn = l[1].replace(".tex", "")
+    name = l[2]
+    authors = l[3]
+    pdf_documents.append((doc, fn, name, authors))
 
 # kernel-doc extension configuration for running Sphinx directly (e.g. by Read
 # the Docs). In a normal build, these are supplied from the Makefile via command
diff --git a/Documentation/media/Makefile b/Documentation/media/Makefile
index d75d70f191bc..3050136ed489 100644
--- a/Documentation/media/Makefile
+++ b/Documentation/media/Makefile
@@ -53,12 +53,13 @@ $(BUILDDIR)/lirc.h.rst: ${UAPI}/lirc.h ${PARSER} $(SRC_DIR)/lirc.h.rst.exception
 
 # Media build rules
 
-.PHONY: all html epub xml latex
+.PHONY: all html epub xml latex pdf
 
 all: $(IMGDOT) $(BUILDDIR) ${TARGETS}
 html: all
 epub: all
 xml: all
+pdf: all
 latex: $(IMGPDF) all
 linkcheck:
 
diff --git a/Documentation/sphinx/load_config.py b/Documentation/sphinx/load_config.py
index 101e6f0b0fcf..a89d642d520e 100644
--- a/Documentation/sphinx/load_config.py
+++ b/Documentation/sphinx/load_config.py
@@ -43,6 +43,17 @@ def loadConfig(namespace):
 
             namespace['latex_documents'] = new_latex_docs
 
+            # Add LaTeX files to PDF documents as well
+            pdf_documents = []
+            for l in new_latex_docs:
+                doc = l[0]
+                fn = l[1].replace(".tex", "")
+                name = l[2]
+                authors = l[3]
+                pdf_documents.append((doc, fn, name, authors))
+
+            namespace['pdf_documents'] = pdf_documents
+
         # If there is an extra conf.py file, load it
         if os.path.isfile(config_file):
             sys.stdout.write("load additional sphinx-config: %s\n" % config_file)
diff --git a/Makefile b/Makefile
index ec21ebbd12c2..2a749335d0df 100644
--- a/Makefile
+++ b/Makefile
@@ -1564,7 +1564,7 @@ $(help-board-dirs): help-%:
 # Documentation targets
 # ---------------------------------------------------------------------------
 DOC_TARGETS := xmldocs latexdocs pdfdocs htmldocs epubdocs cleandocs \
-	       linkcheckdocs dochelp refcheckdocs
+	       linkcheckdocs dochelp refcheckdocs oldpdfdocs
 PHONY += $(DOC_TARGETS)
 $(DOC_TARGETS): scripts_basic FORCE
 	$(Q)$(MAKE) $(build)=Documentation $@

