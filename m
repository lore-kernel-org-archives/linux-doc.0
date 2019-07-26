Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id ED1677D2F0
	for <lwn-linux-doc@archive.lwn.net>; Fri, 26 Jul 2019 11:31:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726004AbfGZLb3 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 26 Jul 2019 07:31:29 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:39212 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725903AbfGZLb3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Jul 2019 07:31:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=FwjJ44KcHI+J2CmMI5L2MMZwSHXsJeYVBp2xZzEbj/c=; b=c4tTTvefRe5yNu1k3xMfqy0KvJ
        ysO4nhO/aAivX470QWla86TQoYCNA8AERMuerRHXAd8gJZ8ivDbhWGm2n7Emc2ZL+QfWoyaQ/7T2C
        /12ZqaZ/2V+oY6V6OuumMtgMx7GdPl+bJK10D07aqCfH6hxUtC3JxE7Ujxm9Orn26sWKF6GDhw57m
        gOlLQ/6+8fGwoztJes2xeQVmOBQhaFN2OfrtGiThfKzYnEe0oKVs6lpOU8Tx5GaPQ4F6Vi5/gi3Ki
        d9kFVkx31ojaH6gu+h5Q+dZ2thgvMDfcroYB5ACcQ+55klG8YmUvUndgSCcgDtq+ENHdNx7o9aVFO
        ogTBqIxw==;
Received: from [179.95.31.157] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hqyRb-0005vF-O0; Fri, 26 Jul 2019 11:31:27 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hqyRZ-0008E4-Cu; Fri, 26 Jul 2019 08:31:25 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH v2 01/10] docs: pdf: add all Documentation/*/index.rst to PDF output
Date:   Fri, 26 Jul 2019 08:31:15 -0300
Message-Id: <96cc04c114ad36cd660b2954f7279e27a4aaa372.1564139914.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1564139914.git.mchehab+samsung@kernel.org>
References: <cover.1564139914.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Currently, all index files should be manually added to the
latex_documents array at conf.py.

While this allows fine-tuning some LaTeX specific things, like
the name of the output file and the name of the document, it
is not uncommon to forget adding new documents there.

So, add a logic that will seek for all Documentation/*/index.rst.
If the index is not yet at latex_documents, it includes using
a reasonable default.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/conf.py | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 3b2397bcb565..13b5f711bddf 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -410,6 +410,21 @@ latex_documents = [
      'The kernel development community', 'manual'),
 ]
 
+# Add all other index files from Documentation/ subdirectories
+for fn in os.listdir('.'):
+    doc = os.path.join(fn, "index")
+    if os.path.exists(doc + ".rst"):
+        has = False
+        for l in latex_documents:
+            if l[0] == doc:
+                has = True
+                break
+        if not has:
+            latex_documents.append((doc, fn + '.tex',
+                                    'Linux %s Documentation' % fn.capitalize(),
+                                    'The kernel development community',
+                                    'manual'))
+
 # The name of an image file (relative to this directory) to place at the top of
 # the title page.
 #latex_logo = None
-- 
2.21.0

