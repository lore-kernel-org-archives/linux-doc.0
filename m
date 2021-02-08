Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-26.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8B1BC433E9
	for <linux-doc@archiver.kernel.org>; Mon,  8 Feb 2021 15:54:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8DF4764DC4
	for <linux-doc@archiver.kernel.org>; Mon,  8 Feb 2021 15:54:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233186AbhBHPyY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 8 Feb 2021 10:54:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234213AbhBHPx7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Feb 2021 10:53:59 -0500
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6631DC06178B
        for <linux-doc@vger.kernel.org>; Mon,  8 Feb 2021 07:53:19 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id 203so17375680ybz.2
        for <linux-doc@vger.kernel.org>; Mon, 08 Feb 2021 07:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:cc;
        bh=KABW1PbKP87UHlmwOVcrjPZPD/KiH4IFW6HwyHI8HLw=;
        b=k+plAvQWKUQQEFSYtdDrmR64LjfOFfyNvE5bQyLeuXXk0gQM9M1YLhI+Kpb8Pq6RRy
         xXUgZ8Lu748qxXqRshn9BfzpFkBuZqYWwc0HB+CQPVijF0hLdpKZa0Wx4BE7Cq3qKTcG
         4YemrGBQUUzxrqVLCDIK+5YyUj35ExFZfnKSA5iVF/fkayXaj4lu7prTK/0JiyDIhICI
         fXnLZV8WgGU72cjZral6rTKmmKeGcLVviG4fVVZG1/XbYWgaMoD+guk+XrCXEOwOG7++
         Q2YwHsK7pUuG96I5oZHtxrbJLTTP4zgpIcc4M/9Rss6yk5IY9M17KM/eqzugs31WXzmT
         5VjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :cc;
        bh=KABW1PbKP87UHlmwOVcrjPZPD/KiH4IFW6HwyHI8HLw=;
        b=ls2cbn3GBLvk7O2T1PkbV+cq1bEAFQ06pLAbCMT/u2FTHJG0ztAJahPLktjPFQzCms
         UFZ10MzEZvS7F6AQKQMYDQDTczckH+x3vXdd3OuhSRYmTvErNN31Nc/aHulCMDGP/jb+
         5+WgFQBlUw5RP8gXoB8p9bzUmK+COiM/poeMV1UbQ4VGTTEqSD9lOWRrCOiC2ovj0FRr
         Rx6yWl1t36bxIkrcjS6gZIi0dNod408AYfDW5MPmKAf2AGRVd3l8qyTcG+1C6VlcM/Lt
         sItWERreaZSACardjGKrZ+Wmj6I2Rzy8Uhdr/SgzY+F0Ei4Q++w/cgY07BZf2vI8HOtp
         ovaA==
X-Gm-Message-State: AOAM5336TGryrSO9kqG8xqK+hWsffD3NtYshrCAciQPBldbvMboK/SWB
        NcoPEouoTGiyGyuuKA+OXLTFaxpjnsi51EolXA==
X-Google-Smtp-Source: ABdhPJy5TCKk45UVECdZNGWDZgT1hEcr/O9DAIgFSw2AggyhYlchwyA7OBiwJdM5EuiQp2ZNxIUAKTng2zlyA28byw==
Sender: "kaleshsingh via sendgmr" <kaleshsingh@kaleshsingh.c.googlers.com>
X-Received: from kaleshsingh.c.googlers.com ([fda3:e722:ac3:10:14:4d90:c0a8:2145])
 (user=kaleshsingh job=sendgmr) by 2002:a25:a267:: with SMTP id
 b94mr25868498ybi.218.1612799598492; Mon, 08 Feb 2021 07:53:18 -0800 (PST)
Date:   Mon,  8 Feb 2021 15:53:06 +0000
Message-Id: <20210208155315.1367371-1-kaleshsingh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.478.g8a0d178c01-goog
Subject: [PATCH v6 1/2] procfs: Allow reading fdinfo with PTRACE_MODE_READ
From:   Kalesh Singh <kaleshsingh@google.com>
Cc:     jannh@google.com, jeffv@google.com, keescook@chromium.org,
        surenb@google.com, minchan@kernel.org, hridya@google.com,
        rdunlap@infradead.org, christian.koenig@amd.com,
        willy@infradead.org, kernel-team@android.com,
        Kalesh Singh <kaleshsingh@google.com>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michal Hocko <mhocko@suse.com>,
        Alexey Gladkov <gladkov.alexey@gmail.com>,
        NeilBrown <neilb@suse.de>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Daniel Jordan <daniel.m.jordan@oracle.com>,
        Michel Lespinasse <walken@google.com>,
        Bernd Edlinger <bernd.edlinger@hotmail.de>,
        Andrei Vagin <avagin@gmail.com>,
        Yafang Shao <laoar.shao@gmail.com>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Android captures per-process system memory state when certain low memory
