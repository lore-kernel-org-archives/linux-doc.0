Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BB44C636CC
	for <linux-doc@archiver.kernel.org>; Tue, 31 Jan 2023 21:07:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231953AbjAaVHO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 31 Jan 2023 16:07:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231954AbjAaVHJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 31 Jan 2023 16:07:09 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 473CC4217
        for <linux-doc@vger.kernel.org>; Tue, 31 Jan 2023 13:07:08 -0800 (PST)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1A47C41AB7
        for <linux-doc@vger.kernel.org>; Tue, 31 Jan 2023 21:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1675199227;
        bh=vxTJcLnUl2iJvt/ei3alGqSMjASKsv3g66JrV0OgMpo=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=LEUhYtWPyZCCst5A0m6HOJVCoKWbbqLLP3ruc/+kJYFePTalMGqZAUjpoMa2Q9tB+
         vgo6MOMvNddp1ldti5zlm7rno7+E5QPmPHbTzOm+jiDHNEa2I+QkSQBdKdJ9+QQTbA
         O7feXKJ2U2rWUhPDB3p5BLDaIxSQgE4byrsP3RRRGld41dkI4jfjJSCWX4Xk7B3Nix
         7r/LOTeIpZRtyz4JKUrNxiG/PfZ5jlEcNuKpBS5mQ9oXAr3u7VJHBhrPRcmextTQLY
         jaIGe9/POjevXTVj22kLW/f0HwRHWMd7aFiuqVF2mdhviOzoQmQ88BJ3ndqax6JQHb
         y3VJdZd4aFWmQ==
Received: by mail-ej1-f71.google.com with SMTP id gz8-20020a170907a04800b0087bd94a505fso8090867ejc.16
        for <linux-doc@vger.kernel.org>; Tue, 31 Jan 2023 13:07:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vxTJcLnUl2iJvt/ei3alGqSMjASKsv3g66JrV0OgMpo=;
        b=ctI44+b+VUxI3xy7nD5B83BUuFNmxR7yiMtovM84530jvjBMqRFgla128SbXQQdM4y
         sg5trkVT2L6wjMFMHoMr+zEZU3KMz09hHphIW//bzZq3HFu5VPF3WDtatXL17phTJkgz
         NzqN6xlII/3UqzK3jxJz9UMRZi24cr1QMX7T75zDUhJBs+deQB0CShGfFrc0cEY1azlb
         3mo/G0lc/Zd28Y07qvGufSDZTkZMxepTFmOziDluoT8Crgd0J3PHCswLa/SfBdJ8bBvF
         yEWj4xWjlkf0O8QFLD1U8GPk2f2rMvIrG24AC/GkUoIJxSJ1Yl3sqYqLz67fydTJ02K1
         eAGQ==
X-Gm-Message-State: AO0yUKXNkVCQmK48u5ivO8SXvOp8kjgSWN0n8Y4jgu8KfxUs9TQ9gYVV
        9PemZCV6hQWysv6dBekKMmt9dlyT6tWt8y0iNMoM718sihl+hry5lDyWLyZ7uhV5UFU39Vek6fx
        qm8O4P4YV432T7RcvrxjZlDhjzDDU0G5aqAKakQ==
X-Received: by 2002:a50:ce54:0:b0:4a0:e039:e911 with SMTP id k20-20020a50ce54000000b004a0e039e911mr22586876edj.12.1675199226543;
        Tue, 31 Jan 2023 13:07:06 -0800 (PST)
X-Google-Smtp-Source: AK7set/ngHjrMHGUa+vjq5MtKRDI725l3woF78dnXrwnaUOYpAIGaHtBTNv/Ehj3nxgbIh8yLpaVIg==
X-Received: by 2002:a50:ce54:0:b0:4a0:e039:e911 with SMTP id k20-20020a50ce54000000b004a0e039e911mr22586865edj.12.1675199226359;
        Tue, 31 Jan 2023 13:07:06 -0800 (PST)
Received: from amikhalitsyn.. (ip5f5bf399.dynamic.kabel-deutschland.de. [95.91.243.153])
        by smtp.gmail.com with ESMTPSA id ja3-20020a170907988300b008818d9e0bfesm6231172ejc.117.2023.01.31.13.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 13:07:06 -0800 (PST)
From:   Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
To:     corbet@lwn.net
Cc:     Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH v2 1/2] docs: filesystems: vfs: actualize struct file_system_type description
Date:   Tue, 31 Jan 2023 22:06:50 +0100
Message-Id: <20230131210651.715327-2-aleksandr.mikhalitsyn@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230131210651.715327-1-aleksandr.mikhalitsyn@canonical.com>
References: <20230131210651.715327-1-aleksandr.mikhalitsyn@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Added descriptions for:
- fscontext API ('init_fs_context' method, 'parameters' field)
- 'fs_supers' field

Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Signed-off-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
---
 Documentation/filesystems/vfs.rst | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/vfs.rst
index 2c15e7053113..113d70186324 100644
--- a/Documentation/filesystems/vfs.rst
+++ b/Documentation/filesystems/vfs.rst
@@ -107,7 +107,7 @@ file /proc/filesystems.
 struct file_system_type
 -----------------------
 
-This describes the filesystem.  As of kernel 2.6.39, the following
+This describes the filesystem.  As of kernel 6.2, the following
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

