Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2537E7D04D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 10 Jan 2019 22:08:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728843AbfAJWID (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 10 Jan 2019 17:08:03 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38117 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727723AbfAJWID (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Jan 2019 17:08:03 -0500
Received: by mail-pg1-f195.google.com with SMTP id g189so5400427pgc.5
        for <linux-doc@vger.kernel.org>; Thu, 10 Jan 2019 14:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6/O3eFualUs49i01Y9nCFMeVAmgaojLv/2MBw+YMFEw=;
        b=ZlV37vZth2xskaz25CzDUgkv2F5IWqrPsLkXq+5WGuLB2x/bp81M8lLF8ZPkjLtZW3
         lq4hOdS+fLTm6uWk/RIkdTi3zA+1aFHHEfLWYUGirXTb9rXw6xxvs+LGaUumLrV2P4k7
         pITQRvyOn+4dWlNuZ4A4QQcf2n6KmihrQklYYmeAcjKsOM9He4TenXOi36Bn82mU/Ald
         CTbGvrRA68GVELjzgQyqaSfj5x56VRoBO1LVTm8nyUiVwfH21VV2AV9+O8SDDYmNqkEz
         D4GgOBYB9F0wlUEkDQspNYjZOL9OuIk4OFAkNhkIxOnxdpi9c0OTdoI4AElmSojoCPxk
         /hSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6/O3eFualUs49i01Y9nCFMeVAmgaojLv/2MBw+YMFEw=;
        b=ifXm+Orz82kotZDd+P+EKu1MCy1+jlSDJlRcZXfl99H5jwOnVkOAWAWYFwhbmIT5/T
         7gOXVxbGLSKVCf0L9jx1YhEIz9FKkvQKH38Jd1g2ObPL76yV0fFpEs7BfwSr5H56Eff0
         DpDVKNeTS/HpBUM0bn5pEkDPO68fy5abRPdSrxmuPJgD+27kJc281Omzs3MEElGjSRdf
         o6iKyYausdNWZaBPOxbwVU3g1HV8l6JvVia7xFyIHlM4nXQs9TX4xyYMDQ4frmchURq+
         fXw0McMIi9votRRTfMYxo+ePhWXmpLy37HXdH0wjfeuQGJ1MBGzZjdAHDSFgQuHxbkM4
         FBOQ==
X-Gm-Message-State: AJcUukdd5O8klwF/C/51EFVWHNtaAD7VzSCklBy5PIuOqX+EPWdAX9L6
        zR0BuGrfTbMfpBIMTH5yKgFQeQ==
X-Google-Smtp-Source: ALg8bN4VK5/sM3LS/LoPFXFsneMHIR/ap0XXOfEPftIeUw/PbLjRJcIMdlUd4PLfeJM78GtOQw4fEw==
X-Received: by 2002:a63:ee0e:: with SMTP id e14mr10793315pgi.8.1547158081876;
        Thu, 10 Jan 2019 14:08:01 -0800 (PST)
Received: from surenb0.mtv.corp.google.com ([2620:0:1000:1612:3320:4357:47df:276b])
        by smtp.googlemail.com with ESMTPSA id p7sm152958019pfj.72.2019.01.10.14.08.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Jan 2019 14:08:01 -0800 (PST)
From:   Suren Baghdasaryan <surenb@google.com>
To:     gregkh@linuxfoundation.org
Cc:     tj@kernel.org, lizefan@huawei.com, hannes@cmpxchg.org,
        axboe@kernel.dk, dennis@kernel.org, dennisszhou@gmail.com,
        mingo@redhat.com, peterz@infradead.org, akpm@linux-foundation.org,
        corbet@lwn.net, cgroups@vger.kernel.org, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-team@android.com, Suren Baghdasaryan <surenb@google.com>
Subject: [PATCH v2 1/5] fs: kernfs: add poll file operation
Date:   Thu, 10 Jan 2019 14:07:14 -0800
Message-Id: <20190110220718.261134-2-surenb@google.com>
X-Mailer: git-send-email 2.20.1.97.g81188d93c3-goog
In-Reply-To: <20190110220718.261134-1-surenb@google.com>
References: <20190110220718.261134-1-surenb@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Johannes Weiner <hannes@cmpxchg.org>

Kernfs has a standardized poll/notification mechanism for waking all
pollers on all fds when a filesystem node changes. To allow polling
for custom events, add a .poll callback that can override the default.

This is in preparation for pollable cgroup pressure files which have
per-fd trigger configurations.

Signed-off-by: Johannes Weiner <hannes@cmpxchg.org>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 fs/kernfs/file.c       | 31 ++++++++++++++++++++-----------
 include/linux/kernfs.h |  6 ++++++
 2 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/fs/kernfs/file.c b/fs/kernfs/file.c
index dbf5bc250bfd..2d8b91f4475d 100644
--- a/fs/kernfs/file.c
+++ b/fs/kernfs/file.c
@@ -832,26 +832,35 @@ void kernfs_drain_open_files(struct kernfs_node *kn)
  * to see if it supports poll (Neither 'poll' nor 'select' return
  * an appropriate error code).  When in doubt, set a suitable timeout value.
  */
+__poll_t kernfs_generic_poll(struct kernfs_open_file *of, poll_table *wait)
+{
+	struct kernfs_node *kn = kernfs_dentry_node(of->file->f_path.dentry);
+	struct kernfs_open_node *on = kn->attr.open;
+
+	poll_wait(of->file, &on->poll, wait);
+
+	if (of->event != atomic_read(&on->event))
+		return DEFAULT_POLLMASK|EPOLLERR|EPOLLPRI;
+
+	return DEFAULT_POLLMASK;
+}
+
 static __poll_t kernfs_fop_poll(struct file *filp, poll_table *wait)
 {
 	struct kernfs_open_file *of = kernfs_of(filp);
 	struct kernfs_node *kn = kernfs_dentry_node(filp->f_path.dentry);
-	struct kernfs_open_node *on = kn->attr.open;
+	__poll_t ret;
 
 	if (!kernfs_get_active(kn))
-		goto trigger;
+		return DEFAULT_POLLMASK|EPOLLERR|EPOLLPRI;
 
-	poll_wait(filp, &on->poll, wait);
+	if (kn->attr.ops->poll)
+		ret = kn->attr.ops->poll(of, wait);
+	else
+		ret = kernfs_generic_poll(of, wait);
 
 	kernfs_put_active(kn);
-
-	if (of->event != atomic_read(&on->event))
-		goto trigger;
-
-	return DEFAULT_POLLMASK;
-
- trigger:
-	return DEFAULT_POLLMASK|EPOLLERR|EPOLLPRI;
+	return ret;
 }
 
 static void kernfs_notify_workfn(struct work_struct *work)
diff --git a/include/linux/kernfs.h b/include/linux/kernfs.h
index 5b36b1287a5a..0cac1207bb00 100644
--- a/include/linux/kernfs.h
+++ b/include/linux/kernfs.h
@@ -25,6 +25,7 @@ struct seq_file;
 struct vm_area_struct;
 struct super_block;
 struct file_system_type;
+struct poll_table_struct;
 
 struct kernfs_open_node;
 struct kernfs_iattrs;
@@ -261,6 +262,9 @@ struct kernfs_ops {
 	ssize_t (*write)(struct kernfs_open_file *of, char *buf, size_t bytes,
 			 loff_t off);
 
+	__poll_t (*poll)(struct kernfs_open_file *of,
+			 struct poll_table_struct *pt);
+
 	int (*mmap)(struct kernfs_open_file *of, struct vm_area_struct *vma);
 
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
@@ -350,6 +354,8 @@ int kernfs_remove_by_name_ns(struct kernfs_node *parent, const char *name,
 int kernfs_rename_ns(struct kernfs_node *kn, struct kernfs_node *new_parent,
 		     const char *new_name, const void *new_ns);
 int kernfs_setattr(struct kernfs_node *kn, const struct iattr *iattr);
+__poll_t kernfs_generic_poll(struct kernfs_open_file *of,
+			     struct poll_table_struct *pt);
 void kernfs_notify(struct kernfs_node *kn);
 
 const void *kernfs_super_ns(struct super_block *sb);
-- 
2.20.1.97.g81188d93c3-goog

