Return-Path: <SRS0=jIxK=EE=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B696CC4363A
	for <linux-doc@archiver.kernel.org>; Thu, 29 Oct 2020 00:35:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 61B0320791
	for <linux-doc@archiver.kernel.org>; Thu, 29 Oct 2020 00:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603931712;
	bh=/2HUC3Hs0ZsywFfEOKluCFO1WHQkw+dJbh2gNebVfbM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=hQk44PUdlUyrXPGdcBWzyIX5FqqF/S2dMZFjnjGiCLTZ0pLEKa09Ul8thgl+tdJKz
	 cpz2lCUgwGVC3yYYtRCn3TAUk2rIOBz/VHybSdWW5oyaUwq6EJwfd+8l9/WEFGBgfg
	 ZbqIJcDzoBtN83coRkC2xe8Cl3bUfzOXBfHkrJqo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731952AbgJ1WT3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 28 Oct 2020 18:19:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:60518 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731721AbgJ1WRn (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 28 Oct 2020 18:17:43 -0400
Received: from mail.kernel.org (ip5f5ad5b2.dynamic.kabel-deutschland.de [95.90.213.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AB42D2476D;
        Wed, 28 Oct 2020 14:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603895014;
        bh=/2HUC3Hs0ZsywFfEOKluCFO1WHQkw+dJbh2gNebVfbM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=N024H8aL30eYYuIPNHW1x0prHj0RpKZNZbscx3NyWzwcPtIW/3CgIr1rxGUyia7fN
         +SkN7yyf78kzze2jFWvCfvCnqE/5L3ZRSnuEDnhq4DmYIAYpQ/AlHzyS+WSyQTSZnc
         ksSwiFxFfUpkKNR0hj1lhfrr0BGI6O+igINO99hg=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kXmMO-003hlM-MJ; Wed, 28 Oct 2020 15:23:32 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        "Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 14/33] docs: kernel_abi.py: make it compatible with Sphinx 1.7+
Date:   Wed, 28 Oct 2020 15:23:12 +0100
Message-Id: <b51e7b564b8d8403ea537dba67c82db40b420257.1603893146.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1603893146.git.mchehab+huawei@kernel.org>
References: <cover.1603893146.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

The same way kerneldoc.py needed changes to work with newer
Sphinx, this script needs the same changes.

While here, reorganize the include order to match kerneldoc.py.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/kernel_abi.py | 39 +++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/Documentation/sphinx/kernel_abi.py b/Documentation/sphinx/kernel_abi.py
index fe69c213716d..8601a3b75a28 100644
--- a/Documentation/sphinx/kernel_abi.py
+++ b/Documentation/sphinx/kernel_abi.py
@@ -33,18 +33,27 @@ u"""
 """
 
 import codecs
-import sys
 import os
-from os import path
 import subprocess
+import sys
 
-from sphinx.ext.autodoc import AutodocReporter
+from os import path
 
-from docutils import nodes
-from docutils.parsers.rst import Directive, directives
+from docutils import nodes, statemachine
 from docutils.statemachine import ViewList
+from docutils.parsers.rst import directives, Directive
 from docutils.utils.error_reporting import ErrorString
 
+#
+# AutodocReporter is only good up to Sphinx 1.7
+#
+import sphinx
+
+Use_SSI = sphinx.__version__[:3] >= '1.7'
+if Use_SSI:
+    from sphinx.util.docutils import switch_source_input
+else:
+    from sphinx.ext.autodoc import AutodocReporter
 
 __version__  = '1.0'
 
@@ -142,11 +151,17 @@ class KernelCmd(Directive):
             content.append(l, fname, c)
 
         buf  = self.state.memo.title_styles, self.state.memo.section_level, self.state.memo.reporter
-        self.state.memo.title_styles  = []
-        self.state.memo.section_level = 0
-        self.state.memo.reporter      = AutodocReporter(content, self.state.memo.reporter)
-        try:
-            self.state.nested_parse(content, 0, node, match_titles=1)
-        finally:
-            self.state.memo.title_styles, self.state.memo.section_level, self.state.memo.reporter = buf
+
+        if Use_SSI:
+            with switch_source_input(self.state, content):
+                self.state.nested_parse(content, 0, node, match_titles=1)
+        else:
+            self.state.memo.title_styles  = []
+            self.state.memo.section_level = 0
+            self.state.memo.reporter      = AutodocReporter(content, self.state.memo.reporter)
+            try:
+                self.state.nested_parse(content, 0, node, match_titles=1)
+            finally:
+                self.state.memo.title_styles, self.state.memo.section_level, self.state.memo.reporter = buf
+
         return node.children
-- 
2.26.2

