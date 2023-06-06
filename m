Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CF6EC7EE2F
	for <linux-doc@archiver.kernel.org>; Tue,  6 Jun 2023 22:32:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239917AbjFFWcw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Jun 2023 18:32:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239908AbjFFWct (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Jun 2023 18:32:49 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 565AF10FF
        for <linux-doc@vger.kernel.org>; Tue,  6 Jun 2023 15:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686090717;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VAsnh4By1Dlsxa7yVRPYZeW4lQVXq7K2JYovOcCMg38=;
        b=ax1HzVi9ci/HGfCdduMBVX5qkpZn8jabonWooRcoi0K1+IS4aNGWHwX0M5NQy05k6k1t2G
        0T4zEg630NVwh13sqhKtcEURWuvR2PV9P1EB81r0oEuKvDzGaKjYc5R7bpkSHIPM3Ga0v/
        YuoTKU4Ox3+R3F05C1teI3uoHv22fH4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-_V5khKO1PoWZlGMmq4evGw-1; Tue, 06 Jun 2023 18:31:55 -0400
X-MC-Unique: _V5khKO1PoWZlGMmq4evGw-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-977e50b0120so215575566b.0
        for <linux-doc@vger.kernel.org>; Tue, 06 Jun 2023 15:31:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686090714; x=1688682714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VAsnh4By1Dlsxa7yVRPYZeW4lQVXq7K2JYovOcCMg38=;
        b=Wt5hOip4W5MlD1+VwNpl/qviKwEIkTDozT5wHzeC0uYdLQoqsrgKL2sAanrrlALO9c
         h7z4TzKRjhLFkNzuAZ5RQYsauNXarfCZJU43cqISFqvnSFgIh+1UY0AS60i3rDzlmg68
         b1B3oMBYHgrHaq5h6LcUWYR2xV91WFILsvp5Agb8pMV/QRzxXKwtUFIC5Bti74ZcgGNt
         P+xbmfWB3UU0XGNwoB52p2EKgAYwM1qESEjklPiQFoO6DzGAtsiILjUyiGWcxk9H/w+6
         vf3a3XBwPxJ3BGHYpSOvvML5NJKZcTLkCahi+NLmUfWUoJLshzAycbB+Yt5Jmsj0WpuV
         tvMw==
X-Gm-Message-State: AC+VfDzOexr1mQFr6UEp1pi3HZ9xT9g28lOoVvX/MdOG5Ajlni8lMG65
        9Rm898TFk7gbLbeXkUi832JiziCp29otiU/VzTf4WXtvgrHpLuUrkA9pxpKkSg9QSfYAVpATUO1
        7/SXrWsYLWPp1hR5DQRXU
X-Received: by 2002:a17:906:730c:b0:969:813c:9868 with SMTP id di12-20020a170906730c00b00969813c9868mr3689636ejc.18.1686090714330;
        Tue, 06 Jun 2023 15:31:54 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ677sOlaIwttOdE/90cuoOF1xZWIzUBuXOFYJoKysNMAktXkCW6HXQIjOMQ54Ai2DrC/3Y3CA==
X-Received: by 2002:a17:906:730c:b0:969:813c:9868 with SMTP id di12-20020a170906730c00b00969813c9868mr3689629ejc.18.1686090714181;
        Tue, 06 Jun 2023 15:31:54 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id dc19-20020a170906c7d300b0096efd44dbffsm6037894ejb.105.2023.06.06.15.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 15:31:53 -0700 (PDT)
From:   Danilo Krummrich <dakr@redhat.com>
To:     airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
        mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
        bskeggs@redhat.com, Liam.Howlett@oracle.com,
        matthew.brost@intel.com, boris.brezillon@collabora.com,
        alexdeucher@gmail.com, ogabbay@kernel.org, bagasdotme@gmail.com,
        willy@infradead.org, jason@jlekstrand.net
Cc:     dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH drm-next v4 04/14] drm: debugfs: provide infrastructure to dump a DRM GPU VA space
Date:   Wed,  7 Jun 2023 00:31:20 +0200
Message-Id: <20230606223130.6132-5-dakr@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606223130.6132-1-dakr@redhat.com>
References: <20230606223130.6132-1-dakr@redhat.com>
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
 drivers/gpu/drm/drm_debugfs.c | 41 +++++++++++++++++++++++++++++++++++
 include/drm/drm_debugfs.h     | 25 +++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 4855230ba2c6..82180fb1c200 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -39,6 +39,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_gpuva_mgr.h>
 
 #include "drm_crtc_internal.h"
 #include "drm_internal.h"
@@ -175,6 +176,46 @@ static const struct file_operations drm_debugfs_fops = {
 	.release = single_release,
 };
 
+/**
+ * drm_debugfs_gpuva_info - dump the given DRM GPU VA space
+ * @m: pointer to the &seq_file to write
+ * @mgr: the &drm_gpuva_manager representing the GPU VA space
+ *
+ * Dumps the GPU VA mappings of a given DRM GPU VA manager.
+ *
+ * For each DRM GPU VA space drivers should call this function from their
+ * &drm_info_list's show callback.
+ *
+ * Returns: 0 on success, -ENODEV if the &mgr is not initialized
+ */
+int drm_debugfs_gpuva_info(struct seq_file *m,
+			   struct drm_gpuva_manager *mgr)
+{
+	DRM_GPUVA_ITER(it, mgr, 0);
+	struct drm_gpuva *va, *kva = &mgr->kernel_alloc_node;
+
+	if (!mgr->name)
+		return -ENODEV;
+
+	seq_printf(m, "DRM GPU VA space (%s) [0x%016llx;0x%016llx]\n",
+		   mgr->name, mgr->mm_start, mgr->mm_start + mgr->mm_range);
+	seq_printf(m, "Kernel reserved node [0x%016llx;0x%016llx]\n",
+		   kva->va.addr, kva->va.addr + kva->va.range);
+	seq_puts(m, "\n");
+	seq_puts(m, " VAs | start              | range              | end                | object             | object offset\n");
+	seq_puts(m, "-------------------------------------------------------------------------------------------------------------\n");
+	drm_gpuva_iter_for_each(va, it) {
+		if (unlikely(va == &mgr->kernel_alloc_node))
+			continue;
+
+		seq_printf(m, "     | 0x%016llx | 0x%016llx | 0x%016llx | 0x%016llx | 0x%016llx\n",
+			   va->va.addr, va->va.range, va->va.addr + va->va.range,
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
2.40.1

