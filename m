Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4204C004D4
	for <linux-doc@archiver.kernel.org>; Wed, 18 Jan 2023 06:27:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbjARG06 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 18 Jan 2023 01:26:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbjARGYi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Jan 2023 01:24:38 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB063577FC
        for <linux-doc@vger.kernel.org>; Tue, 17 Jan 2023 22:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674022423;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LRj04i8kO8UNSuXsGqfC3ZL11EhFJ7RqZPr5BWcyY7o=;
        b=a22vZkOkpGdo3+WXCeE+yYdq/5dUJbYW5+TKZmhq8K1Q+fwD0VdMtKAJtKWv1HbpAsfDOa
        m6qZpMzNNpPBA51puES5Mp8msKj0yvvUcc+LNb0rXsHiH+69AxlHTe0qykRDPBN+1Ey9VY
        ep9TXhPmop4wSspI+dmKFuaNzLhKYBA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-466-IBjit0L1OL2AFKJ3M7OSsQ-1; Wed, 18 Jan 2023 01:13:42 -0500
X-MC-Unique: IBjit0L1OL2AFKJ3M7OSsQ-1
Received: by mail-ed1-f72.google.com with SMTP id w3-20020a056402268300b00487e0d9b53fso22961250edd.10
        for <linux-doc@vger.kernel.org>; Tue, 17 Jan 2023 22:13:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LRj04i8kO8UNSuXsGqfC3ZL11EhFJ7RqZPr5BWcyY7o=;
        b=P/aKJbQKDP/UiMQsHiYWKlvteGSh0z1b2jpWv98MezEpWQqO6v08JTb+eH9u0++Dkk
         zXnF1dsEQDiYT5Mkwxvmehy/JncJ16Pu+7FGHnAr2pIPmkV/t/kdIfOdHQSMfQEU/XOV
         59Q7os7znjVaAI23b9Uss+3vq5SQmeC5qoClY2Y++wXKneKhGqn1Y/00jtXvSzt2qEr4
         n+UAGcCy3oHDva02RMKNnVVj85oBnDEXrqISqDUYsZx3Ajab2+49/iwF+2u/RxdVStsV
         2zP0oSFgsJ/9Mxfh08o9zSEl43ABF8MGCFnPkzr6PLoq2Rr7rfacJGu7GjHA+wIMYtmE
         7Lfw==
X-Gm-Message-State: AFqh2ko559zzuM2+JxCxFUFtX9l+NP3oPw/0j79UVTx/Fbu8KS6veaR4
        EXPrys5NI3ojrcO2CPW7Dq2av6TX9jvNd2uTRtoDloIAMKAbKDg9qnMswV4+sW6rJuCq3MxD5Ls
        WW7ZVjIS6j/JNK5IA9eGH
X-Received: by 2002:a05:6402:1f8c:b0:49c:77ba:fa4e with SMTP id c12-20020a0564021f8c00b0049c77bafa4emr6733967edc.28.1674022420596;
        Tue, 17 Jan 2023 22:13:40 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuubl4Q+BrV9UaSYE4y1nIeSfLTxJuIFssdDOshvWY6gwkEiz1G6vykDvEF/pqTjsvuwJOBeg==
X-Received: by 2002:a05:6402:1f8c:b0:49c:77ba:fa4e with SMTP id c12-20020a0564021f8c00b0049c77bafa4emr6733954edc.28.1674022420424;
        Tue, 17 Jan 2023 22:13:40 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id f22-20020a17090631d600b00779cde476e4sm14066042ejf.62.2023.01.17.22.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 22:13:40 -0800 (PST)
From:   Danilo Krummrich <dakr@redhat.com>
To:     daniel@ffwll.ch, airlied@redhat.com, christian.koenig@amd.com,
        bskeggs@redhat.com, jason@jlekstrand.net, tzimmermann@suse.de,
        mripard@kernel.org, corbet@lwn.net
Cc:     dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH drm-next 04/14] drm: debugfs: provide infrastructure to dump a DRM GPU VA space
Date:   Wed, 18 Jan 2023 07:12:46 +0100
Message-Id: <20230118061256.2689-5-dakr@redhat.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118061256.2689-1-dakr@redhat.com>
References: <20230118061256.2689-1-dakr@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This commit adds a function to dump a DRM GPU VA space and a macro for
drivers to register the struct drm_info_list 'gpuvas' entry.

Most likely, most drivers might maintain one DRM GPU VA space per struct
drm_file, but there might also be drivers not having a fixed relation
between DRM GPU VA spaces and a DRM core infrastructure, hence we need the
indirection via the driver iterating it's maintained DRM GPU VA spaces.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/drm_debugfs.c | 56 +++++++++++++++++++++++++++++++++++
 include/drm/drm_debugfs.h     | 25 ++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 4f643a490dc3..5389dd73c0fb 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -39,6 +39,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_gpuva_mgr.h>
 
 #include "drm_crtc_internal.h"
 #include "drm_internal.h"
