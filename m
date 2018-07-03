Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id F152D7DE6F
	for <lwn-linux-doc@archive.lwn.net>; Tue,  3 Jul 2018 15:08:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932799AbeGCPIj (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 3 Jul 2018 11:08:39 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:44496 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932392AbeGCPIi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Jul 2018 11:08:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=References:In-Reply-To:Message-Id:
        Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=gL8QDKwOdKxOJ6tT8x5FyuzYrbLjBaj+6/89PWWl2eg=; b=f1AQpWFm9MKkf44DcRJEcLnDp
        U6N6ugFIsgEaWwUWqDJ3f6PaBwf6LE7+9RMUiioxaBRt0mNE+okeE3m/4EYFwcBuc+RaQE3a8NoB0
        XtXyutQ37AUokyaLyFMV5Um+O9MtwvzLeChPyDW+3S+M0eW3r4sp0/o0qrsc6POZ0Fe8d9FYAzVFb
        Y/Fxzd70QFJMf85gTmz0tkkWqf4Mr0ETo6lNxtE6OfxVj+IZaSUHkqcmc3fjS3cGkV7lSpmonhrjK
        klPOrsOzIWfqHucMEmFFC6JlD7O/IWTiy1bolJqsUImOQ81LZ52cNoPCBgC0EcrDjEcu2sfephRk7
        bXSDOsNXg==;
Received: from willy by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1faMv0-000574-6z; Tue, 03 Jul 2018 15:08:38 +0000
From:   Matthew Wilcox <willy@infradead.org>
To:     linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     Matthew Wilcox <willy@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Al Viro <viro@ZenIV.linux.org.uk>,
        Ross Zwisler <ross.zwisler@linux.intel.com>
Subject: [PATCH 2/2] fs: Add more kernel-doc to the produced documentation
Date:   Tue,  3 Jul 2018 08:08:35 -0700
Message-Id: <20180703150835.19565-2-willy@infradead.org>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20180703150835.19565-1-willy@infradead.org>
References: <20180703150835.19565-1-willy@infradead.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

People have gone to all the effort of writing kernel-doc for these
functions; the least we can do is put them in the "Other functions"
part of the VFS documentation.

Signed-off-by: Matthew Wilcox <willy@infradead.org>
---
 Documentation/filesystems/index.rst | 33 +++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/Documentation/filesystems/index.rst b/Documentation/filesystems/index.rst
index 53b89d0edc15..46d1b1be3a51 100644
--- a/Documentation/filesystems/index.rst
+++ b/Documentation/filesystems/index.rst
@@ -71,6 +71,39 @@ Other Functions
 .. kernel-doc:: fs/block_dev.c
    :export:
 
+.. kernel-doc:: fs/anon_inodes.c
+   :export:
+
+.. kernel-doc:: fs/attr.c
+   :export:
+
+.. kernel-doc:: fs/d_path.c
+   :export:
+
+.. kernel-doc:: fs/dax.c
+   :export:
+
+.. kernel-doc:: fs/direct-io.c
+   :export:
+
+.. kernel-doc:: fs/file_table.c
+   :export:
+
+.. kernel-doc:: fs/libfs.c
+   :export:
+
+.. kernel-doc:: fs/posix_acl.c
+   :export:
+
+.. kernel-doc:: fs/stat.c
+   :export:
+
+.. kernel-doc:: fs/sync.c
+   :export:
+
+.. kernel-doc:: fs/xattr.c
+   :export:
+
 The proc filesystem
 ===================
 
-- 
2.18.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
