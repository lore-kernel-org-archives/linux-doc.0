Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 008C17DD4C
	for <lwn-linux-doc@archive.lwn.net>; Fri, 14 Dec 2018 17:16:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730341AbeLNRQR (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 14 Dec 2018 12:16:17 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:39098 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729660AbeLNRQR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Dec 2018 12:16:17 -0500
Received: by mail-pg1-f193.google.com with SMTP id w6so2976630pgl.6
        for <linux-doc@vger.kernel.org>; Fri, 14 Dec 2018 09:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sCRWYoNU0VkVJ/z3jhqejq2doYZrQjVc/bE8fLkqY2M=;
        b=qtqDt0yWn90HRTU+TjV+hv+Nm4vyH6Oihs6UoQLIHJzjQGDbObJpGMIW9v+FkBaVLR
         Uj8Mr9R6Rg0Sz1w7z3mYjuvKfxqj1KpIz5MHIF71R3JSGS6DuFPN+gh6/j1qi+lTThBZ
         bUtMX2GGllNQNpMM1hWDtA8Jb3e/DqguXh/VMkUbYokl1bHIab0fSzpccYMg5XIsFgtL
         cwNrvkofLgF/3zHa+CdOYBv8XhaIjPY6MX6VtZTlE9YX5+0piu/xcN/kY9kPUOGsU1hx
         /NMZB+XqLjN8gHVlZLBzkM9TnJZ0KARCM0+BSoqoytH9MUyVZtILnhGsikxNDrCX2BIa
         cXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sCRWYoNU0VkVJ/z3jhqejq2doYZrQjVc/bE8fLkqY2M=;
        b=iw2boBaHs9J+ZIextjBRyC2QDg1owcy0DWyIrUxju74Pi/s9xA7xDdrPn8Jhefqq6t
         m8a4T2taWoo+Vr72TapbGVK3G4JM1piHugsKkRSgY/eTVc4aXfFQCKWiKzdmrhRvklVz
         8UW/2rqXicVyUc8IJv+aP++aBPmHoH3fod18YfjeOsGDBM4TU8zb4gS/4qKY8UPj5cHg
         Rek1j94DHuV4FuHmNo2r20MGvjXMgxBhm9FKwEiDn2dZagLKtps2WhrymMiDa3MFTxe0
         qDtrVJrw6c5umCj0evmSPYKndVO8AHQ1ldXgVhVFUfTbPsWd+TOq1e8RsucsRVlo3iWl
         Tb6Q==
X-Gm-Message-State: AA+aEWbx0qhofrMxwQTQARIvE+LQax6uQuq/3QW564q62jCECvbW91sE
        IXfiGsGoewC9AHYvruY9ui3bDw==
X-Google-Smtp-Source: AFSGD/WwBkLtx/2+rsJz8EKva+zOAw3UYuj7OIEVEXnn41gItTDoWAgGJfWYfZ3NqfogZ0YiSy18Ow==
X-Received: by 2002:a63:b34f:: with SMTP id x15mr3471723pgt.243.1544807776049;
        Fri, 14 Dec 2018 09:16:16 -0800 (PST)
Received: from surenb0.mtv.corp.google.com ([2620:0:1000:1612:3320:4357:47df:276b])
        by smtp.googlemail.com with ESMTPSA id g185sm7605761pfc.174.2018.12.14.09.16.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Dec 2018 09:16:14 -0800 (PST)
From:   Suren Baghdasaryan <surenb@google.com>
To:     gregkh@linuxfoundation.org
Cc:     tj@kernel.org, lizefan@huawei.com, hannes@cmpxchg.org,
        axboe@kernel.dk, dennis@kernel.org, dennisszhou@gmail.com,
        mingo@redhat.com, peterz@infradead.org, akpm@linux-foundation.org,
        corbet@lwn.net, cgroups@vger.kernel.org, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-team@android.com, Suren Baghdasaryan <surenb@google.com>
Subject: [PATCH 2/6] kernel: cgroup: add poll file operation
Date:   Fri, 14 Dec 2018 09:15:04 -0800
Message-Id: <20181214171508.7791-3-surenb@google.com>
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

Cgroup has a standardized poll/notification mechanism for waking all
pollers on all fds when a filesystem node changes. To allow polling
for custom events, add a .poll callback that can override the default.

This is in preparation for pollable cgroup pressure files which have
per-fd trigger configurations.

Signed-off-by: Johannes Weiner <hannes@cmpxchg.org>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/cgroup-defs.h |  4 ++++
 kernel/cgroup/cgroup.c      | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/linux/cgroup-defs.h b/include/linux/cgroup-defs.h
index 5e1694fe035b..6f9ea8601421 100644
--- a/include/linux/cgroup-defs.h
+++ b/include/linux/cgroup-defs.h
@@ -32,6 +32,7 @@ struct kernfs_node;
 struct kernfs_ops;
 struct kernfs_open_file;
 struct seq_file;
+struct poll_table_struct;
 
 #define MAX_CGROUP_TYPE_NAMELEN 32
 #define MAX_CGROUP_ROOT_NAMELEN 64
@@ -573,6 +574,9 @@ struct cftype {
 	ssize_t (*write)(struct kernfs_open_file *of,
 			 char *buf, size_t nbytes, loff_t off);
 
+	__poll_t (*poll)(struct kernfs_open_file *of,
+			 struct poll_table_struct *pt);
+
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
 	struct lock_class_key	lockdep_key;
 #endif
diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index 6aaf5dd5383b..ffcd7483b8ee 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -3499,6 +3499,16 @@ static ssize_t cgroup_file_write(struct kernfs_open_file *of, char *buf,
 	return ret ?: nbytes;
 }
 
+static __poll_t cgroup_file_poll(struct kernfs_open_file *of, poll_table *pt)
+{
+	struct cftype *cft = of->kn->priv;
+
+	if (cft->poll)
+		return cft->poll(of, pt);
+
+	return kernfs_generic_poll(of, pt);
+}
+
 static void *cgroup_seqfile_start(struct seq_file *seq, loff_t *ppos)
 {
 	return seq_cft(seq)->seq_start(seq, ppos);
@@ -3537,6 +3547,7 @@ static struct kernfs_ops cgroup_kf_single_ops = {
 	.open			= cgroup_file_open,
 	.release		= cgroup_file_release,
 	.write			= cgroup_file_write,
+	.poll			= cgroup_file_poll,
 	.seq_show		= cgroup_seqfile_show,
 };
 
@@ -3545,6 +3556,7 @@ static struct kernfs_ops cgroup_kf_ops = {
 	.open			= cgroup_file_open,
 	.release		= cgroup_file_release,
 	.write			= cgroup_file_write,
+	.poll			= cgroup_file_poll,
 	.seq_start		= cgroup_seqfile_start,
 	.seq_next		= cgroup_seqfile_next,
 	.seq_stop		= cgroup_seqfile_stop,
-- 
2.20.0.405.gbc1bbc6f85-goog

