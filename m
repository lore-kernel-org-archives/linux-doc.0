Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9B0FC05027
	for <linux-doc@archiver.kernel.org>; Mon,  6 Feb 2023 19:30:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230256AbjBFTaa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 6 Feb 2023 14:30:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230379AbjBFTaH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Feb 2023 14:30:07 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF146CDDE
        for <linux-doc@vger.kernel.org>; Mon,  6 Feb 2023 11:30:03 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id D033637A;
        Mon,  6 Feb 2023 19:30:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D033637A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1675711802; bh=I8VrI//IpMH5vm8F867zDiyWedothQ0W56hQKaOIR5E=;
        h=From:To:Cc:Subject:Date:From;
        b=Xs+5rnoFiIWCOe+JLWgCNaaR64wL1nnzAUBK1ZVC/Ya1tTeexvdrixMFJU5Q8fE+q
         4LBlUF57Pyq5Wg0s/gchFxARjqXW8K2IP0AO+CiFRIVuS/BzIG/VDZknEixPJjmxtJ
         fX072QXDdEssRoL9DUT3zkrXOOY3zov34EXf2k1VSLsBkkBq0j5kx7JLKTk95Y5mlt
         g2ttC28fqUij1evsn2sUJl0L67e5kONnHVfSth1aTpWD3RcEnPiTuUAnsUZs9Z3fZu
         K5ZdJb7E2abLpC+IhCTRNrI6UogaZptm1S4t8tz9hKlPRD487oEF7/e5VWeA43gPf8
         q3wwycT2E16SQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     linux-doc@vger.kernel.org
Cc:     David Gow <davidgow@google.com>,
        Sadiya Kazi <sadiyakazi@google.com>,
        Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH v3] docs: improve the HTML sidebar/TOC
Date:   Mon, 06 Feb 2023 12:30:02 -0700
Message-ID: <87h6vyr3r9.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a new sidebar template that creates a more RTD-like "fisheye" view of
the current place in the document hierarchy.  It is far from ideal, but
some readers may find it better for navigating through the documentation as
a whole.

Add some CSS trickery as well to make the table of contents less intrusive
when viewing the pages on a small screen.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
Changes this time are almost entirely in the small-screen view; I've
added some CSS trickery to hide the TOC by default so it doesn't get
between readers and what they actually want to see.  I'm sure it could
be done more elegantly, but my fluency with CSS ... does not afford much
elegance ...

Once again, the results are at:

  https://static.lwn.net/kerneldoc/

This is as far as this work is likely to get before the merge window; in
the absence of screams, I'll drop it into linux-next in the near future.

 Documentation/conf.py                         |  5 +-
 Documentation/sphinx-static/custom.css        | 48 ++++++++++++++++++-
 .../sphinx/templates/kernel-toc.html          | 15 ++++++
 3 files changed, 65 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/sphinx/templates/kernel-toc.html

diff --git a/Documentation/conf.py b/Documentation/conf.py
index d927737e3c10..6c8ccf3095ac 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -153,7 +153,7 @@ else:
     math_renderer = 'mathjax'
 
 # Add any paths that contain templates here, relative to this directory.
-templates_path = ['_templates']
+templates_path = ['sphinx/templates']
 
 # The suffix(es) of source filenames.
 # You can specify multiple suffix as a list of string:
@@ -328,6 +328,7 @@ if  html_theme == 'alabaster':
         'description': get_cline_version(),
         'page_width': '65em',
         'sidebar_width': '15em',
+        'fixed_sidebar': 'true',
         'font_size': 'inherit',
         'font_family': 'serif',
     }
@@ -345,7 +346,7 @@ html_use_smartypants = False
 
 # Custom sidebar templates, maps document names to template names.
 # Note that the RTD theme ignores this
-html_sidebars = { '**': ['searchbox.html', 'localtoc.html', 'sourcelink.html']}
+html_sidebars = { '**': ['searchbox.html', 'kernel-toc.html', 'sourcelink.html']}
 
 # about.html is available for alabaster theme. Add it at the front.
 if html_theme == 'alabaster':
diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index 45a624fdcf2c..539577ac9baa 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -11,7 +11,9 @@ div.body h3 { font-size: 130%; }
 /* Tighten up the layout slightly */
 div.body { padding: 0 15px 0 10px; }
 div.sphinxsidebarwrapper { padding: 1em 0.4em; }
-div.sphinxsidebar { font-size: inherit; }
+div.sphinxsidebar { font-size: inherit;
+		    max-height: 100%;
+		    overflow-y: auto; }
 /* Tweak document margins and don't force width */
 div.document {
     margin: 20px 10px 0 10px; 
@@ -27,3 +29,47 @@ dl.function, dl.struct, dl.enum { margin-top: 2em; background-color: #ecf0f3; }
 dl.function dt { margin-left: 10em; text-indent: -10em; }
 dt.sig-object { font-size: larger; }
 div.kernelindent { margin-left: 2em; margin-right: 4em; }
+
+/*
+ * Tweaks for our local TOC
+ */
+div.kerneltoc li.toctree-l1 { font-size: smaller;
+		text-indent: -1em;
+		margin-left: 1em; }
+div.kerneltoc li.current > a {font-weight: bold; }
+div.kerneltoc li.toctree-l2,li.toctree-l3 { font-size: smaller;
+		text-indent: -1em;
+		margin-left: 2em;
+		list-style-type: none;
+	      }
+div.kerneltoc li.current ul { margin-left: 0; }
+div.kerneltoc { background-color: #eeeeee; }
+div.kerneltoc li.current ul { background-color: white; }
+
+/*
+ * The CSS magic to toggle the contents on small screens.
+ */
+label.kernel-toc-title { display: none; }
+label.kernel-toc-title:after {
+    content: "[Hide]";
+}
+input[type=checkbox]:checked ~ label.kernel-toc-title:after {
+    content: "[Show]";
+}
+/* Hide the toggle on large screens */
+input.kernel-toc-toggle { display: none; }
+
+/*
+ * Show and implement the toggle on small screens.
+ * The 875px width seems to be wired into alabaster.
+ */
+@media screen and (max-width: 875px) {
+    label.kernel-toc-title { display: inline;
+			     font-weight: bold;
+			     font-size: larger; }
+    input[type=checkbox]:checked ~ div.kerneltoc {
+	display: none;
+    }
+    h3.kernel-toc-contents { display: inline; }
+    div.kerneltoc a { color: black; }
+}
diff --git a/Documentation/sphinx/templates/kernel-toc.html b/Documentation/sphinx/templates/kernel-toc.html
new file mode 100644
index 000000000000..b124f6cfa558
--- /dev/null
+++ b/Documentation/sphinx/templates/kernel-toc.html
@@ -0,0 +1,15 @@
+{# Create a local TOC the kernel way #}
+<p>
+<h3 class="kernel-toc-contents">Contents</h3>
+<input type="checkbox" class="kernel-toc-toggle" id = "kernel-toc-toggle" checked>
+<label class="kernel-toc-title" for="kernel-toc-toggle"></label>
+
+<div class="kerneltoc" id="kerneltoc">
+{{ toctree(maxdepth=3) }}
+</div>
+{# hacky script to try to position the left column #}
+<script type="text/javascript"> <!--
+  var sbar = document.getElementsByClassName("sphinxsidebar")[0];
+  let currents = document.getElementsByClassName("current")
+  sbar.scrollTop = currents[currents.length - 1].offsetTop;
+  --> </script>
-- 
2.39.1

