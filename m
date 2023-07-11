Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B18CEB64DC
	for <linux-doc@archiver.kernel.org>; Tue, 11 Jul 2023 04:36:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbjGKEge (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 11 Jul 2023 00:36:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjGKEgd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Jul 2023 00:36:33 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE57EBF
        for <linux-doc@vger.kernel.org>; Mon, 10 Jul 2023 21:36:31 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-666683eb028so2783888b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 10 Jul 2023 21:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1689050191; x=1691642191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o2fbpRc1gP3OYJFiewDVSSan5FPPeq6w2nLF2ekKLbg=;
        b=RQesib1xN1ZmHsPS1BZxb8GFBw3bLOQP+UTjbpSvqSu+zXCUbswMRRjAQVntHnffgk
         2E7MeVDBV3pc5dYbmgSn6MIm2amFwKOtJplCxUPOs4k2kU3oM5T7RL+2F9ANb+ranU8N
         cTamzNqo/wgS45OeJK1zXiqykdKVk4JG6kyQnw8eJDpaUqPUIkUPzbNhzXXwt17/i6dg
         koxv3ey5vV36NfWt0COANNWYLYE5QEZNoTZyYAyTVobEvSdbLe/RxfNmvTFEo+Olk8Dn
         BNMc0q1bCu/CaaEV8YEzXStHiJ5nkGZrRC5Gn+FtESHQPWr5TV0cdYOfjYn8FB/MEZYv
         N43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689050191; x=1691642191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o2fbpRc1gP3OYJFiewDVSSan5FPPeq6w2nLF2ekKLbg=;
        b=YQrzior+d7vStVAfHv3Bf+R4ky082/Up0IrZS0bN3XyWktG0PH51zXt+CmNqRSqoDJ
         5rUqbY1bffc2bNGWrsLVrRbQKbvnKo40DsaV35eteCuuGr8F5Yg1tukRkIJHibTFroNE
         RwOAYJtfDfu4N5eWHWsj45e/DXiMtqTgmKqlragCbTnIoOiZlTGrS9jqC83YMcCERSby
         mMvoheZvT/I1MtneyfdNkZSCZsU5y/74ETsxaiILO1VDSLx4EW90hladxe9tnYuvgilQ
         CFWwLqgTCsWf5pVgF22lQXU1yCc6mfaZsK+OL64PHNq64qT2epZL1J3P3BeSi1htfj4i
         vVgQ==
X-Gm-Message-State: ABy/qLat6932jcEL+CABSJgNaxTaAzKbOvkFSOwhUCJpvNykzYKIkBrv
        BU3wE4YhfK2c7svg6DAbvmBtEg==
X-Google-Smtp-Source: APBJJlH4Z539tozKrapAxAT/lMBr/3gs+hikaUOY++P9Tu6dKkQgiDYYm65yDeiYW5QBvBYNqbJcOA==
X-Received: by 2002:a05:6a21:900c:b0:130:74c8:b501 with SMTP id tq12-20020a056a21900c00b0013074c8b501mr8444984pzb.30.1689050191294;
        Mon, 10 Jul 2023 21:36:31 -0700 (PDT)
Received: from localhost.localdomain ([139.177.225.236])
        by smtp.gmail.com with ESMTPSA id ij9-20020a170902ab4900b001b9de67285dsm755259plb.156.2023.07.10.21.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 21:36:30 -0700 (PDT)
From:   Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
To:     Miklos Szeredi <miklos@szeredi.hu>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     me@jcix.top, Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
Subject: [PATCH 1/5] fuse: check attributes staleness on fuse_iget()
Date:   Tue, 11 Jul 2023 12:34:01 +0800
Message-Id: <20230711043405.66256-2-zhangjiachen.jaycee@bytedance.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230711043405.66256-1-zhangjiachen.jaycee@bytedance.com>
References: <20230711043405.66256-1-zhangjiachen.jaycee@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Function fuse_direntplus_link() might call fuse_iget() to initialize a new
fuse_inode and change its attributes. If fi->attr_version is always
initialized with 0, even if the attributes returned by the FUSE_READDIR
request is staled, as the new fi->attr_version is 0, fuse_change_attributes
will still set the staled attributes to inode. This wrong behaviour may
cause file size inconsistency even when there is no changes from
server-side.

To reproduce the issue, consider the following 2 programs (A and B) are
running concurrently,

        A                                               B
----------------------------------      --------------------------------
{ /fusemnt/dir/f is a file path in a fuse mount, the size of f is 0. }

readdir(/fusemnt/dir) start
//Daemon set size 0 to f direntry
                                        fallocate(f, 1024)
                                        stat(f) // B see size 1024
                                        echo 2 > /proc/sys/vm/drop_caches
readdir(/fusemnt/dir) reply to kernel
Kernel set 0 to the I_NEW inode

                                        stat(f) // B see size 0

In the above case, only program B is modifying the file size, however, B
observes file size changing between the 2 'readonly' stat() calls. To fix
this issue, we should make sure readdirplus still follows the rule of
attr_version staleness checking even if the fi->attr_version is lost due to
inode eviction. So this patch increases fc->attr_version on inode eviction,
and compares request attr_version and the fc->attr_version when a
FUSE_READDIRPLUS request is finished.

Signed-off-by: Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
---
 fs/fuse/inode.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index 660be31aaabc..3e0b1fb1db17 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -115,6 +115,7 @@ static void fuse_free_inode(struct inode *inode)
 
 static void fuse_evict_inode(struct inode *inode)
 {
+	struct fuse_conn *fc = get_fuse_conn(inode);
 	struct fuse_inode *fi = get_fuse_inode(inode);
 
 	/* Will write inode on close/munmap and in all other dirtiers */
@@ -137,6 +138,8 @@ static void fuse_evict_inode(struct inode *inode)
 		WARN_ON(!list_empty(&fi->write_files));
 		WARN_ON(!list_empty(&fi->queued_writes));
 	}
+
+	atomic64_inc(&fc->attr_version);
 }
 
 static int fuse_reconfigure(struct fs_context *fsc)
@@ -409,6 +412,10 @@ struct inode *fuse_iget(struct super_block *sb, u64 nodeid,
 	fi->nlookup++;
 	spin_unlock(&fi->lock);
 	fuse_change_attributes(inode, attr, attr_valid, attr_version);
+	spin_lock(&fi->lock);
+	if (attr_version < atomic64_read(&fc->attr_version))
+		fuse_invalidate_attr(inode);
+	spin_unlock(&fi->lock);
 
 	return inode;
 }
-- 
2.20.1

