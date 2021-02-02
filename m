Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42BE1C433DB
	for <linux-doc@archiver.kernel.org>; Tue,  2 Feb 2021 00:22:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A0A064E8D
	for <linux-doc@archiver.kernel.org>; Tue,  2 Feb 2021 00:22:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231223AbhBBAVz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 1 Feb 2021 19:21:55 -0500
Received: from ms.lwn.net ([45.79.88.28]:40044 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231169AbhBBAVz (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 1 Feb 2021 19:21:55 -0500
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 9943B128A;
        Tue,  2 Feb 2021 00:21:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9943B128A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1612225274; bh=qJZ8mQw+L4LKldOGMkJnOKCE1hKdeiAoBbdvJQGlbEI=;
        h=From:To:Cc:Subject:Date:From;
        b=VrxTSl2QZQ3aW7rJm6Yx6jr4yhFdOT/1fxK71vqWkgK/EESG9WuhvJEV5Ra5jWsMh
         PaTsxxyUDWPJef+Rq8jyGtmnAJ+gf7EmRL6k7s/koxCPOKOjCmbGtJuicqB2Ksg5Z4
         QD6BopEoyJjI6tFP7Zsh6XELScAjg+CfecgR+Eh38fsStv9HenAuZQeQ1GCpDLTCVp
         HG0MZ76eHl5K3mZ26kzvaqBPRG4AAWKRsOPU8S5l4TTZUERveV6pNQ4+UxycoJr0VG
         Xz+73LzmbQSIOLFPywnHh7JKZe1UsWj98gHSQAlITxE9jKDME3YLqnSLEN6ftc/v9x
         AVb7sGa1tDgGA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     linux-doc@vger.kernel.org
Cc:     linux-doc@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@s-opensource.com>
Subject: [PATCH] Docs: drop Python 2 support
Date:   Mon, 01 Feb 2021 17:21:14 -0700
Message-ID: <87wnvrtj45.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The kernel build system as a whole is dropping support for Python 2, so we
should do the same.  The effects are rather small, especially considering
that much of the deleted code was not doing anything under any version of
Python anyway.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/sphinx/kfigure.py             | 14 +-------------
 Documentation/sphinx/maintainers_include.py |  2 --
 Documentation/sphinx/requirements.txt       |  1 -
 Documentation/sphinx/rstFlatTable.py        | 10 ----------
 scripts/sphinx-pre-install                  |  4 ++--
 5 files changed, 3 insertions(+), 28 deletions(-)

diff --git a/Documentation/sphinx/kfigure.py b/Documentation/sphinx/kfigure.py
index 788704886eec..3c78828330be 100644
--- a/Documentation/sphinx/kfigure.py
+++ b/Documentation/sphinx/kfigure.py
@@ -49,26 +49,14 @@ import os
 from os import path
 import subprocess
 from hashlib import sha1
-import sys
-
 from docutils import nodes
 from docutils.statemachine import ViewList
 from docutils.parsers.rst import directives
 from docutils.parsers.rst.directives import images
 import sphinx
-
 from sphinx.util.nodes import clean_astext
-from six import iteritems
-
 import kernellog
 
-PY3 = sys.version_info[0] == 3
-
-if PY3:
-    _unicode = str
-else:
-    _unicode = unicode
-
 # Get Sphinx version
 major, minor, patch = sphinx.version_info[:3]
 if major == 1 and minor > 3:
@@ -540,7 +528,7 @@ def add_kernel_figure_to_std_domain(app, doctree):
     docname = app.env.docname
     labels = std.data["labels"]
 
-    for name, explicit in iteritems(doctree.nametypes):
+    for name, explicit in doctree.nametypes.items():
         if not explicit:
             continue
         labelid = doctree.nameids[name]
diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index dc8fed48d3c2..328b3631a585 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -61,8 +61,6 @@ class MaintainersInclude(Include):
         field_content = ""
 
         for line in open(path):
-            if sys.version_info.major == 2:
-                line = unicode(line, 'utf-8')
             # Have we reached the end of the preformatted Descriptions text?
             if descriptions and line.startswith('Maintainers'):
                 descriptions = False
diff --git a/Documentation/sphinx/requirements.txt b/Documentation/sphinx/requirements.txt
index 5030d346d23b..489f6626de67 100644
--- a/Documentation/sphinx/requirements.txt
+++ b/Documentation/sphinx/requirements.txt
@@ -1,4 +1,3 @@
 docutils
 Sphinx==2.4.4
 sphinx_rtd_theme
-six
diff --git a/Documentation/sphinx/rstFlatTable.py b/Documentation/sphinx/rstFlatTable.py
index 2019a55f6b18..a3eea0bbe6ba 100755
--- a/Documentation/sphinx/rstFlatTable.py
+++ b/Documentation/sphinx/rstFlatTable.py
@@ -42,8 +42,6 @@ u"""
 # imports
 # ==============================================================================
 
-import sys
-
 from docutils import nodes
 from docutils.parsers.rst import directives, roles
 from docutils.parsers.rst.directives.tables import Table
@@ -55,14 +53,6 @@ from docutils.utils import SystemMessagePropagation
 
 __version__  = '1.0'
 
-PY3 = sys.version_info[0] == 3
-PY2 = sys.version_info[0] == 2
-
-if PY3:
-    # pylint: disable=C0103, W0622
-    unicode     = str
-    basestring  = str
-
 # ==============================================================================
 def setup(app):
 # ==============================================================================
diff --git a/scripts/sphinx-pre-install b/scripts/sphinx-pre-install
index 828a8615a918..b5f9fd5b2880 100755
--- a/scripts/sphinx-pre-install
+++ b/scripts/sphinx-pre-install
@@ -728,8 +728,8 @@ sub check_needs()
 					$need_virtualenv = 1;
 				}
 				if ($1 < 3) {
-					# Complain if it finds python2 (or worse)
-					printf "Warning: python$1 support is deprecated. Use it with caution!\n";
+					# Fail if it finds python2 (or worse)
+					die "Python 3 is required to build the kernel docs\n";
 				}
 			} else {
 				die "Warning: couldn't identify $python_cmd version!";
-- 
2.29.2

