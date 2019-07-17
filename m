Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3A6517D90F
	for <lwn-linux-doc@archive.lwn.net>; Wed, 17 Jul 2019 12:28:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727061AbfGQM2Z (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 17 Jul 2019 08:28:25 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:53828 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726260AbfGQM2Z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 17 Jul 2019 08:28:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=HP5y6sP/LVX8prg2aJUpLGSZiZKhynk/rTLVyUOuGr4=; b=laLAV73kFe6cQ3xqg1obyZB0Sv
        sF6hNH73VZs+vHBJ8dAbJiiG5DA8W/aY9n0zT3mOKRtyIRCVvbn269ef67lJmtPGD9Qi42gTJDvnO
        fYVhFMQ9KR0mVDMk4FktNFjKNj2YAvHguAbR+3L5YHtBAqb6lLLQePCEvafK317HxST6vAc2pfIZh
        DXjk96r2X6xJkCs6C3Pp6Ym5hlQw8ImCT/ApBzbgX6qS7ghcyyulk5T5ysAgxaYquXLy9+h5RH8WI
        1j/OHVjV+1ojsWGxZy8basxzRQsRqM7tRsHzDXSOAo52vQcdPZdc3z538XGZXLMe8RQZ2hzX2I6I5
        SJF9JL4Q==;
Received: from [191.33.154.161] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hnj2m-0006fT-ET; Wed, 17 Jul 2019 12:28:24 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hnj2j-00052C-UD; Wed, 17 Jul 2019 09:28:21 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     gregkh@linuxfoundation.org
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH v4 05/15] docs: kernel_abi.py: fix UTF-8 support
Date:   Wed, 17 Jul 2019 09:28:09 -0300
Message-Id: <1ba993ddd83b3420e0de618bc6c1b6c65743b17a.1563365880.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1563365880.git.mchehab+samsung@kernel.org>
References: <cover.1563365880.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The parser breaks with UTF-8 characters with Sphinx 1.4.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/sphinx/kernel_abi.py | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/Documentation/sphinx/kernel_abi.py b/Documentation/sphinx/kernel_abi.py
index 3e2529a05b7b..b4434498fe2f 100644
--- a/Documentation/sphinx/kernel_abi.py
+++ b/Documentation/sphinx/kernel_abi.py
@@ -31,6 +31,7 @@ u"""
 
 """
 
+import codecs
 import sys
 import os
 from os import path
@@ -46,14 +47,6 @@ from docutils.utils.error_reporting import ErrorString
 
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
@@ -118,12 +111,12 @@ class KernelCmd(Directive):
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
@@ -132,7 +125,7 @@ class KernelCmd(Directive):
         except OSError as exc:
             raise self.severe(u"problems with '%s' directive: %s."
                               % (self.name, ErrorString(exc)))
-        return unicode(out)
+        return out
 
     def nestedParse(self, lines, fname):
         content = ViewList()
-- 
2.21.0

