Return-Path: <SRS0=yfWO=5R=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E959C43331
	for <linux-doc@archiver.kernel.org>; Wed,  1 Apr 2020 17:33:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E335F20787
	for <linux-doc@archiver.kernel.org>; Wed,  1 Apr 2020 17:33:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="m/4SRJO9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732704AbgDARdp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 1 Apr 2020 13:33:45 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:47546 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732232AbgDARdp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Apr 2020 13:33:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=Bq0Gyfw2x5IJxyJEGtdKIvcglFforOsQLBnZGomQ/1I=; b=m/4SRJO9acMj8KJeU1enEHN/Ow
        GAHdl0PqOLMU8yerdEfPjvdLO4auNcO8+a/5+kZ0VZPCvRxvCcUT+P7L5iKYDJ67MN1VokpQrE6jw
        E16K2R99GYAbA9x/BMDAJSs/hqD23sqMcJoor9kAby3Da8ONVfI4f3Lan1gWXy4dYsU3sLFQBu8Ea
        gZsqDO8k3+oh3AC38QNKeCgpz3YyJyzNje1qkhBAG0NWLlZ6Z46xuErqCHdEpdYjXF/BL+jPTc2Iy
        6SNDZsP1goezsffRiIrskukYqVuxNBqG1T6qrhUVP0IQDzdAARlLiQydL1aYZon68cHWtPB49ZAyG
        NglFDRtA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jJhFI-0004YZ-Nm; Wed, 01 Apr 2020 17:33:44 +0000
From:   Matthew Wilcox <willy@infradead.org>
To:     linux-doc@vger.kernel.org
Cc:     "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Michel Lespinasse <walken@google.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Landley <rob@landley.net>
Subject: [PATCH] docs: Add rbtree documentation to the core-api
Date:   Wed,  1 Apr 2020 10:33:43 -0700
Message-Id: <20200401173343.17472-1-willy@infradead.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

This file is close enough to being in rst format that I didn't feel
the need to alter it in any way.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 Documentation/core-api/index.rst                  | 1 +
 Documentation/{rbtree.txt => core-api/rbtree.rst} | 0
 include/linux/rbtree.h                            | 2 +-
 include/linux/rbtree_augmented.h                  | 2 +-
 lib/Kconfig                                       | 2 +-
 tools/include/linux/rbtree.h                      | 2 +-
 tools/include/linux/rbtree_augmented.h            | 2 +-
 7 files changed, 6 insertions(+), 5 deletions(-)
 rename Documentation/{rbtree.txt => core-api/rbtree.rst} (100%)

diff --git a/Documentation/core-api/index.rst b/Documentation/core-api/index.rst
index 0897ad12c119..9499a4c47f4a 100644
--- a/Documentation/core-api/index.rst
+++ b/Documentation/core-api/index.rst
@@ -34,6 +34,7 @@ Library functionality that is used throughout the kernel.
    xarray
    idr
    circular-buffers
+   rbtree
    generic-radix-tree
    packing
    timekeeping
diff --git a/Documentation/rbtree.txt b/Documentation/core-api/rbtree.rst
similarity index 100%
rename from Documentation/rbtree.txt
rename to Documentation/core-api/rbtree.rst
diff --git a/include/linux/rbtree.h b/include/linux/rbtree.h
index 1fd61a9af45c..d7db17996322 100644
--- a/include/linux/rbtree.h
+++ b/include/linux/rbtree.h
@@ -11,7 +11,7 @@
   I know it's not the cleaner way,  but in C (not in C++) to get
   performances and genericity...
 
-  See Documentation/rbtree.txt for documentation and samples.
+  See Documentation/core-api/rbtree.rst for documentation and samples.
 */
 
 #ifndef	_LINUX_RBTREE_H
diff --git a/include/linux/rbtree_augmented.h b/include/linux/rbtree_augmented.h
index 724b0d036b57..d1c53e9d8c75 100644
--- a/include/linux/rbtree_augmented.h
+++ b/include/linux/rbtree_augmented.h
@@ -21,7 +21,7 @@
  * rb_insert_augmented() and rb_erase_augmented() are intended to be public.
  * The rest are implementation details you are not expected to depend on.
  *
- * See Documentation/rbtree.txt for documentation and samples.
+ * See Documentation/core-api/rbtree.rst for documentation and samples.
  */
 
 struct rb_augment_callbacks {
diff --git a/lib/Kconfig b/lib/Kconfig
index bc7e56370129..8653a8ab3c68 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -427,7 +427,7 @@ config INTERVAL_TREE
 
 	  See:
 
-		Documentation/rbtree.txt
+		Documentation/core-api/rbtree.rst
 
 	  for more information.
 
diff --git a/tools/include/linux/rbtree.h b/tools/include/linux/rbtree.h
index e03b1ea23e0e..30dd21f976c3 100644
--- a/tools/include/linux/rbtree.h
+++ b/tools/include/linux/rbtree.h
@@ -11,7 +11,7 @@
   I know it's not the cleaner way,  but in C (not in C++) to get
   performances and genericity...
 
-  See Documentation/rbtree.txt for documentation and samples.
+  See Documentation/core-api/rbtree.rst for documentation and samples.
 */
 
 #ifndef __TOOLS_LINUX_PERF_RBTREE_H
diff --git a/tools/include/linux/rbtree_augmented.h b/tools/include/linux/rbtree_augmented.h
index 381aa948610d..570bb9794421 100644
--- a/tools/include/linux/rbtree_augmented.h
+++ b/tools/include/linux/rbtree_augmented.h
@@ -23,7 +23,7 @@
  * rb_insert_augmented() and rb_erase_augmented() are intended to be public.
  * The rest are implementation details you are not expected to depend on.
  *
- * See Documentation/rbtree.txt for documentation and samples.
+ * See Documentation/core-api/rbtree.rst for documentation and samples.
  */
 
 struct rb_augment_callbacks {
-- 
2.25.1

