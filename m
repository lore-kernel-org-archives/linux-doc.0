Return-Path: <SRS0=MCi+=BN=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.6 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4045C433E5
	for <linux-doc@archiver.kernel.org>; Mon,  3 Aug 2020 14:50:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A25982076E
	for <linux-doc@archiver.kernel.org>; Mon,  3 Aug 2020 14:50:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mGbuS+pG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727867AbgHCOrr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 3 Aug 2020 10:47:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726276AbgHCOrq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Aug 2020 10:47:46 -0400
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92E5BC06174A
        for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2020 07:47:46 -0700 (PDT)
Received: by mail-qt1-x849.google.com with SMTP id d24so19581442qtg.23
        for <linux-doc@vger.kernel.org>; Mon, 03 Aug 2020 07:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=exegq5bRss6SDj4yQZt05Kc3+gr2w1N7iotmmiqvfaE=;
        b=mGbuS+pGC2mlZ1nnEmD1UyJJXrsA49ua7zPcaT6Pb99vdkfquF0DlxLELzi2UVFHnz
         UQUik19iARwlMzlIFxykMeRfQ6oge5n7bchL6BZu8lyh6evqernJZXAnv0/9WYrja5HD
         Q9W8tFLfkY4oPAcwJ4a0TnaLj217q3Daa7ocYAM6w+zVg8lJ9OjeITJ9jMx9RHiIcrB7
         v5SJIb3A7rjAEpFPOqH6WpNaQLYoBGUgvH3dH8xM+4XSyt1OAM6VgEjlSccwOg8rJXEw
         qlBvT/iCSh0JFz0QGdWGzwIzM+bYQPBo/ooJ6ucHbeDPUskeVvdf+SxdjQ3AyeiIHfZk
         ZuQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=exegq5bRss6SDj4yQZt05Kc3+gr2w1N7iotmmiqvfaE=;
        b=NErZ610GWHcQ1ryyDxZqHvEmMoNJa63Py1NDeLc2dPmLYwPyACD3LqYZS1L5DJKMg9
         NnkzeIeIelvVVWV8XeNTyrwJWWHYi8QpXNr1dYSrhpHwUiPYFmgxpbiqvLZgxwUegc1v
         svuGAoyMIaspr/PWABOeglEHyB3f6QqKxoN8pTGw5sz8rmVrptigcmcQ4Xz9lMlebB0v
         V+A2EOEP3N0Lllv9bl0dVIeKCzWpcsO9WzUADbiFuPxQBZfdBFUbzYHcHaWEalA13yxw
         2mLMU/nyI18atAbQcZTwD27KgtRk7OnYd4koITsYGRaXJ5BFifg2sl2WMfSK2//TH9Kr
         S2OA==
X-Gm-Message-State: AOAM532SSUQ2O8fQzO8d7XmNr6As3w2OOqBUU6Bbc32ljlDA0XX4XlCv
        dg4nFmwlKUMIEN0xIffYD80q/IEA+aByXwDcvQ==
X-Google-Smtp-Source: ABdhPJzDwQ0aX/7NlvPVgwHIaoyHgpXGgCOEtbhY3RvNh0Xr+RtcQtfdf3+ncwToVPid9YW6tzvTvt4z+owCWodSjw==
X-Received: by 2002:a0c:b743:: with SMTP id q3mr16777556qve.229.1596466065553;
 Mon, 03 Aug 2020 07:47:45 -0700 (PDT)
Date:   Mon,  3 Aug 2020 14:47:18 +0000
In-Reply-To: <20200803144719.3184138-1-kaleshsingh@google.com>
Message-Id: <20200803144719.3184138-2-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20200803144719.3184138-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.28.0.163.g6104cc2f0b6-goog
Subject: [PATCH 1/2] fs: Add fd_install file operation
From:   Kalesh Singh <kaleshsingh@google.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-fsdevel@vger.kernel.org,
        Suren Baghdasaryan <surenb@google.com>,
        Hridya Valsaraju <hridya@google.com>,
        Ioannis Ilkos <ilkos@google.com>,
        John Stultz <john.stultz@linaro.org>, kernel-team@android.com,
        Kalesh Singh <kaleshsingh@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Provides a per process hook for the acquisition of file descriptors,
despite the method used to obtain the descriptor.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 Documentation/filesystems/vfs.rst | 5 +++++
 fs/file.c                         | 3 +++
 include/linux/fs.h                | 1 +
 3 files changed, 9 insertions(+)

diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/vfs.rst
index ed17771c212b..95b30142c8d9 100644
--- a/Documentation/filesystems/vfs.rst
+++ b/Documentation/filesystems/vfs.rst
@@ -1123,6 +1123,11 @@ otherwise noted.
 ``fadvise``
 	possibly called by the fadvise64() system call.
 
+``fd_install``
+	called by the VFS when a file descriptor is installed in the
+	process's file descriptor table, regardless how the file descriptor
+	was acquired -- be it via the open syscall, received over IPC, etc.
+
 Note that the file operations are implemented by the specific
 filesystem in which the inode resides.  When opening a device node
 (character or block special) most filesystems will call special
diff --git a/fs/file.c b/fs/file.c
index abb8b7081d7a..f5db8622b851 100644
--- a/fs/file.c
+++ b/fs/file.c
@@ -616,6 +616,9 @@ void __fd_install(struct files_struct *files, unsigned int fd,
 void fd_install(unsigned int fd, struct file *file)
 {
 	__fd_install(current->files, fd, file);
+
+	if (file->f_op->fd_install)
+		file->f_op->fd_install(fd, file);
 }
 
 EXPORT_SYMBOL(fd_install);
diff --git a/include/linux/fs.h b/include/linux/fs.h
index f5abba86107d..b976fbe8c902 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1864,6 +1864,7 @@ struct file_operations {
 				   struct file *file_out, loff_t pos_out,
 				   loff_t len, unsigned int remap_flags);
 	int (*fadvise)(struct file *, loff_t, loff_t, int);
+	void (*fd_install)(int, struct file *);
 } __randomize_layout;
 
 struct inode_operations {
-- 
2.28.0.163.g6104cc2f0b6-goog