@@ -175,6 +176,61 @@ static const struct file_operations drm_debugfs_fops = {
 	.release = single_release,
 };
 
+/**
+ * drm_debugfs_gpuva_info - dump the given DRM GPU VA space
+ * @m: pointer to the &seq_file to write
+ * @mgr: the &drm_gpuva_manager representing the GPU VA space
+ *
+ * Dumps the GPU VA regions and mappings of a given DRM GPU VA manager.
+ *
+ * For each DRM GPU VA space drivers should call this function from their
+ * &drm_info_list's show callback.
+ *
+ * Returns: 0 on success, -ENODEV if the &mgr is not initialized
+ */
+int drm_debugfs_gpuva_info(struct seq_file *m,
+			   struct drm_gpuva_manager *mgr)
+{
+	struct drm_gpuva_region *reg;
+	struct drm_gpuva *va;
+
+	if (!mgr->name)
+		return -ENODEV;
+
+	seq_printf(m, "DRM GPU VA space (%s)\n", mgr->name);
+	seq_puts  (m, "\n");
+	seq_puts  (m, " VA regions  | start              | range              | end                | sparse\n");
+	seq_puts  (m, "------------------------------------------------------------------------------------\n");
+	seq_printf(m, " VA space    | 0x%016llx | 0x%016llx | 0x%016llx |   -\n",
+		   mgr->mm_start, mgr->mm_range, mgr->mm_start + mgr->mm_range);
+	seq_puts  (m, "-----------------------------------------------------------------------------------\n");
+	drm_gpuva_for_each_region(reg, mgr) {
+		struct drm_mm_node *node = &reg->node;
+
+		if (node == &mgr->kernel_alloc_node) {
+			seq_printf(m, " kernel node | 0x%016llx | 0x%016llx | 0x%016llx |   -\n",
+				   node->start, node->size, node->start + node->size);
+			continue;
+		}
+
+		seq_printf(m, "             | 0x%016llx | 0x%016llx | 0x%016llx | %s\n",
+			   node->start, node->size, node->start + node->size,
+			   reg->sparse ? "true" : "false");
+	}
+	seq_puts(m, "\n");
+	seq_puts(m, " VAs | start              | range              | end                | object             | object offset\n");
+	seq_puts(m, "-------------------------------------------------------------------------------------------------------------\n");
+	drm_gpuva_for_each_va(va, mgr) {
+		struct drm_mm_node *node = &va->node;
+
+		seq_printf(m, "     | 0x%016llx | 0x%016llx | 0x%016llx | 0x%016llx | 0x%016llx\n",
+			   node->start, node->size, node->start + node->size,
+			   (u64)va->gem.obj, va->gem.offset);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_debugfs_gpuva_info);
 
 /**
  * drm_debugfs_create_files - Initialize a given set of debugfs files for DRM
diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
index 7616f457ce70..cb2c1956a214 100644
--- a/include/drm/drm_debugfs.h
+++ b/include/drm/drm_debugfs.h
@@ -34,6 +34,22 @@
 
 #include <linux/types.h>
 #include <linux/seq_file.h>
+
+#include <drm/drm_gpuva_mgr.h>
+
+/**
+ * DRM_DEBUGFS_GPUVA_INFO - &drm_info_list entry to dump a GPU VA space
+ * @show: the &drm_info_list's show callback
+ * @data: driver private data
+ *
+ * Drivers should use this macro to define a &drm_info_list entry to provide a
+ * debugfs file for dumping the GPU VA space regions and mappings.
+ *
+ * For each DRM GPU VA space drivers should call drm_debugfs_gpuva_info() from
+ * their @show callback.
+ */
+#define DRM_DEBUGFS_GPUVA_INFO(show, data) {"gpuvas", show, DRIVER_GEM_GPUVA, data}
+
 /**
  * struct drm_info_list - debugfs info list entry
  *
@@ -134,6 +150,9 @@ void drm_debugfs_add_file(struct drm_device *dev, const char *name,
 
 void drm_debugfs_add_files(struct drm_device *dev,
 			   const struct drm_debugfs_info *files, int count);
+
+int drm_debugfs_gpuva_info(struct seq_file *m,
+			   struct drm_gpuva_manager *mgr);
 #else
 static inline void drm_debugfs_create_files(const struct drm_info_list *files,
 					    int count, struct dentry *root,
@@ -155,6 +174,12 @@ static inline void drm_debugfs_add_files(struct drm_device *dev,
 					 const struct drm_debugfs_info *files,
 					 int count)
 {}
+
+static inline int drm_debugfs_gpuva_info(struct seq_file *m,
+					 struct drm_gpuva_manager *mgr)
+{
+	return 0;
+}
 #endif
 
 #endif /* _DRM_DEBUGFS_H_ */
-- 
2.39.0

