Return-Path: <SRS0=Pt5A=DH=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 802BFC47425
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 13:28:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4710E20754
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 13:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601472536;
	bh=Rn7zJJ3ZS9RPVx8dkqXQwAQflBR7NMWGCPQ1PdLSg4M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=zxp2JNBohwL45BGOki2MDfafLv28zR4UA+Im5KKOuN5o7FGvaWcWFafPazvZXAef5
	 1C5mUFkfMEXf6sg5fsxDA7SKw+DK30X0S7Ka6LM9ttzh1XtpBsG5oITTD0tVIFcWWh
	 WpnORC42Jv1op/hbFB9GFmj9zgSpMSMXb2vko5TY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730430AbgI3N2z (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 30 Sep 2020 09:28:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:38720 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730098AbgI3NZU (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 30 Sep 2020 09:25:20 -0400
Received: from mail.kernel.org (unknown [95.90.213.196])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C3024207C3;
        Wed, 30 Sep 2020 13:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601472319;
        bh=Rn7zJJ3ZS9RPVx8dkqXQwAQflBR7NMWGCPQ1PdLSg4M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pzsrPi24Ig2jYz9uBi/LepfZWrzZ+z2XmRhXP8DlARLdfGUuekn4zWwl9OhbUdfAH
         01oqvKaBikCFZVyS0D+QvLWcviP6iUAYgOkojFz5x28QdXXCZ5CCfwZJj29+m3xspL
         8Z0PBOsvY/y1N+LSjsyVXiJAXliwdSihHH3YnwWg=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kNc6f-001XJH-Sb; Wed, 30 Sep 2020 15:25:17 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= 
        <nfraprado@protonmail.com>, Changbin Du <changbin.du@intel.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 11/52] docs: kerneldoc.py: add support for kerneldoc -nosymbol
Date:   Wed, 30 Sep 2020 15:24:34 +0200
Message-Id: <6a783af454048eb1f421f0400f986248e7d53eb1.1601467849.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601467849.git.mchehab+huawei@kernel.org>
References: <cover.1601467849.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Currently, there's no way to exclude identifiers from
a kernel-doc markup. Add support for it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/doc-guide/kernel-doc.rst | 8 ++++++++
 Documentation/sphinx/kerneldoc.py      | 7 +++++++
 2 files changed, 15 insertions(+)

diff --git a/Documentation/doc-guide/kernel-doc.rst b/Documentation/doc-guide/kernel-doc.rst
index 4fd86c21397b..52a87ab4c99f 100644
--- a/Documentation/doc-guide/kernel-doc.rst
+++ b/Documentation/doc-guide/kernel-doc.rst
@@ -490,6 +490,14 @@ identifiers: *[ function/type ...]*
     .. kernel-doc:: lib/idr.c
        :identifiers:
 
+no-identifiers: *[ function/type ...]*
+  Exclude documentation for each *function* and *type* in *source*.
+
+  Example::
+
+    .. kernel-doc:: lib/bitmap.c
+       :no-identifiers: bitmap_parselist
+
 functions: *[ function/type ...]*
   This is an alias of the 'identifiers' directive and deprecated.
 
diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
index 6686955d1def..233f610539f0 100644
--- a/Documentation/sphinx/kerneldoc.py
+++ b/Documentation/sphinx/kerneldoc.py
@@ -62,6 +62,7 @@ class KernelDocDirective(Directive):
         'export': directives.unchanged,
         'internal': directives.unchanged,
         'identifiers': directives.unchanged,
+        'no-identifiers': directives.unchanged,
         'functions': directives.unchanged,
     }
     has_content = False
@@ -99,6 +100,12 @@ class KernelDocDirective(Directive):
             else:
                 cmd += ['-no-doc-sections']
 
+        if 'no-identifiers' in self.options:
+            no_identifiers = self.options.get('no-identifiers').split()
+            if no_identifiers:
+                for i in no_identifiers:
+                    cmd += ['-nosymbol', i]
+
         for pattern in export_file_patterns:
             for f in glob.glob(env.config.kerneldoc_srctree + '/' + pattern):
                 env.note_dependency(os.path.abspath(f))
-- 
2.26.2

