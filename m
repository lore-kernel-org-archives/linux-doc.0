Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A98C5C61DA4
	for <linux-doc@archiver.kernel.org>; Fri,  3 Feb 2023 23:10:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232718AbjBCXKH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Feb 2023 18:10:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232618AbjBCXKG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Feb 2023 18:10:06 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47E298C437
        for <linux-doc@vger.kernel.org>; Fri,  3 Feb 2023 15:10:01 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id B268F2E0;
        Fri,  3 Feb 2023 23:10:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B268F2E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1675465800; bh=UqoWQtt3CWHvnivndND5fQ49TaWg+evx3bQLQ+Hp9FE=;
        h=From:To:Cc:Subject:Date:From;
        b=oNWQXaqEo1LlfVyjb7dciiu3V38G0GK/UqYp8VRQZQj3bv3sWfiTz9yDTlqroG76K
         BbCFiGT+UHPpqZkRQSAjJh53Klg53DUlOffBqFSEWJX2Qfa31jlXNBjh+6ErfPb/Jo
         3wqgTuX1WVkWWSWW3pYPapPoxXDm4KZNZ2W7Mw+Dtb4sB7w0KqrEGuHTm0EexS9a+a
         CdNWSH7pTljHesI/wfYWoHNuXcw/lyWyyf7tA8Tlz28sUQ50l94C41UMp1BJWqfkaX
         rlFJFRry+ojWNPV6xG+AGAJrXmuX85chyVw/o1265X6WxZ8pFYq+IH9XWEL/R/Gvhy
         /9J6JNpKU6xTA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     linux-doc@vger.kernel.org
Cc:     David Gow <davidgow@google.com>,
        Sadiya Kazi <sadiyakazi@google.com>,
        Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH RFC V2] docs: Add more information to the HTML sidebar
Date:   Fri, 03 Feb 2023 16:09:59 -0700
Message-ID: <87bkmas5vc.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a new sidebar template that creates a more RTD-like "fisheye" view of
the current place in the document hierarchy.  It is far from ideal, but
some readers may find it better for navigating through the documentation as
a whole.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
Sorry it took so long to get back to this...$EXCUSES plus trying to get
ready for the merge window.

This version includes the suggestions Akira sent around a couple of
weeks ago.  I've also the sidebar TOC go one level deeper when
appropriate.

There's a bit of JavaScript that attempts to scroll the sidebar
appropriately.  It's far from perfect but, hopefully an improvement.  It
could be made better, but I've managed to remain blissfully ignorant of
JavaScript over the years, so it's slow going.  It would sure be nice if
somebody who is better at that stuff could jump in.

I think the contents of the sidebar could be improved too, but that's
probably a bigger job.

As before, the results can be seen at:

  https://static.lwn.net/kerneldoc/

This probably isn't going to get a lot further before the merge window.
So I ask: is this sufficiently better that it should go into 6.3?  

 Documentation/conf.py                         |  5 +++--
 Documentation/sphinx-static/custom.css        | 20 ++++++++++++++++++-
 .../sphinx/templates/kernel-toc.html          | 11 ++++++++++
 3 files changed, 33 insertions(+), 3 deletions(-)
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
index 45a624fdcf2c..17cc0abeb0a7 100644
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
@@ -27,3 +29,19 @@ dl.function, dl.struct, dl.enum { margin-top: 2em; background-color: #ecf0f3; }
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
+div.kerneltoc li.current {font-weight: bold; }
+div.kerneltoc li.toctree-l2,li.toctree-l3 { font-size: smaller;
+		text-indent: -1em;
+		margin-left: 2em;
+		list-style-type: none;
+	      }
+div.kerneltoc li.current ul { margin-left: 0; }
+div.kerneltoc { background-color: #eeeeee; }
+div.kerneltoc li.current ul { background-color: white; }
diff --git a/Documentation/sphinx/templates/kernel-toc.html b/Documentation/sphinx/templates/kernel-toc.html
new file mode 100644
index 000000000000..020a174a8139
--- /dev/null
+++ b/Documentation/sphinx/templates/kernel-toc.html
@@ -0,0 +1,11 @@
+{# Create a local TOC the kernel way #}
+<p>
+<h3>Contents</h3>
+<div class="kerneltoc" id="kerneltoc">
+{{ toctree(maxdepth=3) }}
+</div>
+{# hacky script to try to position the left column #}
+<script type="text/javascript"> <!--
+  var sbar = document.getElementsByClassName("sphinxsidebar")[0];
+  sbar.scrollTop = document.getElementsByClassName("current")[0].offsetTop;
+  --> </script>
-- 
2.39.1