events (e.g a foreground app kill) occur, to identify potential memory
hoggers. In order to measure how much memory a process actually consumes,
it is necessary to include the DMA buffer sizes for that process in the
memory accounting. Since the handle to DMA buffers are raw FDs, it is
important to be able to identify which processes have FD references to
a DMA buffer.

Currently, DMA buffer FDs can be accounted using /proc/<pid>/fd/* and
/proc/<pid>/fdinfo -- both are only readable by the process owner,
as follows:
  1. Do a readlink on each FD.
  2. If the target path begins with "/dmabuf", then the FD is a dmabuf FD.
  3. stat the file to get the dmabuf inode number.
  4. Read/ proc/<pid>/fdinfo/<fd>, to get the DMA buffer size.

Accessing other processes' fdinfo requires root privileges. This limits
the use of the interface to debugging environments and is not suitable
for production builds.  Granting root privileges even to a system process
increases the attack surface and is highly undesirable.

Since fdinfo doesn't permit reading process memory and manipulating
process state, allow accessing fdinfo under PTRACE_MODE_READ_FSCRED.

Suggested-by: Jann Horn <jannh@google.com>
Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
Changes in v2:
  - Update patch description

 fs/proc/base.c |  4 ++--
 fs/proc/fd.c   | 15 ++++++++++++++-
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/fs/proc/base.c b/fs/proc/base.c
index b3422cda2a91..a37f9de7103f 100644
--- a/fs/proc/base.c
+++ b/fs/proc/base.c
@@ -3160,7 +3160,7 @@ static const struct pid_entry tgid_base_stuff[] = {
 	DIR("task",       S_IRUGO|S_IXUGO, proc_task_inode_operations, proc_task_operations),
 	DIR("fd",         S_IRUSR|S_IXUSR, proc_fd_inode_operations, proc_fd_operations),
 	DIR("map_files",  S_IRUSR|S_IXUSR, proc_map_files_inode_operations, proc_map_files_operations),
-	DIR("fdinfo",     S_IRUSR|S_IXUSR, proc_fdinfo_inode_operations, proc_fdinfo_operations),
+	DIR("fdinfo",     S_IRUGO|S_IXUGO, proc_fdinfo_inode_operations, proc_fdinfo_operations),
 	DIR("ns",	  S_IRUSR|S_IXUGO, proc_ns_dir_inode_operations, proc_ns_dir_operations),
 #ifdef CONFIG_NET
 	DIR("net",        S_IRUGO|S_IXUGO, proc_net_inode_operations, proc_net_operations),
@@ -3504,7 +3504,7 @@ static const struct inode_operations proc_tid_comm_inode_operations = {
  */
 static const struct pid_entry tid_base_stuff[] = {
 	DIR("fd",        S_IRUSR|S_IXUSR, proc_fd_inode_operations, proc_fd_operations),
-	DIR("fdinfo",    S_IRUSR|S_IXUSR, proc_fdinfo_inode_operations, proc_fdinfo_operations),
+	DIR("fdinfo",    S_IRUGO|S_IXUGO, proc_fdinfo_inode_operations, proc_fdinfo_operations),
 	DIR("ns",	 S_IRUSR|S_IXUGO, proc_ns_dir_inode_operations, proc_ns_dir_operations),
 #ifdef CONFIG_NET
 	DIR("net",        S_IRUGO|S_IXUGO, proc_net_inode_operations, proc_net_operations),
diff --git a/fs/proc/fd.c b/fs/proc/fd.c
index cb51763ed554..585e213301f9 100644
--- a/fs/proc/fd.c
+++ b/fs/proc/fd.c
@@ -6,6 +6,7 @@
 #include <linux/fdtable.h>
 #include <linux/namei.h>
 #include <linux/pid.h>
+#include <linux/ptrace.h>
 #include <linux/security.h>
 #include <linux/file.h>
 #include <linux/seq_file.h>
@@ -72,6 +73,18 @@ static int seq_show(struct seq_file *m, void *v)
 
 static int seq_fdinfo_open(struct inode *inode, struct file *file)
 {
+	bool allowed = false;
+	struct task_struct *task = get_proc_task(inode);
+
+	if (!task)
+		return -ESRCH;
+
+	allowed = ptrace_may_access(task, PTRACE_MODE_READ_FSCREDS);
+	put_task_struct(task);
+
+	if (!allowed)
+		return -EACCES;
+
 	return single_open(file, seq_show, inode);
 }
 
@@ -307,7 +320,7 @@ static struct dentry *proc_fdinfo_instantiate(struct dentry *dentry,
 	struct proc_inode *ei;
 	struct inode *inode;
 
-	inode = proc_pid_make_inode(dentry->d_sb, task, S_IFREG | S_IRUSR);
+	inode = proc_pid_make_inode(dentry->d_sb, task, S_IFREG | S_IRUGO);
 	if (!inode)
 		return ERR_PTR(-ENOENT);
 
-- 
2.30.0.478.g8a0d178c01-goog

