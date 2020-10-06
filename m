Return-Path: <SRS0=3O92=DN=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EB6EC4727E
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 14:04:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F15E320782
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 14:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601993094;
	bh=7ozHOFOhTxOMv4Cj9/DZtWCYE/TGvOymYMA5/4LPf1I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=KmBTkJXjLyg0lMNwo2fVZEzf77b2OegHQZRedQy4o6NCxSHRhrDeumGMrx4kKys7h
	 c7dg1z5FIjN8rBxNwIBlBMLQVa0UxkmlBsPaxHWwctne9I0PGV37bNs67s+lzaRfGy
	 u7Ih36+JcLrKhTysvYOeFoTO24LIvzze3xDZk348=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726762AbgJFOEw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Oct 2020 10:04:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:33530 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726551AbgJFOD4 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 6 Oct 2020 10:03:56 -0400
Received: from mail.kernel.org (ip5f5ad5bd.dynamic.kabel-deutschland.de [95.90.213.189])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1633723718;
        Tue,  6 Oct 2020 14:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601993035;
        bh=7ozHOFOhTxOMv4Cj9/DZtWCYE/TGvOymYMA5/4LPf1I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=xWRKtIRnoocJiQuPQHdXVrCZFsRQNlsXOK+3gA1/CL056+twRe3RNIm9C8UcEV6uU
         Vz/i7OXMNkHOHgR3NK6LsK5zPpU9F7s8EZg+cAAZtFgKHhaLlRdpsSu+RTbFt43VH2
         1m25ovxatq77D5qvYbM1cG0pGu3uiBd9LPZ581ec=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kPnZJ-0019Gq-6l; Tue, 06 Oct 2020 16:03:53 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 51/52] docs: conf.py: fix c:function support with Sphinx 3.x
Date:   Tue,  6 Oct 2020 16:03:48 +0200
Message-Id: <b65681df9ca14d046f5c90fc9e40546705b48388.1601992016.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601992016.git.mchehab+huawei@kernel.org>
References: <cover.1601992016.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Sphinx C parser for the C domain is now more pedantic when
trying to identify the function types. That prevents scope
macros to be used as type defines.

Yet, since 3.0.2, it is possible to provide it a list of
such macros. Add them, in order to solve several Sphinx 3.x
warnings.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/conf.py | 65 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 62 insertions(+), 3 deletions(-)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 3875401486de..b402bd8f6f71 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -47,9 +47,68 @@ extensions = ['kerneldoc', 'rstFlatTable', 'kernel_include',
 #
 if major >= 3:
     sys.stderr.write('''WARNING: The kernel documentation build process
-	does not work correctly with Sphinx v3.0 and above.  Expect errors
-	in the generated output.
-	''')
+        does not work correctly with Sphinx v3.0 and above.  Expect errors
+        in the generated output.
+        ''')
+    if minor > 0 or patch >= 2:
+        # Sphinx c function parser is more pedantic with regards to type
+        # checking. Due to that, having macros at c:function cause problems.
+        # Those needed to be scaped by using c_id_attributes[] array
+        c_id_attributes = [
+            # GCC Compiler types not parsed by Sphinx:
+            "__restrict__",
+
+            # include/linux/compiler_types.h:
+            "__iomem",
+            "__kernel",
+            "noinstr",
+            "notrace",
+            "__percpu",
+            "__rcu",
+            "__user",
+
+            # include/linux/compiler_attributes.h:
+            "__alias",
+            "__aligned",
+            "__aligned_largest",
+            "__always_inline",
+            "__assume_aligned",
+            "__cold",
+            "__attribute_const__",
+            "__copy",
+            "__pure",
+            "__designated_init",
+            "__visible",
+            "__printf",
+            "__scanf",
+            "__gnu_inline",
+            "__malloc",
+            "__mode",
+            "__no_caller_saved_registers",
+            "__noclone",
+            "__nonstring",
+            "__noreturn",
+            "__packed",
+            "__pure",
+            "__section",
+            "__always_unused",
+            "__maybe_unused",
+            "__used",
+            "__weak",
+            "noinline",
+
+            # include/linux/memblock.h:
+            "__init_memblock",
+            "__meminit",
+
+            # include/linux/init.h:
+            "__init",
+            "__ref",
+
+            # include/linux/linkage.h:
+            "asmlinkage",
+        ]
+
 else:
     extensions.append('cdomain')
     extensions.append('automarkup')
-- 
2.26.2

