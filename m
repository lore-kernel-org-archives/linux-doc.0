Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 11A2E7DE6E
	for <lwn-linux-doc@archive.lwn.net>; Tue,  3 Jul 2018 15:08:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932440AbeGCPIj (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 3 Jul 2018 11:08:39 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:44488 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932355AbeGCPIi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Jul 2018 11:08:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Message-Id:Date:Subject:Cc:To:From:
        Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=/yEJZzY0ELwJNRdJtqvvNil7ghjP4S8+IALueIVEg/Q=; b=kNxtJQmJcIajQraCRWSITzYpg
        by4jYmzzAFHUbxOlF/2/SLzs9uH1S/Ib+jSG4ePDqg8hvZOvNfFUfJ6WthxKl/NzgCQofjZfQcMBC
        ZaPSydtYEFpqrMD/Btc73gdP7GFCTYzVSEAmBbEgsUbdw4icNI6MlnldD+VzucsQyaqco7xHdn7lX
        0IKHLfzUgn/alQi/0oJbEP8UC3EexWCX70Cgp+P2vtcx4bt6rviKHmCfA7mQw9SVhS/z4vgUw56UG
        EX0wapMncWUAOJTdsRZRRX7ttGRBUZ4a9SkOm5jmXSKRTTKSnVCNF/SPGYdZmn9pAcm+/OgEEwmi7
        /gAsONthw==;
Received: from willy by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1faMuz-000571-TU; Tue, 03 Jul 2018 15:08:37 +0000
From:   Matthew Wilcox <willy@infradead.org>
To:     linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     Matthew Wilcox <willy@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Al Viro <viro@ZenIV.linux.org.uk>,
        Ross Zwisler <ross.zwisler@linux.intel.com>
Subject: [PATCH 1/2] fs: Fix attr.c kernel-doc
Date:   Tue,  3 Jul 2018 08:08:34 -0700
Message-Id: <20180703150835.19565-1-willy@infradead.org>
X-Mailer: git-send-email 2.14.4
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

A couple of minor warnings.

Signed-off-by: Matthew Wilcox <willy@infradead.org>
---
 fs/attr.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/attr.c b/fs/attr.c
index e3d53bf12240..d22e8187477f 100644
--- a/fs/attr.c
+++ b/fs/attr.c
@@ -120,7 +120,6 @@ EXPORT_SYMBOL(setattr_prepare);
  * inode_newsize_ok - may this inode be truncated to a given size
  * @inode:	the inode to be truncated
  * @offset:	the new size to assign to the inode
- * @Returns:	0 on success, -ve errno on failure
  *
  * inode_newsize_ok must be called with i_mutex held.
  *
@@ -130,6 +129,8 @@ EXPORT_SYMBOL(setattr_prepare);
  * returned. @inode must be a file (not directory), with appropriate
  * permissions to allow truncate (inode_newsize_ok does NOT check these
  * conditions).
+ *
+ * Return: 0 on success, -ve errno on failure
  */
 int inode_newsize_ok(const struct inode *inode, loff_t offset)
 {
@@ -205,7 +206,7 @@ EXPORT_SYMBOL(setattr_copy);
 /**
  * notify_change - modify attributes of a filesytem object
  * @dentry:	object affected
- * @iattr:	new attributes
+ * @attr:	new attributes
  * @delegated_inode: returns inode, if the inode is delegated
  *
  * The caller must hold the i_mutex on the affected object.
-- 
2.18.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
