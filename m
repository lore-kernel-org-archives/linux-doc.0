Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 334C2C004D4
	for <linux-doc@archiver.kernel.org>; Fri, 20 Jan 2023 00:11:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229450AbjATALX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 19 Jan 2023 19:11:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjATALW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Jan 2023 19:11:22 -0500
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46369A25AD
        for <linux-doc@vger.kernel.org>; Thu, 19 Jan 2023 16:11:21 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id D91562AE;
        Fri, 20 Jan 2023 00:11:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D91562AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1674173481; bh=+6TQ7LOln//X3+XjDIAMe7mPV+3wKFcXSBdAz0s/vtE=;
        h=From:To:Cc:Subject:Date:From;
        b=IS96c1WMCsBAYj8VFQA4DkNmSubhK0VkVgzB1JdyIHs/UEYarWeABsAClUirtM09G
         BEnOKB5R6p1vqt+OlpDX2Fe9m4gsQ7SYIKFTTl7Y8BbexjEhtYv3V5eQMOrMm+Jyw+
         B/76kx5dLGwdAvZ75v04eWM1yWHmN/VgrkQoly79CqT6uU4U7GcsfBOUITkFcDvQPI
         UUC7akece46G4q3RVqFYinLvPJ9rr/CUgwVNOyT3HmBIy1YKeTqRivuEmo7o3PTtQA
         +zVraoPosFdlw0HJF9IW6JbIvKU+2+KtnUtN0dc4+TQyE5ckxLRizak7HLS7tJy31U
         fOF5KC/oc4bow==
From:   Jonathan Corbet <corbet@lwn.net>
To:     linux-doc@vger.kernel.org
Cc:     Akira Yokosawa <akiyks@gmail.com>,
        Sadiya Kazi <sadiyakazi@google.com>
Subject: [PATCH RFC] docs: Add more information to the HTML sidebar
Date:   Thu, 19 Jan 2023 17:11:20 -0700
Message-ID: <87o7qu5al3.fsf@meer.lwn.net>
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
So this is just a first attempt to create a more crowded sidebar; the
result is somewhat like what RTD does; I'm not hugely happy with it, but
it's a start.

I've put a copy of the rendered docs at:

  https://static.lwn.net/kerneldoc/

Thoughts?  Is this headed in the right direction?  This view of the TOC
is readily available from Sphinx; if we want something else it's going
to be rather more work.

 Documentation/conf.py                          |  4 ++--
 Documentation/sphinx-static/custom.css         | 16 ++++++++++++++++
 Documentation/sphinx/templates/kernel-toc.html |  6 ++++++
 3 files changed, 24 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/sphinx/templates/kernel-toc.html

diff --git a/Documentation/conf.py b/Documentation/conf.py
index d927737e3c10..233f2f585143 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -153,7 +153,7 @@ else:
     math_renderer = 'mathjax'
 
 # Add any paths that contain templates here, relative to this directory.
-templates_path = ['_templates']
+templates_path = ['sphinx/templates']
 
 # The suffix(es) of source filenames.
 # You can specify multiple suffix as a list of string:
@@ -345,7 +345,7 @@ html_use_smartypants = False
 
 # Custom sidebar templates, maps document names to template names.
 # Note that the RTD theme ignores this
-html_sidebars = { '**': ['searchbox.html', 'localtoc.html', 'sourcelink.html']}
+html_sidebars = { '**': ['searchbox.html', 'kernel-toc.html', 'sourcelink.html']}
 
 # about.html is available for alabaster theme. Add it at the front.
 if html_theme == 'alabaster':
diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index 45a624fdcf2c..1ad0899bc8f1 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -27,3 +27,19 @@ dl.function, dl.struct, dl.enum { margin-top: 2em; background-color: #ecf0f3; }
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
+div.kerneltoc li.toctree-l2 { font-size: smaller;
+		text-indent: -1em;
+		margin-left: 2em;
+		list-style-type: none;
+	      }
+div.kerneltoc li.current ul { margin-left: 0; }
+div.kerneltoc { background-color: #eeeeee; }
+div.kerneltoc li.current ul { background-color: white; }
diff --git a/Documentation/sphinx/templates/kernel-toc.html b/Documentation/sphinx/templates/kernel-toc.html
new file mode 100644
index 000000000000..0d2fa3748437
--- /dev/null
+++ b/Documentation/sphinx/templates/kernel-toc.html
@@ -0,0 +1,6 @@
+{# Create a local TOC the kernel way #}
+<p>
+<h3>Contents</h3>
+<div class="kerneltoc">
+{{ toctree(maxdepth=2) }}
+</div>
-- 
2.39.0

