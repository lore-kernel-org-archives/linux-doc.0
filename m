Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 45B337D912
	for <lwn-linux-doc@archive.lwn.net>; Tue, 16 Jul 2019 12:11:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732614AbfGPMK7 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 16 Jul 2019 08:10:59 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:39050 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732581AbfGPMK7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 Jul 2019 08:10:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=zSkpT2kI6Irbp+AyTgR9n3iCnGLtAlhgUnqc7UxkNnU=; b=FgYwDaCkFk1Cvaw0DpBIQQwasV
        DhU5TepnXBERuvioZcJmoM9I/WcGBmWZxXF5gbwYIgmkwROslKpDE6TuaYEwaD6TPcFKZ7IaGR9my
        bOyDxTZ/IeQzkWWfnvSZQzom17MiKnPgAXjv47sDlL+45222FJvgl1dgk5k06CT0ywvicW8DRHKk3
        YdDoY/A/bkJvqbFQGGci+CdX92BIJvNtyBaZKFqlflHJJ+f6b6ZHqkIu6TCCq6TwQB02Yso5AyXJn
        YtI5BGAF3haHTK5WfRwzNvtBsOPO9QmbSCuDq5mTsXGFx2DjT4eApf6j7Q/RkAJSl8TQH+PXswo7P
        4Pum6q4w==;
Received: from [189.27.46.152] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hnMIL-0004hv-8v; Tue, 16 Jul 2019 12:10:57 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hnMII-0000Rg-Ub; Tue, 16 Jul 2019 09:10:54 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 12/14] docs: load_config.py: avoid needing a conf.py just due to LaTeX docs
Date:   Tue, 16 Jul 2019 09:10:51 -0300
Message-Id: <4a9017b78c47fa9411e4f79b72c52cfd0535ba5e.1563277838.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1563277838.git.mchehab+samsung@kernel.org>
References: <cover.1563277838.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Right now, for every directory that we need to have LaTeX output,
a conf.py file is required.

That causes an extra overhead and it is actually a hack, as
the latex_documents line there are usually a copy of the ones
that are there already at the main conf.py.

So, instead, re-use the global latex_documents var, just
adjusting the path to be relative ones.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/sphinx/load_config.py | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/Documentation/sphinx/load_config.py b/Documentation/sphinx/load_config.py
index 301a21aa4f63..101e6f0b0fcf 100644
--- a/Documentation/sphinx/load_config.py
+++ b/Documentation/sphinx/load_config.py
@@ -21,6 +21,29 @@ def loadConfig(namespace):
         and os.path.normpath(namespace["__file__"]) != os.path.normpath(config_file) ):
         config_file = os.path.abspath(config_file)
 
+        # Let's avoid one conf.py file just due to latex_documents
+        start = config_file.find('Documentation/')
+        if start >= 0:
+            start = config_file.find('/', start + 1)
+
+        end = config_file.rfind('/')
+        if start >= 0 and end > 0:
+            dir = config_file[start + 1:end]
+
+            print("source directory: %s" % dir)
+            new_latex_docs = []
+            latex_documents = namespace['latex_documents']
+
+            for l in latex_documents:
+                if l[0].find(dir) == 0:
+                    has = True
+                    fn = l[0][len(dir) + 1:]
+                    new_latex_docs.append((fn, l[1], l[2], l[3], l[4]))
+                    break
+
+            namespace['latex_documents'] = new_latex_docs
+
+        # If there is an extra conf.py file, load it
         if os.path.isfile(config_file):
             sys.stdout.write("load additional sphinx-config: %s\n" % config_file)
             config = namespace.copy()
@@ -29,4 +52,6 @@ def loadConfig(namespace):
             del config['__file__']
             namespace.update(config)
         else:
-            sys.stderr.write("WARNING: additional sphinx-config not found: %s\n" % config_file)
+            config = namespace.copy()
+            config['tags'].add("subproject")
+            namespace.update(config)
-- 
2.21.0

