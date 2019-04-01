Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1C5257D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon,  1 Apr 2019 12:49:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726901AbfDAMtK (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 1 Apr 2019 08:49:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:52470 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725882AbfDAMtK (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 1 Apr 2019 08:49:10 -0400
Received: from tleilax.poochiereds.net (cpe-71-70-156-158.nc.res.rr.com [71.70.156.158])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 36DEB206B7;
        Mon,  1 Apr 2019 12:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1554122949;
        bh=H/oowy4rgamWwFAERpQ/GJH2VjEnyewKD5kgvjJOP0E=;
        h=From:To:Cc:Subject:Date:From;
        b=aZ6HELqiEMoKqaAZM/mBIHkh6J2sR3U/8PEyYtzsN1oLOBz49DvRCW1oMKyoYCyTe
         QO8DtirhbZMgYnaYkCEDDOQ0lhmysZ+ekl+dbUgYZKL+aw2t4ebutYE8/8gxfUdajO
         tje2/DCe9pUrBuxS9hoDcD9DXhb0J5YtthPD90M4=
From:   Jeff Layton <jlayton@kernel.org>
To:     corbet@lwn.net
Cc:     viro@zeniv.linux.org.uk, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org
Subject: [PATCH] Documentation: document d_prune op in vfs.txt
Date:   Mon,  1 Apr 2019 08:49:07 -0400
Message-Id: <20190401124907.7345-1-jlayton@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 Documentation/filesystems/vfs.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/filesystems/vfs.txt b/Documentation/filesystems/vfs.txt
index 761c6fd24a53..4f1638e5f95b 100644
--- a/Documentation/filesystems/vfs.txt
+++ b/Documentation/filesystems/vfs.txt
@@ -1013,6 +1013,7 @@ struct dentry_operations {
 	int (*d_delete)(const struct dentry *);
 	int (*d_init)(struct dentry *);
 	void (*d_release)(struct dentry *);
+	void (*d_prune)(struct dentry *);
 	void (*d_iput)(struct dentry *, struct inode *);
 	char *(*d_dname)(struct dentry *, char *, int);
 	struct vfsmount *(*d_automount)(struct path *);
@@ -1087,6 +1088,9 @@ struct dentry_operations {
 
   d_release: called when a dentry is really deallocated
 
+  d_prune: called prior to pruning (i.e. unhashing and killing) a hashed
+	dentry from the dcache.
+
   d_iput: called when a dentry loses its inode (just prior to its
 	being deallocated). The default when this is NULL is that the
 	VFS calls iput(). If you define this method, you must call
-- 
2.20.1

