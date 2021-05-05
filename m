Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D306DC43600
	for <linux-doc@archiver.kernel.org>; Wed,  5 May 2021 12:10:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A916B613BE
	for <linux-doc@archiver.kernel.org>; Wed,  5 May 2021 12:10:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233354AbhEEMLJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 5 May 2021 08:11:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233260AbhEEMKC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 May 2021 08:10:02 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37C7FC06134F
        for <linux-doc@vger.kernel.org>; Wed,  5 May 2021 05:08:02 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id gc22-20020a17090b3116b02901558435aec1so706017pjb.4
        for <linux-doc@vger.kernel.org>; Wed, 05 May 2021 05:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=er9VZQaXB9mqlTug8P/CdY64pJKQpVeWJ9WCI0lDKgQ=;
        b=qMJZcNky7tcpsGFwnnv5lw/Ip5iOFHTCRTenk5upmgghaL+Uwz+iK2w5mHs+tBikL6
         2d8uqVa2FhE6PRFPaG4x5fyx4csvE0GsfB1LWQKuIdZE2+OEYAWFUCr4+KM7CuzA4o5u
         oM8rDRt8HECwxndIuBZ4wpNQgMooI4MabJXRz0PnzE7FWZLTC84TP0en7ZDOgvJQ+4Z1
         ux3+cJorI5bNR4SZWaLdWUYySOAoZuvul7WJbGV9ED2DzwlOOdv0uvPpO7k7zLRLZdmF
         IcH/L+W/KYegqFKJWE+z2ICzEH856bS4FP/tizMW5h7PJw1xK4vXegBEOwfFy6poQK7i
         sEkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=er9VZQaXB9mqlTug8P/CdY64pJKQpVeWJ9WCI0lDKgQ=;
        b=YeeAkIh6pcTcIrrv8QnneseO7jxCknDvgbYNQk+Nw1+R7zHPGzeLgsPPPnJefIeVSb
         w5NtFt0iv2kQ9loF+MTdI1lQuHzDuBnVqZCQV22RvNONYt/g+l0iC/deG/dk0nbKpy3X
         o/64wTQHUoeKXzlujeXwY2SKv94gKqdj76LKv7KpGvDwZUQFAcumjpwqr7nDkhDFlQUR
         5wgXh0PEk45nDu4baPm4Fc+WjZK6iVPfLSQCO6sHD29QyFpBSwbuvZ/0Fv6HmHY+fQb8
         /CwylMKKtdKwFlbEVW35Ht3WoyTIJ/LoGo2rSoEXRlccVdEGNmFPqz++4IUDe2QEU+E0
         qMgQ==
X-Gm-Message-State: AOAM530vNdJ8mgX8YBto6m/ONvwEkVbXd9FO9UjlaGRYNmn9ilCcyLCh
        EZzrAi1zSBRgX/hKb7bvszo=
X-Google-Smtp-Source: ABdhPJzqW5kjwV1AAiBSM5rHNcg6ze8Dz8PZBhnNkd8wi17Y8HeON+NsoJ8JZxoEp0/BrLkA44ZDNg==
X-Received: by 2002:a17:902:423:b029:ee:e5f7:7269 with SMTP id 32-20020a1709020423b02900eee5f77269mr11324847ple.32.1620216481751;
        Wed, 05 May 2021 05:08:01 -0700 (PDT)
Received: from WRT-WX9.. ([141.164.41.4])
        by smtp.gmail.com with ESMTPSA id j7sm14177959pfc.164.2021.05.05.05.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 05:08:01 -0700 (PDT)
From:   Changbin Du <changbin.du@gmail.com>
To:     Eric Van Hensbergen <ericvh@gmail.com>,
        Latchesar Ionkov <lucho@ionkov.net>,
        Dominique Martinet <asmadeus@codewreck.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Changbin Du <changbin.du@gmail.com>
