Return-Path: <SRS0=p3aP=EF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15640C63699
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 07:43:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AAD9022253
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 07:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604043811;
	bh=W7PNLmhh//aID+0WBTkeSWxEJWNoZT9N7SOJWc4l/FA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=PpLhALnu498F82QpnRhR9t4sAswOYu2p5u6gs3fDg43aF9QxINJrwTT/LX6xAuTS8
	 gDA8rEtQrERem+9fdUjP92Re5BbpnWj/NmTZhtOxNBPl3B/75x2+t81a20dcbWCEHX
	 pxYo5n0Pn0+fqURusEeX4TJeFOkOqSTyM+9ksnLo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbgJ3Hn2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Oct 2020 03:43:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:51662 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726054AbgJ3HlE (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 30 Oct 2020 03:41:04 -0400
Received: from mail.kernel.org (ip5f5ad5bb.dynamic.kabel-deutschland.de [95.90.213.187])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 95A8022243;
        Fri, 30 Oct 2020 07:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604043662;
        bh=W7PNLmhh//aID+0WBTkeSWxEJWNoZT9N7SOJWc4l/FA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MDSZTmeulo+LBfb/X/fU4V85aJDpWS00gcBzero4Sza+K+dqvkqbzjgEKTs2U8kMp
         oPdowqteqwb2Xe8LwyhjySvpojLoHfPkZsYJ7VJWfX4A4UVZr6m4ULduNOFx5X7MN9
         rudHuQtooje6c5uoX78WW7bKCtQdgOrVgkREaP6w=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kYP1w-004Ofo-MT; Fri, 30 Oct 2020 08:41:00 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 14/39] docs: kernel_abi.py: make it compatible with Sphinx 1.7+
Date:   Fri, 30 Oct 2020 08:40:33 +0100
Message-Id: <f2b25caef5db7738629773a03463908d3b39b83a.1604042072.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1604042072.git.mchehab+huawei@kernel.org>
References: <cover.1604042072.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The same way kerneldoc.py needed changes to work with newer
Sphinx, this script needs the same changes.

While here, reorganize the include order to match kerneldoc.py.

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

