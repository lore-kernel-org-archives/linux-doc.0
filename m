Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 509887D912
	for <lwn-linux-doc@archive.lwn.net>; Wed, 17 Jul 2019 12:28:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbfGQM20 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 17 Jul 2019 08:28:26 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:53832 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbfGQM2Z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 17 Jul 2019 08:28:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=W3Fxw06vy/CbYdEr7aToxnoO7ZKperodN1Hgl9rSg3k=; b=YhI4b3Wwc/8gJ6OZge5l/pSgqC
        AnGayXcca0m67xL9WDjzN9+wohiEkgZsytFas3iHYQn9PsI/WRWgfFC85t4Y21Zo4ihrgEwId55AY
        c5jAr7oQQjY5wj05TmOlgFyGHsP78N2NYenLpVL9zdWUPY7YsHBlXUMkiH4k5Fmj/g77ioQFsA30c
        VjblNlODJnxDd2VgJS+ZV+K6h61tJo+b5XoURlwuXjmr0kbpcb+QSytHJz/UhEDt3KxdN2p5+RZBp
        9gOIO3x2hcFEP6nY3RP/vNqJKqGZx8Sd/MOV1cx1CIgNgtmHxu7FCiTGbzF/7fhLPJd039+ud9NTX
        altFrS2g==;
Received: from [191.33.154.161] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hnj2m-0006fU-GB; Wed, 17 Jul 2019 12:28:24 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hnj2j-00052K-Vy; Wed, 17 Jul 2019 09:28:21 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     gregkh@linuxfoundation.org
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH v4 07/15] docs: kernel_abi.py: use --enable-lineno for get_abi.pl
Date:   Wed, 17 Jul 2019 09:28:11 -0300
Message-Id: <cab91970bbef3616fc140bdaaf0e199abe1f30b3.1563365880.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1563365880.git.mchehab+samsung@kernel.org>
References: <cover.1563365880.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Just like kernel-doc extension, we need to be able to identify
what part of an imported document has issues, as reporting them
as:

	get_abi.pl rest --dir $srctree/Documentation/ABI/obsolete --rst-source:1689: ERROR: Unexpected indentation.

Makes a lot harder for someone to fix.

It should be noticed that it the line which will be reported is
the line where the "What:" definition is, and not the line
with actually has an error.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/sphinx/kernel_abi.py | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/Documentation/sphinx/kernel_abi.py b/Documentation/sphinx/kernel_abi.py
index 0b2a89d4c12d..615b3773bb62 100644
--- a/Documentation/sphinx/kernel_abi.py
+++ b/Documentation/sphinx/kernel_abi.py
@@ -35,6 +35,7 @@ import codecs
 import os
 import subprocess
 import sys
+import re
 
 from os import path
 
@@ -92,7 +93,7 @@ class KernelCmd(Directive):
 
         env = doc.settings.env
         cwd = path.dirname(doc.current_source)
-        cmd = "get_abi.pl rest --dir "
+        cmd = "get_abi.pl rest --enable-lineno --dir "
         cmd += self.arguments[0]
 
         srctree = path.abspath(os.environ["srctree"])
@@ -136,7 +137,7 @@ class KernelCmd(Directive):
                               % (self.name, ErrorString(exc)))
         return out
 
-    def nestedParse(self, lines, fname):
+    def nestedParse(self, lines, f):
         content = ViewList()
         node    = nodes.section()
 
@@ -146,8 +147,17 @@ class KernelCmd(Directive):
                 code_block += "\n    " + l
             lines = code_block + "\n\n"
 
-        for c, l in enumerate(lines.split("\n")):
-            content.append(l, fname, c)
+        line_regex = re.compile("^#define LINENO (\S+)\#([0-9]+)$")
+        ln = 0
+
+        for line in lines.split("\n"):
+            match = line_regex.search(line)
+            if match:
+                f = match.group(1)
+                # sphinx counts lines from 0
+                ln = int(match.group(2)) - 1
+            else:
+                content.append(line, f, ln)
 
         buf  = self.state.memo.title_styles, self.state.memo.section_level, self.state.memo.reporter
 
-- 
2.21.0

