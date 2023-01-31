Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 525E2C636CC
	for <linux-doc@archiver.kernel.org>; Tue, 31 Jan 2023 12:16:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231513AbjAaMQL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 31 Jan 2023 07:16:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231416AbjAaMQK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 31 Jan 2023 07:16:10 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B18940BE4
        for <linux-doc@vger.kernel.org>; Tue, 31 Jan 2023 04:16:06 -0800 (PST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 13BC541AC7
        for <linux-doc@vger.kernel.org>; Tue, 31 Jan 2023 12:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1675167364;
        bh=T9pFM0TaSiU75dNwwObnUqA54OKkqExI+JiVpjCtTNY=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=amESIRA6nAQ9E5AOAYCu/2LdSayK7lcVpLo5DAystk1AzM3iSP9LJ3fbXkftqxTaS
         GtRxFS5DMBm8eEfr3rDD9JUS17VZrc/+Du0sKjt0TGJ6ssLpLCoQKzgtMxOSi79s4P
         A8g482UVbsa5ZraR2tnS7PFcmk8pcMx9nYQXW9SzD3lh5qNSoTbQTIf0zpBIs3Ihqw
         OlkSbtCLwgkDhXIsfMU+vljfJEhWcPGyslLBOqASPyEIZzNDg69UdJgHMvK703atlK
         R8QJ0vdXk3LHIjx8mq2MRZGo+bTq2c+NB6fPyyj/FLIQuV7kRkPh2REFZv+2/o7fEg
         zkr/b+dOzR+nw==
Received: by mail-ed1-f71.google.com with SMTP id q20-20020a056402519400b0049e5b8c71b3so10464609edd.17
        for <linux-doc@vger.kernel.org>; Tue, 31 Jan 2023 04:16:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T9pFM0TaSiU75dNwwObnUqA54OKkqExI+JiVpjCtTNY=;
        b=ueyOkGy4ODgdhBaWu2qPK089VYvObSO1n2K19Q+3ujL8gcTawP7phjvtcLZP/iYjMg
         T6phLMa8jSiOVdLIy9a1Gr64M5T4QMr/R7k30WcQgXVlPGB+YGLLOUPUi5ZnpT09qu4z
         TgkoAd+EDkCXCJttwSLnErI9X7JhAv6h3vmvXBj7SiQZNe7tE/TBhltZ/MpCcCoAOyxS
         bEOeXOAZegxtMuENR1tqVcCRMe1xzQh6Y0Vj48svOzkS7isOXRnA7o9aNsuyKk/lfTKJ
         cSyndl3pzdwztaZ3VCNUQSDNuwgVuNP5t2jkQHWtPWv6UMrO8HcBvglEJhdc+TjCdjja
         yGpQ==
X-Gm-Message-State: AO0yUKWorVZMmOINfuGrjfXSZ1J4fTAaEaTK5Urc/WT5udzPWFbdHmu7
        WF+WSm4BA9UhBMjhAq4GkMOLv5Ok8ju3RuS7TyqZSctD/c9uEqxGIVdbRPQLDJM++DOCABK/KKL
        ZAy1o3zYnexo9ergxcZ1mq8KeJjiOQRryuuFUyA==
X-Received: by 2002:a50:9e2f:0:b0:4a1:f49e:48bf with SMTP id z44-20020a509e2f000000b004a1f49e48bfmr18447829ede.7.1675167362836;
        Tue, 31 Jan 2023 04:16:02 -0800 (PST)
X-Google-Smtp-Source: AK7set/ypBMfNG1otMzUvh3lwDVgiSjv8iNANEI/lOt7rsQ5LLwFAFauXQGDGD1JtBOLqr1hdn9sVQ==
X-Received: by 2002:a50:9e2f:0:b0:4a1:f49e:48bf with SMTP id z44-20020a509e2f000000b004a1f49e48bfmr18447817ede.7.1675167362622;
        Tue, 31 Jan 2023 04:16:02 -0800 (PST)
Received: from amikhalitsyn.. (ip5f5bf399.dynamic.kabel-deutschland.de. [95.91.243.153])
        by smtp.gmail.com with ESMTPSA id u20-20020a50a414000000b004a08c52a2f0sm8378432edb.76.2023.01.31.04.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 04:16:02 -0800 (PST)
From:   Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
To:     corbet@lwn.net
Cc:     Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH 1/2] docs: filesystems: vfs: actualize struct file_system_type description
Date:   Tue, 31 Jan 2023 13:15:46 +0100
Message-Id: <20230131121546.176946-1-aleksandr.mikhalitsyn@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Cc: linux-fsdevel@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Signed-off-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
---
 Documentation/filesystems/vfs.rst | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/vfs.rst
index 2c15e7053113..fab3bd702250 100644
--- a/Documentation/filesystems/vfs.rst
+++ b/Documentation/filesystems/vfs.rst
@@ -107,7 +107,7 @@ file /proc/filesystems.
 struct file_system_type
 -----------------------
 
-This describes the filesystem.  As of kernel 2.6.39, the following
+This describes the filesystem.  As of kernel 6.1, the following
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
@@ -148,7 +167,8 @@ members are defined:
 ``next``
 	for internal VFS use: you should initialize this to NULL
 
-  s_lock_key, s_umount_key: lockdep-specific
+  s_lock_key, s_umount_key, s_vfs_rename_key, s_writers_key,
+  i_lock_key, i_mutex_key, invalidate_lock_key, i_mutex_dir_key: lockdep-specific
 
 The mount() method has the following arguments:
 
-- 
2.34.1

