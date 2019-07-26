Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7C1F57D917
	for <lwn-linux-doc@archive.lwn.net>; Fri, 26 Jul 2019 11:31:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725903AbfGZLba (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 26 Jul 2019 07:31:30 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:39258 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbfGZLba (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Jul 2019 07:31:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=HE5rlFE4PKQ7V4VD7BgtDqwq8R+nTl6rYk0yQ/3c7NY=; b=eiHSt8yRDFKmGagm2cpotWatif
        tftFd1eg7qgOTp1iaxyrQ+NiZSLQkOv9w0mOvviFgvZYfHgA/u3gfwcijVG7fMkIQZQJi6xZA3BTh
        0j8zLj1K4z/cH2FfV+gMCNdhLIh9QSjDf2+fgqfdQwQOaFr5FOmojrwz73dbBM3rvDT5BsZbYuT6E
        RrvdYny7I6Bf7ipUEN4KT3mY1NjA5MN1+EQXLk/bF5wDBq3jhf3VsP+tIy9nl5pj1VRPrtaUEhitr
        Tk+NyrrJqU8iL/1UXP6a+xPZ10EDcNC6tB/ujX9dOgEjaCVWoR4GgtajNMkt8h/o7L3LbTnt2SGsf
        R0j1T4DQ==;
Received: from [179.95.31.157] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hqyRb-0005vJ-Tj; Fri, 26 Jul 2019 11:31:27 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hqyRZ-0008Ej-MR; Fri, 26 Jul 2019 08:31:25 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH v2 09/10] docs: load_config.py: avoid needing a conf.py just due to LaTeX docs
Date:   Fri, 26 Jul 2019 08:31:23 -0300
Message-Id: <2fcd675c55afd3da2756f4f10bdfccabf601411f.1564139914.git.mchehab+samsung@kernel.org>
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
index 301a21aa4f63..eeb394b39e2c 100644
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
+                if l[0].find(dir + '/') == 0:
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

