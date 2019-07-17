Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8AD597D92A
	for <lwn-linux-doc@archive.lwn.net>; Wed, 17 Jul 2019 11:05:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725941AbfGQLFi (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 17 Jul 2019 07:05:38 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:47026 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726085AbfGQLFh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 17 Jul 2019 07:05:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=WNiRsq7voQTs7B1oPyVixDdCGhlnrWKg3Vv2Nss1FD8=; b=Mx8kn086jZExp/G3DlgdXEa2UJ
        15mVyO+jqZpjptE2NsDK5yqdc2s0sAk9cb7Xrc0rJC15bQvKbkLDfI0FZdDwfxtM+fZZ/AS75yG9q
        n7uq2O/XY4EdqtcJq7h5e7szT98QWa4z6qbjtSWN1jj5LHabt2SlNlF/PWnGBK0/4eBsuSf4O3kCu
        Jmg1+1CtlKJILtvuT/sR23za9IoCKeDZ46PchNyUbPkZR+UhrOz3vhCIVwFvK+eF4GTArt/4a3UL7
        qyhgJ8XQ5MDmvc38phX0kl6Kvsea9ro2Vm8gr4a9eOGxWCM0KyzP9lUgyrRGfaOp9SdPVVfdjzmjo
        ojpUBA6w==;
Received: from [191.33.154.161] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hnhke-00054H-GR; Wed, 17 Jul 2019 11:05:36 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hnhkc-00039B-JW; Wed, 17 Jul 2019 08:05:34 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     gregkh@linuxfoundation.org
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH v3 06/20] docs: kernel_abi.py: fix UTF-8 support
Date:   Wed, 17 Jul 2019 08:05:19 -0300
Message-Id: <4967544f097ebce823133b1dad0ff374ba1a4fbb.1563360659.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1563360659.git.mchehab+samsung@kernel.org>
References: <cover.1563360659.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The parser breaks with UTF-8 characters with Sphinx 1.4.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/sphinx/kernel_abi.py | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/Documentation/sphinx/kernel_abi.py b/Documentation/sphinx/kernel_abi.py
index 32ce90775d96..0f3e51e67e8d 100644
--- a/Documentation/sphinx/kernel_abi.py
+++ b/Documentation/sphinx/kernel_abi.py
@@ -1,4 +1,5 @@
-# -*- coding: utf-8; mode: python -*-
+# coding=utf-8
+#
 u"""
     kernel-abi
     ~~~~~~~~~~
@@ -28,6 +29,7 @@ u"""
 
 """
 
+import codecs
 import sys
 import os
 from os import path
@@ -43,14 +45,6 @@ from docutils.utils.error_reporting import ErrorString
 
 __version__  = '1.0'
 
-# We can't assume that six is installed
-PY3 = sys.version_info[0] == 3
-PY2 = sys.version_info[0] == 2
-if PY3:
-    # pylint: disable=C0103, W0622
-    unicode     = str
-    basestring  = str
-
 def setup(app):
 
     app.add_directive("kernel-abi", KernelCmd)
@@ -115,12 +109,12 @@ class KernelCmd(Directive):
                 cmd
                 , stdout = subprocess.PIPE
                 , stderr = subprocess.PIPE
-                , universal_newlines = True
                 , **kwargs
             )
             out, err = proc.communicate()
-            if err:
-                self.warn(err)
+
+            out, err = codecs.decode(out, 'utf-8'), codecs.decode(err, 'utf-8')
+
             if proc.returncode != 0:
                 raise self.severe(
                     u"command '%s' failed with return code %d"
@@ -129,7 +123,7 @@ class KernelCmd(Directive):
         except OSError as exc:
             raise self.severe(u"problems with '%s' directive: %s."
                               % (self.name, ErrorString(exc)))
-        return unicode(out)
+        return out
 
     def nestedParse(self, lines, fname):
         content = ViewList()
-- 
2.21.0