Subject: [PATCH 1/3] 9p: add support for root file systems
Date:   Wed,  5 May 2021 20:07:46 +0800
Message-Id: <20210505120748.8622-2-changbin.du@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505120748.8622-1-changbin.du@gmail.com>
References: <20210505120748.8622-1-changbin.du@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This introduces a new kernel command-line option called 'v9fsroot='
which will tell the kernel to mount the root file system by
utilizing the 9p protocol.

This allows us to mount host folder as rootfs for guest linux in qemu.
Bellow is an example which mounts v9fs with tag 'r' as rootfs in qemu
guest via virtio transport.

  $ qemu-system-x86_64 -enable-kvm -cpu host -m 1024 \
      -virtfs local,path=$rootfs_dir,mount_tag=r,security_model=passthrough,id=r \
      -kernel /path/to/linux/arch/x86/boot/bzImage -nographic \
      -append "root=/dev/v9fs v9fsroot=r,trans=virtio rw console=ttyS0 3"

Signed-off-by: Changbin Du <changbin.du@gmail.com>
---
 fs/9p/Kconfig            |  6 ++++
 fs/9p/Makefile           |  1 +
 fs/9p/v9fsroot.c         | 64 ++++++++++++++++++++++++++++++++++++++++
 include/linux/root_dev.h |  1 +
 init/do_mounts.c         | 46 +++++++++++++++++++++++++++++
 5 files changed, 118 insertions(+)
 create mode 100644 fs/9p/v9fsroot.c

diff --git a/fs/9p/Kconfig b/fs/9p/Kconfig
index 09fd4a185fd2..71c5a49f9a27 100644
--- a/fs/9p/Kconfig
+++ b/fs/9p/Kconfig
@@ -42,3 +42,9 @@ config 9P_FS_SECURITY
 
 	  If you are not using a security module that requires using
 	  extended attributes for file security labels, say N.
+
+config 9P_FS_ROOT
+	bool "9p root file system"
+	depends on 9P_FS=y
+	help
+	  Enables root file system support over 9p protocol.
diff --git a/fs/9p/Makefile b/fs/9p/Makefile
index e7800a5c7395..bc2a4ef10049 100644
--- a/fs/9p/Makefile
+++ b/fs/9p/Makefile
@@ -15,3 +15,4 @@ obj-$(CONFIG_9P_FS) := 9p.o
 
 9p-$(CONFIG_9P_FSCACHE) += cache.o
 9p-$(CONFIG_9P_FS_POSIX_ACL) += acl.o
