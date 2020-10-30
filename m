Return-Path: <SRS0=p3aP=EF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6174BC4741F
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 15:51:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1C29320A8B
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 15:51:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727134AbgJ3Pv2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Oct 2020 11:51:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726384AbgJ3Pv2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Oct 2020 11:51:28 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99572C0613CF
        for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2020 08:51:28 -0700 (PDT)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 303942E7;
        Fri, 30 Oct 2020 15:51:28 +0000 (UTC)
Date:   Fri, 30 Oct 2020 09:51:27 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     linux-doc@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        "=?UTF-8?B?TsOtY29s?= =?UTF-8?B?YXM=?= F. R. A. Prado" 
        <nfraprado@protonmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        lkcamp@lists.libreplanetbr.org, andrealmeid@collabora.com
Subject: [PATCH RFC] docs: fix automarkup regression on Python 2
Message-ID: <20201030095127.70f19d75@lwn.net>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

It turns out that the Python 2 re module lacks the ASCII flag, so don't try
to use it there.

Fixes: f66e47f98c1e ("docs: automarkup.py: Fix regexes to solve sphinx 3 warnings")
Reported-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/sphinx/automarkup.py | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/Documentation/sphinx/automarkup.py b/Documentation/sphinx/automarkup.py
index 409dbc4100de..3e81ebab26ed 100644
--- a/Documentation/sphinx/automarkup.py
+++ b/Documentation/sphinx/automarkup.py
@@ -15,6 +15,14 @@ else:
 import re
 from itertools import chain
 
+#
+# Python 2 lacks re.ASCII...
+#
+try:
+    ascii_p3 = re.ASCII
+except AttributeError:
+    ascii_p3 = 0
+
 #
 # Regex nastiness.  Of course.
 # Try to identify "function()" that's not already marked up some
@@ -22,22 +30,22 @@ from itertools import chain
 # :c:func: block (i.e. ":c:func:`mmap()`s" flakes out), so the last
 # bit tries to restrict matches to things that won't create trouble.
 #
-RE_function = re.compile(r'\b(([a-zA-Z_]\w+)\(\))', flags=re.ASCII)
+RE_function = re.compile(r'\b(([a-zA-Z_]\w+)\(\))', flags=ascii_p3)
 
 #
 # Sphinx 2 uses the same :c:type role for struct, union, enum and typedef
 #
 RE_generic_type = re.compile(r'\b(struct|union|enum|typedef)\s+([a-zA-Z_]\w+)',
-                             flags=re.ASCII)
+                             flags=ascii_p3)
 
 #
 # Sphinx 3 uses a different C role for each one of struct, union, enum and
 # typedef
 #
-RE_struct = re.compile(r'\b(struct)\s+([a-zA-Z_]\w+)', flags=re.ASCII)
-RE_union = re.compile(r'\b(union)\s+([a-zA-Z_]\w+)', flags=re.ASCII)
-RE_enum = re.compile(r'\b(enum)\s+([a-zA-Z_]\w+)', flags=re.ASCII)
-RE_typedef = re.compile(r'\b(typedef)\s+([a-zA-Z_]\w+)', flags=re.ASCII)
+RE_struct = re.compile(r'\b(struct)\s+([a-zA-Z_]\w+)', flags=ascii_p3)
+RE_union = re.compile(r'\b(union)\s+([a-zA-Z_]\w+)', flags=ascii_p3)
+RE_enum = re.compile(r'\b(enum)\s+([a-zA-Z_]\w+)', flags=ascii_p3)
+RE_typedef = re.compile(r'\b(typedef)\s+([a-zA-Z_]\w+)', flags=ascii_p3)
 
 #
 # Detects a reference to a documentation page of the form Documentation/... with
-- 
2.26.2

