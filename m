Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 415447D90D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 17 Jul 2019 11:05:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726685AbfGQLFh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 17 Jul 2019 07:05:37 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:47032 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726309AbfGQLFh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 17 Jul 2019 07:05:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=4yo27ijYQu1yYo30q/R/RGMGUqSkkm83kufrAmJA9ng=; b=MkCEN0nFHBus3x6OfsSFCXMnxr
        sZUGerslCZGhVgwLN2lLncXK8vEJWUkOmHJhDTKWwxWaX5cjg1UDWNIQJTYOZh49uFTMkxRiHS/U/
        aelxoNaO/NNy/aOTwSyXERo+8tfTiP2DWqvbbKy5JE/BVQttwP4jKuW/NrDT0EFC95GmdIM9baoxx
        pb8xEgTf8JnIOIT7rDWdNaNm2Ly51RDm1Cao4/v3nrbqkwHadBonWdYYV+BWm4uVhazsi+bj7qFEM
        tj2jN6gW2yTDXUCHUUWRpR0lFJppqUsNu+SeYCsLHi/a/nY7ZeImE1+1KJ7hkH0HGkf+UYOsbTz32
        bS4Wn8rQ==;
Received: from [191.33.154.161] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hnhke-00054I-Ik; Wed, 17 Jul 2019 11:05:36 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hnhkc-00039G-KY; Wed, 17 Jul 2019 08:05:34 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     gregkh@linuxfoundation.org
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH v3 07/20] docs: kernel_abi.py: make it compatible with Sphinx 1.7+
Date:   Wed, 17 Jul 2019 08:05:20 -0300
Message-Id: <b2a9fcdfa21c5bc06da92b1d93a39707a08fd6e0.1563360659.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1563360659.git.mchehab+samsung@kernel.org>
References: <cover.1563360659.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The same way kerneldoc.py needed changes to work with newer
Sphinx, this script needs the same changes.

While here, reorganize the include order to match kerneldoc.py.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/sphinx/kernel_abi.py | 39 +++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/Documentation/sphinx/kernel_abi.py b/Documentation/sphinx/kernel_abi.py
index 0f3e51e67e8d..2d5d582207f7 100644
--- a/Documentation/sphinx/kernel_abi.py
+++ b/Documentation/sphinx/kernel_abi.py
@@ -30,18 +30,27 @@ u"""
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
 
@@ -139,11 +148,17 @@ class KernelCmd(Directive):
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
2.21.0