+9p-$(CONFIG_9P_FS_ROOT) += v9fsroot.o
diff --git a/fs/9p/v9fsroot.c b/fs/9p/v9fsroot.c
new file mode 100644
index 000000000000..7dd91cc3814f
--- /dev/null
+++ b/fs/9p/v9fsroot.c
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * SMB root file system support
+ *
+ * Copyright (c) 2021 Changbin Du <changbin.du@gmail.com>
+ */
+#include <linux/init.h>
+#include <linux/fs.h>
+#include <linux/types.h>
+#include <linux/ctype.h>
+#include <linux/string.h>
+#include <linux/root_dev.h>
+#include <linux/kernel.h>
+
+static char root_dev[2048] __initdata = "";
+static char root_opts[1024] __initdata = "";
+
+/* v9fsroot=<path>[,options] */
+static int __init v9fs_root_setup(char *line)
+{
+	char *s;
+	int len;
+
+	ROOT_DEV = Root_V9FS;
+
+	if (strlen(line) >= 1) {
+		/* make s point to ',' or '\0' at end of line */
+		s = strchrnul(line, ',');
+		/* len is strlen(unc) + '\0' */
+		len = s - line + 1;
+		if (len > sizeof(root_dev)) {
+			printk(KERN_ERR "Root-V9FS: path too long\n");
+			return 1;
+		}
+		strlcpy(root_dev, line, len);
+		if (*s) {
+			int n = snprintf(root_opts,
+					 sizeof(root_opts), "%s,%s",
+					 DEFAULT_MNT_OPTS, s + 1);
+			if (n >= sizeof(root_opts)) {
+				printk(KERN_ERR "Root-V9FS: mount options string too long\n");
+				root_opts[sizeof(root_opts)-1] = '\0';
+				return 1;
+			}
+		}
+	}
+
+	return 1;
+}
+
+__setup("v9fsroot=", v9fs_root_setup);
+
+int __init v9fs_root_data(char **dev, char **opts)
+{
+	if (!root_dev[0]) {
+		printk(KERN_ERR "Root-V9FS: no rootdev specified\n");
+		return -1;
+	}
+
+	*dev = root_dev;
+	*opts = root_opts;
+
+	return 0;
+}
diff --git a/include/linux/root_dev.h b/include/linux/root_dev.h
index 4e78651371ba..becd0ee2ff87 100644
--- a/include/linux/root_dev.h
+++ b/include/linux/root_dev.h
@@ -9,6 +9,7 @@
 enum {
 	Root_NFS = MKDEV(UNNAMED_MAJOR, 255),
 	Root_CIFS = MKDEV(UNNAMED_MAJOR, 254),
+	Root_V9FS = MKDEV(UNNAMED_MAJOR, 253),
 	Root_RAM0 = MKDEV(RAMDISK_MAJOR, 0),
 	Root_RAM1 = MKDEV(RAMDISK_MAJOR, 1),
 	Root_FD0 = MKDEV(FLOPPY_MAJOR, 0),
diff --git a/init/do_mounts.c b/init/do_mounts.c
index a78e44ee6adb..60af89983a6b 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -287,6 +287,8 @@ dev_t name_to_dev_t(const char *name)
 		return Root_NFS;
 	if (strcmp(name, "/dev/cifs") == 0)
 		return Root_CIFS;
+	if (strcmp(name, "/dev/v9fs") == 0)
+		return Root_V9FS;
 	if (strcmp(name, "/dev/ram") == 0)
 		return Root_RAM0;
 #ifdef CONFIG_BLOCK
@@ -536,6 +538,43 @@ static int __init mount_cifs_root(void)
 }
 #endif
 
+#ifdef CONFIG_9P_FS_ROOT
+
+extern int v9fs_root_data(char **dev, char **opts);
+
+#define V9FSROOT_TIMEOUT_MIN	5
+#define V9FSROOT_TIMEOUT_MAX	30
+#define V9FSROOT_RETRY_MAX	5
+
+static int __init mount_v9fs_root(void)
+{
+	char *root_dev, *root_data;
+	unsigned int timeout;
+	int try, err;
+
+	err = v9fs_root_data(&root_dev, &root_data);
+	if (err != 0)
+		return 0;
+
+	timeout = V9FSROOT_TIMEOUT_MIN;
+	for (try = 1; ; try++) {
+		err = do_mount_root(root_dev, "9p",
+				    root_mountflags, root_data);
+		if (err == 0)
+			return 1;
+		if (try > V9FSROOT_RETRY_MAX)
+			break;
+
+		/* Wait, in case the server refused us immediately */
+		ssleep(timeout);
+		timeout <<= 1;
+		if (timeout > V9FSROOT_TIMEOUT_MAX)
+			timeout = V9FSROOT_TIMEOUT_MAX;
+	}
+	return 0;
+}
+#endif
+
 void __init mount_root(void)
 {
 #ifdef CONFIG_ROOT_NFS
@@ -552,6 +591,13 @@ void __init mount_root(void)
 		return;
 	}
 #endif
+#ifdef CONFIG_9P_FS_ROOT
+	if (ROOT_DEV == Root_V9FS) {
+		if (!mount_v9fs_root())
+			printk(KERN_ERR "VFS: Unable to mount root fs via 9p.\n");
+		return;
+	}
+#endif
 #ifdef CONFIG_BLOCK
 	{
 		int err = create_dev("/dev/root", ROOT_DEV);
-- 
2.30.2

