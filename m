Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A9AAC61DA4
	for <linux-doc@archiver.kernel.org>; Tue, 14 Feb 2023 13:05:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231728AbjBNNF3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 14 Feb 2023 08:05:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229849AbjBNNF2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 Feb 2023 08:05:28 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1C7723860
        for <linux-doc@vger.kernel.org>; Tue, 14 Feb 2023 05:05:27 -0800 (PST)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6B9E03F0B5
        for <linux-doc@vger.kernel.org>; Tue, 14 Feb 2023 13:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1676379925;
        bh=Ku2bmDwU8+fbp3j8ppKDR/hD+8eQUblZOt8X3gSfkfk=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=WIVP8Spm0ivq2yDlHOMc4joS5iysngO5dcUV4NqqqjLU7tjE5LTX48dVcP0sfDkUX
         00nC8tB58b215utTe1nfYtYH4v5tyMKZl7BFSN8d55KEucd9LVAVJzkHQKoExr0YaH
         xG2qud27Vnj1nyDIQAFwyD7T2DzEUlhGA/dUD8TaE/VfzxrkxMNwQoZtcCDkHdpB3W
         1EDf81Kxre72yrXhOakhuIEEb97Cpy1XWxOZVGQq4GnVcewuZF/AhDcEB8Lf5O3N/m
         EmAf1txUYNkPUPEty13C1nBSecO6u4i240dMZcshKoPrNuzY2GVYQ0Eoum0KO73rba
         NAIZljfS64DQw==
Received: by mail-ej1-f69.google.com with SMTP id l18-20020a1709067d5200b008af415fdd80so9335849ejp.21
        for <linux-doc@vger.kernel.org>; Tue, 14 Feb 2023 05:05:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ku2bmDwU8+fbp3j8ppKDR/hD+8eQUblZOt8X3gSfkfk=;
        b=i6OVHA/l9g2Rf+MVHM5zYZyS9qkTMS/z+UfK5FGJrrLIYFKImvIdVUpr7ieUH+UlMI
         lXwLkaeh2luARgskV6iqkNcv9meWSAUrEQylb2TXD2wWC53Tun3/kGPxxc6zc3OlPwj5
         BmpQfy4WyKwBPw3wsb1qa8R0NkyVm5uLc8/L6sfnR4rMm0YYWjlAEAovPCnv9Cp68zOU
         a+bqH0FaFtwsQsuVdP8yvT7vhnsdzGXWmVNa12W9Mt2Da/18UmPU88lIYGRqDi8WRKwW
         CF7s5kAOI24qWI8JCxsp0mDPOl8eVqTpO7jgdrSNGafcSmfUflETg8PIh3iFLcKvGhox
         O92A==
X-Gm-Message-State: AO0yUKXq2jGBVMFLRTGHJ/qUmPZndtJUdzxltkpn8Svj2H+cJgDdxgRg
        9vDl3TP6BVoJ8ltXFZKeND05P8LRtfhjGwpTGA2mzXpV/DStDxL75XM+OM2m1hRsyCFWW1FgHPp
        AEF+0ux4ROA0hB4VPTeYa/UvIKIBZ3xgxVUDCyw==
X-Received: by 2002:a17:906:860a:b0:884:c45f:1c04 with SMTP id o10-20020a170906860a00b00884c45f1c04mr2693090ejx.2.1676379924886;
        Tue, 14 Feb 2023 05:05:24 -0800 (PST)
X-Google-Smtp-Source: AK7set9DRrxF6BlN3XBu5l7hJIoAyPZoxdix0NaxVi0SVFEccl7PQoe08ARqXBFKVsYad4uGzPcxdQ==
X-Received: by 2002:a17:906:860a:b0:884:c45f:1c04 with SMTP id o10-20020a170906860a00b00884c45f1c04mr2693078ejx.2.1676379924653;
        Tue, 14 Feb 2023 05:05:24 -0800 (PST)
Received: from amikhalitsyn.. ([2a02:8109:bd40:1414:c85e:daf1:c7bb:28dc])
        by smtp.gmail.com with ESMTPSA id b9-20020a170906194900b0088478517830sm8209790eje.83.2023.02.14.05.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 05:05:24 -0800 (PST)
From:   Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
To:     corbet@lwn.net
Cc:     Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Miklos Szeredi <mszeredi@redhat.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH v3 1/2] docs: filesystems: vfs: actualize struct file_system_type description
Date:   Tue, 14 Feb 2023 14:02:39 +0100
Message-Id: <20230214130240.166885-2-aleksandr.mikhalitsyn@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230214130240.166885-1-aleksandr.mikhalitsyn@canonical.com>
References: <20230214130240.166885-1-aleksandr.mikhalitsyn@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Added descriptions for:
- fscontext API ('init_fs_context' method, 'parameters' field)
- 'fs_supers' field

Cc: Eric Biggers <ebiggers@kernel.org>
Cc: Miklos Szeredi <mszeredi@redhat.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Signed-off-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
---
 Documentation/filesystems/vfs.rst | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/vfs.rst
index 2c15e7053113..f8905ff070d0 100644
--- a/Documentation/filesystems/vfs.rst
+++ b/Documentation/filesystems/vfs.rst
@@ -107,7 +107,7 @@ file /proc/filesystems.
 struct file_system_type
 -----------------------
 
-This describes the filesystem.  As of kernel 2.6.39, the following
+This describes the filesystem.  The following
 members are defined:
 
 .. code-block:: c
@@ -115,14 +115,24 @@ members are defined:
 	struct file_system_type {
 		const char *name;
 		int fs_flags;
+		int (*init_fs_context)(struct fs_context *);
+		const struct fs_parameter_spec *parameters;
 		struct dentry *(*mount) (struct file_system_type *, int,
-					 const char *, void *);
+			const char *, void *);
 		void (*kill_sb) (struct super_block *);
 		struct module *owner;
 		struct file_system_type * next;
-		struct list_head fs_supers;
+		struct hlist_head fs_supers;
+
 		struct lock_class_key s_lock_key;
 		struct lock_class_key s_umount_key;
+		struct lock_class_key s_vfs_rename_key;
+		struct lock_class_key s_writers_key[SB_FREEZE_LEVELS];
+
+		struct lock_class_key i_lock_key;
+		struct lock_class_key i_mutex_key;
+		struct lock_class_key invalidate_lock_key;
+		struct lock_class_key i_mutex_dir_key;
 	};
 
 ``name``
@@ -132,6 +142,15 @@ members are defined:
 ``fs_flags``
 	various flags (i.e. FS_REQUIRES_DEV, FS_NO_DCACHE, etc.)
 
+``init_fs_context``
+	Initializes 'struct fs_context' ->ops and ->fs_private fields with
+	filesystem-specific data.
+
+``parameters``
+	Pointer to the array of filesystem parameters descriptors
+	'struct fs_parameter_spec'.
+	More info in Documentation/filesystems/mount_api.rst.
+
 ``mount``
 	the method to call when a new instance of this filesystem should
 	be mounted
@@ -148,7 +167,11 @@ members are defined:
 ``next``
 	for internal VFS use: you should initialize this to NULL
 
-  s_lock_key, s_umount_key: lockdep-specific
+``fs_supers``
+	for internal VFS use: hlist of filesystem instances (superblocks)
+
+  s_lock_key, s_umount_key, s_vfs_rename_key, s_writers_key,
+  i_lock_key, i_mutex_key, invalidate_lock_key, i_mutex_dir_key: lockdep-specific
 
 The mount() method has the following arguments:
 
-- 
2.34.1

