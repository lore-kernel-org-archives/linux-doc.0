Return-Path: <SRS0=GARK=DU=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDC89C433E7
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 12:02:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8152C20870
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 12:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602590520;
	bh=8Wg4J7Lyd/Va8b7XV8z9jXdPVZ/IrSKHVEYF1TFbuSY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=IhTbs4tFM361gts+Em7+EQSbgKLPk7ezh+DJcwhJ3bi4skkqh3lZ2Ox4IQoHBswcA
	 XBRjaJNz3NukCa8S2mo35TLDI6Q884YcWPHYakBjqw6LTOLQosxOOP6g1fymREqz1T
	 k0eXVRxt1pdJDzUBf0kQcBJUyO3F/SeGseJN0AH8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728667AbgJMMB7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Oct 2020 08:01:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:57414 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727333AbgJMLyk (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Oct 2020 07:54:40 -0400
Received: from mail.kernel.org (ip5f5ad5b2.dynamic.kabel-deutschland.de [95.90.213.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8CEF421D40;
        Tue, 13 Oct 2020 11:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602590079;
        bh=8Wg4J7Lyd/Va8b7XV8z9jXdPVZ/IrSKHVEYF1TFbuSY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PUKSBVvFI6aGpmbBor6os751W26x+bRRPqQ5tsYv2UsDxYjAhhj6oPppI8TW6et0a
         25553GSikwZhJNCokzqUQ8QMXHGCrxiypYPWybP5hbr0AMMOP+SfQ00443gGggmUhK
         Oo6CYRZe8VnKXxnjPSU7LBBB1aWepNCJFTHG3tco=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kSIt3-006CTc-E5; Tue, 13 Oct 2020 13:54:37 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>, linux-kernel@vger.kernel.org
Subject: [PATCH v6 12/80] docs: cdomain.py: extend it to handle new Sphinx 3.x tags
Date:   Tue, 13 Oct 2020 13:53:27 +0200
Message-Id: <e92c9caa79e88a2b3c4609eb00734d9d5f2281d0.1602589096.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602589096.git.mchehab+huawei@kernel.org>
References: <cover.1602589096.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

While most of the C domain parsing is done via kernel-doc,
some RST files use C domain tags directly.

While several of them can be removed for Sphinx < 3.0, due
to automarkup.py, and several others that could be
converted into kernel-doc markups, changes like that are
time-consuming, and may not fit all cases.

As we already have the cdomain.py for handing backward
compatibility with Sphinx versions below 3.0, let's
make it more complete, in order to cover any usage of the
newer tags outside kernel-doc.

This way, it should be feasible to use the new tags inside
the Kernel tree, without losing backward compatibility.

This should allow fixing the remaining warnings with
the Kernel tags.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/cdomain.py | 40 ++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/Documentation/sphinx/cdomain.py b/Documentation/sphinx/cdomain.py
index 35805c44a4fc..014a5229e57a 100644
--- a/Documentation/sphinx/cdomain.py
+++ b/Documentation/sphinx/cdomain.py
@@ -54,7 +54,7 @@ namespace = None
 #
 # Handle trivial newer c domain tags that are part of Sphinx 3.1 c domain tags
 # - Store the namespace if ".. c:namespace::" tag is found
-
+#
 RE_namespace = re.compile(r'^\s*..\s*c:namespace::\s*(\S+)\s*$')
 
 def markup_namespace(match):
@@ -64,10 +64,48 @@ def markup_namespace(match):
 
     return ""
 
+#
+# Handle c:macro for function-style declaration
+#
+RE_macro = re.compile(r'^\s*..\s*c:macro::\s*(\S+)\s+(\S.*)\s*$')
+def markup_macro(match):
+    return ".. c:function:: " + match.group(1) + ' ' + match.group(2)
+
+#
+# Handle newer c domain tags that are evaluated as .. c:type: for
+# backward-compatibility with Sphinx < 3.0
+#
+RE_ctype = re.compile(r'^\s*..\s*c:(struct|union|enum|enumerator|alias)::\s*(.*)$')
+
+def markup_ctype(match):
+    return ".. c:type:: " + match.group(2)
+
+#
+# Handle newer c domain tags that are evaluated as :c:type: for
+# backward-compatibility with Sphinx < 3.0
+#
+RE_ctype_refs = re.compile(r':c:(var|struct|union|enum|enumerator)::`([^\`]+)`')
+def markup_ctype_refs(match):
+    return ":c:type:`" + match.group(2) + '`'
+
+#
+# Simply convert :c:expr: and :c:texpr: into a literal block.
+#
+RE_expr = re.compile(r':c:(expr|texpr):`([^\`]+)`')
+def markup_c_expr(match):
+    return '\ ``' + match.group(2) + '``\ '
+
+#
+# Parse Sphinx 3.x C markups, replacing them by backward-compatible ones
+#
 def c_markups(app, docname, source):
     result = ""
     markup_func = {
         RE_namespace: markup_namespace,
+        RE_expr: markup_c_expr,
+        RE_macro: markup_macro,
+        RE_ctype: markup_ctype,
+        RE_ctype_refs: markup_ctype_refs,
     }
 
     lines = iter(source[0].splitlines(True))
-- 
2.26.2

