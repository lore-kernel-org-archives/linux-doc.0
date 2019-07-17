Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9E6C27D90D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 17 Jul 2019 11:05:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbfGQLFj (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 17 Jul 2019 07:05:39 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:47048 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726580AbfGQLFh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 17 Jul 2019 07:05:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=nwm0MuWiU+CZGPXfeq9z6A2WqAr7Jlbvc3SpX02xbaE=; b=P0n2KeMZ6oTm9R6RuciGbmrfFM
        COd+cwb2sUbD4DMbi8D/APRtoTXxfbdDlr40lLY3Vsw0kJbcOnr9DB9crKI/tOm5jAgYxxC/XgTMg
        e4CRRnneeulpRftDF+nOoBLdOeZlSuaXWJA9xZdUILzeV1Xg72VjdDBkFOAJqXoiEq7+NciX7RqTX
        jZtFJ+I9uEakOK72N4HHfI8xnY3mOOajtAf63axXMcVBr3/IVYy/nFDXCM30Rn5jZtuUCCLd7K4ms
        I7G0CXATVX/i9YhiL5Z8IH+YPhbBtftutoXtOI7zpvk4z83Mt98Ead9Z4/MTs1FHX+D8SwpHnfUsV
        0L2gwiYw==;
Received: from [191.33.154.161] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hnhke-00054L-Lr; Wed, 17 Jul 2019 11:05:36 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hnhkc-00039V-Np; Wed, 17 Jul 2019 08:05:34 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     gregkh@linuxfoundation.org
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH v3 10/20] docs: kernel_abi.py: use --enable-lineno for get_abi.pl
Date:   Wed, 17 Jul 2019 08:05:23 -0300
Message-Id: <58f8696dd59fec71ffce9461f65a6ef49f7ccb3e.1563360659.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1563360659.git.mchehab+samsung@kernel.org>
References: <cover.1563360659.git.mchehab+samsung@kernel.org>
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
index 5d43cac73d0a..efa338e18764 100644
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

