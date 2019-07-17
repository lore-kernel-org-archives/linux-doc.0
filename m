Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CCEED7D981
	for <lwn-linux-doc@archive.lwn.net>; Wed, 17 Jul 2019 12:28:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725873AbfGQM20 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 17 Jul 2019 08:28:26 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:53854 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726580AbfGQM2Z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 17 Jul 2019 08:28:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=6Sy+C451QMv6wtGdIHTL1AhzpnVAGtDwr431h/ZLLtE=; b=M/14vkvIizzCpnZdjUs7C1jFQY
        6/IHD1Z1R7sCz7kKluSVhU+bnd95y0MHLK3snnvu4y5zQlq3DUI/usMiuT9wT91ZZh4aS3qGNZmtz
        XhKhky2tf7bk+LxzgZXgM8UjXw8Uy46JZ6nHjlOJJJkWOJOBr2t0Ksu+TX+ZSn6SRjZ6GmrBTM9iM
        cTpMO+T4zo/fOeqko/JX+f9c1QOZCxr9SnH4FV+TDyOXHiEbotOYcDgl3P5MqH283KLt+naGROr+n
        Jq3WwlVgV9I6fqoU50Zt+VjdDOraq8zjXNkTrz2zAN0ou0ZjrSGmr45gP96UFeM3dSQyFKwcN7EdY
        yhN5BtFA==;
Received: from [191.33.154.161] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hnj2m-0006fa-Sa; Wed, 17 Jul 2019 12:28:24 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hnj2k-00052S-1L; Wed, 17 Jul 2019 09:28:22 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     gregkh@linuxfoundation.org
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH v4 09/15] docs: kernel_abi.py: Sphinx has a lazy parser... workaround it
Date:   Wed, 17 Jul 2019 09:28:13 -0300
Message-Id: <4a5e7955ff0a7621284bcf784d242dcb3ec3452d.1563365880.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1563365880.git.mchehab+samsung@kernel.org>
References: <cover.1563365880.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The Sphinx docutils parser is lazy: if the content is bigger than
a certain number of lines, it silenlty stops parsing it,
producing an incomplete content. This seems to be worse on newer
Sphinx versions, like 2.0.

So, change the logic to parse the contents per input file.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/sphinx/kernel_abi.py | 39 ++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 13 deletions(-)

diff --git a/Documentation/sphinx/kernel_abi.py b/Documentation/sphinx/kernel_abi.py
index 30cac84e18f5..6d2f56500197 100644
--- a/Documentation/sphinx/kernel_abi.py
+++ b/Documentation/sphinx/kernel_abi.py
@@ -36,6 +36,7 @@ import os
 import subprocess
 import sys
 import re
+import kernellog
 
 from os import path
 
@@ -80,12 +81,6 @@ class KernelCmd(Directive):
         "rst"       : directives.unchanged
     }
 
-    def warn(self, message, **replace):
-        replace["fname"]   = self.state.document.current_source
-        replace["line_no"] = replace.get("line_no", self.lineno)
-        message = ("%(fname)s:%(line_no)s: [kernel-abi WARN] : " + message) % replace
-        self.state.document.settings.env.app.warn(message, prefix="")
-
     def run(self):
 
         doc = self.state.document
@@ -114,7 +109,7 @@ class KernelCmd(Directive):
         shell_env["srctree"] = srctree
 
         lines = self.runCmd(cmd, shell=True, cwd=cwd, env=shell_env)
-        nodeList = self.nestedParse(lines, fname)
+        nodeList = self.nestedParse(lines, self.arguments[0])
         return nodeList
 
     def runCmd(self, cmd, **kwargs):
@@ -141,9 +136,9 @@ class KernelCmd(Directive):
                               % (self.name, ErrorString(exc)))
         return out
 
-    def nestedParse(self, lines, f):
+    def nestedParse(self, lines, fname):
         content = ViewList()
-        node    = nodes.section()
+        node = nodes.section()
 
         if "debug" in self.options:
             code_block = "\n\n.. code-block:: rst\n    :linenos:\n"
@@ -153,22 +148,42 @@ class KernelCmd(Directive):
 
         line_regex = re.compile("^#define LINENO (\S+)\#([0-9]+)$")
         ln = 0
+        n = 0
+        f = fname
 
         for line in lines.split("\n"):
+            n = n + 1
             match = line_regex.search(line)
             if match:
-                f = match.group(1)
+                new_f = match.group(1)
+
+                # Sphinx parser is lazy: it stops parsing contents in the
+                # middle, if it is too big. So, handle it per input file
+                if new_f != f and content:
+                    self.do_parse(content, node)
+                    content = ViewList()
+
+                f = new_f
+
                 # sphinx counts lines from 0
                 ln = int(match.group(2)) - 1
             else:
                 content.append(line, f, ln)
 
-        buf  = self.state.memo.title_styles, self.state.memo.section_level, self.state.memo.reporter
+        kernellog.info(self.state.document.settings.env.app, "%s: parsed %i lines" % (fname, n))
 
+        if content:
+            self.do_parse(content, node)
+
+        return node.children
+
+    def do_parse(self, content, node):
         if Use_SSI:
             with switch_source_input(self.state, content):
                 self.state.nested_parse(content, 0, node, match_titles=1)
         else:
+            buf  = self.state.memo.title_styles, self.state.memo.section_level, self.state.memo.reporter
+
             self.state.memo.title_styles  = []
             self.state.memo.section_level = 0
             self.state.memo.reporter      = AutodocReporter(content, self.state.memo.reporter)
@@ -176,5 +191,3 @@ class KernelCmd(Directive):
                 self.state.nested_parse(content, 0, node, match_titles=1)
             finally:
                 self.state.memo.title_styles, self.state.memo.section_level, self.state.memo.reporter = buf
-
-        return node.children
-- 
2.21.0

