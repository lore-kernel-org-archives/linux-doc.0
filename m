Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3F9577DE59
	for <lwn-linux-doc@archive.lwn.net>; Fri, 14 Dec 2018 17:16:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730322AbeLNRQN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 14 Dec 2018 12:16:13 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:40741 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730315AbeLNRQM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Dec 2018 12:16:12 -0500
Received: by mail-pg1-f196.google.com with SMTP id z10so2974621pgp.7
        for <linux-doc@vger.kernel.org>; Fri, 14 Dec 2018 09:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yD7OmIaga8bq3vgrhrUeca0ttxxjagifsHLQHNzU5W8=;
        b=q3/CpAxD8RTwSJRxe5o3byeeJqR4Ch9hUc+/pjXFAQHyESWPfGmuc9y016j2l0B/Xi
         iS5TEYe/572UOGk6qTUy/EBPF5sohGdF2ZNPjZmHrmtC0RB9p4UAxKf/aEWSyQjYkJGS
         hiJuNCETCQGWMg6FZL37p47irAMo33zWPoArR1izOd4yzgD00jCUyzX+wnNwImOMELMX
         JIRZs26qd+A29xirIw3kZtAjP9sNrkRt48cnoTU9mlzvu0BN1GCQ8n+bJvxcYe9LENjh
         X1AM1EtQrgCaXc+FeG4GR8Bl/R+fbTGdnOAhDXmJyi6z7OK0fAzRpGYZ97xlWT3jUPrL
         jT4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yD7OmIaga8bq3vgrhrUeca0ttxxjagifsHLQHNzU5W8=;
        b=cetFhuaZCDJmRDmDy2LzCaK2RJUUWJ3d+Wyup13Rv/hUD9Z79upWn2o1XAcGNtj5Fp
         Z+b9dXW/pq/s1iaIxTuDENiaSSFeJiexOISP03BDnjBtxc1CDqGPq6fSDlsRpoE42d/t
         h2q3+yXaplEhbeksPhpZCPe8ry8WESSqz6aSHY98OwF7mPsopbz70QO6xso1cbneNq0S
         riBp5wCl5Op0Aag59wr7GlYJm+761bPi2xcv452x3nSn9pfKtF1M6PDUQCOrx8NEKmiv
         t/rRhaSYAjVgEew+/H0sKg9KobuzS9qj3kLFyZYFsyRR7Z0RRSc9ltC4zVQaDUgbIlV7
         jF3w==
X-Gm-Message-State: AA+aEWZJ1Rf2vhwjNSoaP9ANDXCU9xVyWc9Y+l86/rFKeSqKd49ehqIX
        jhfA9x2bjgMITtrTd01rPJRz4w==
X-Google-Smtp-Source: AFSGD/VXkMTwawtJFy5GzNnm00dKDRrt8F4j6Io6OBC/4OXzLeoNlmGpk0vqxx2kzPbz3iJXYDAwIw==
X-Received: by 2002:a63:4c4e:: with SMTP id m14mr3433828pgl.173.1544807772132;
        Fri, 14 Dec 2018 09:16:12 -0800 (PST)
Received: from surenb0.mtv.corp.google.com ([2620:0:1000:1612:3320:4357:47df:276b])
        by smtp.googlemail.com with ESMTPSA id g185sm7605761pfc.174.2018.12.14.09.16.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Dec 2018 09:16:09 -0800 (PST)
From:   Suren Baghdasaryan <surenb@google.com>
To:     gregkh@linuxfoundation.org
Cc:     tj@kernel.org, lizefan@huawei.com, hannes@cmpxchg.org,
        axboe@kernel.dk, dennis@kernel.org, dennisszhou@gmail.com,
        mingo@redhat.com, peterz@infradead.org, akpm@linux-foundation.org,
        corbet@lwn.net, cgroups@vger.kernel.org, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-team@android.com, Suren Baghdasaryan <surenb@google.com>
Subject: [PATCH 1/6] fs: kernfs: add poll file operation
Date:   Fri, 14 Dec 2018 09:15:03 -0800
Message-Id: <20181214171508.7791-2-surenb@google.com>
X-Mailer: git-send-email 2.20.0.405.gbc1bbc6f85-goog
In-Reply-To: <20181214171508.7791-1-surenb@google.com>
References: <20181214171508.7791-1-surenb@google.com>
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
2.20.0.405.gbc1bbc6f85-goog

