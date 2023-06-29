Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE4FEB64D9
	for <linux-doc@archiver.kernel.org>; Thu, 29 Jun 2023 22:29:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232234AbjF2W3r (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Jun 2023 18:29:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232206AbjF2W3N (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Jun 2023 18:29:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4892F3A88
        for <linux-doc@vger.kernel.org>; Thu, 29 Jun 2023 15:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688077673;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VFFV/4pnGfS5xOgVl1lU4W1qf1MMs0lzrapLnGgOEpU=;
        b=QOe/kSWHa1KAhC5cFXz4CU4t6nSGIzKzeiRrmhMk3Cj844psaD9wepZbGHXgRIZxOUiQpb
        iQWajvkN7uQYItXcvZoMSyM67EB8y/yjlH6YfMtyBx0OXJQ99JYq5P7oXu2sp2jFa1hdu6
        5EssJnIJHEpZxEK3NbQCftjT1PnXfqY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-531-rrmhLZTlMJWTCAi3AuFlgg-1; Thu, 29 Jun 2023 18:27:52 -0400
X-MC-Unique: rrmhLZTlMJWTCAi3AuFlgg-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-3f9bef91aa4so7208735e9.3
        for <linux-doc@vger.kernel.org>; Thu, 29 Jun 2023 15:27:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688077671; x=1690669671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VFFV/4pnGfS5xOgVl1lU4W1qf1MMs0lzrapLnGgOEpU=;
        b=IzryLMhBWfWasTttqAJ7GKGrOAiX9CPQTJhsj41So6+okcX16GgXVfiU/KylCGJq1T
         VYSpd7stdgcM8eahP2WIFH6Ah/G0k1a69ccuNTsKLLwyDZ8tJrVbfCX5vVMpWlvilNk9
         KkdPOEbS0YDAdTcqSgKZs5iVBDQ+c58CXV20/xonY9KVCrGaBtedeM9OvRruJUbTWw6Y
         nMqlLo97pxGfJy1JX8xyGPhJAl1bEOTcvErg+xHX6qVXkQ/z66totSEJRY4ETFhu4XzB
         Xcpn6ZeDi7+umFjkJvHo4WymS9NOEEGT8/AHXRHztqF8h/SmCAxTXZGqDtHaHz1OAlTr
         IlAg==
X-Gm-Message-State: AC+VfDwIauhpW7xQVdkI/JztC6Hf6ZVo+L1NDNPgWRjTjgMU362bMHY0
        V1AZEUiPDBMTJpa2hNEHbsT+pfhVa54V3wvGbg1ngqUb+chXrHTPa79AUK+rpLU5BI73F5CtFpp
        /5Zkd99Mok3YfPQqyd8Av
X-Received: by 2002:a1c:7918:0:b0:3fa:abd8:fcc4 with SMTP id l24-20020a1c7918000000b003faabd8fcc4mr550307wme.35.1688077671212;
        Thu, 29 Jun 2023 15:27:51 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6Bxj2O4VX+ANE4bPO+hAqfIWGrOSWlNPHwSQm4+DaMqibvET6swHf0UksZ5J5oprSJ2UE6LQ==
X-Received: by 2002:a1c:7918:0:b0:3fa:abd8:fcc4 with SMTP id l24-20020a1c7918000000b003faabd8fcc4mr550301wme.35.1688077671037;
        Thu, 29 Jun 2023 15:27:51 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id p23-20020a1c7417000000b003f9b0f640b1sm17419090wmc.22.2023.06.29.15.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 15:27:50 -0700 (PDT)
From:   Danilo Krummrich <dakr@redhat.com>
To:     airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
        mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
        bskeggs@redhat.com, Liam.Howlett@oracle.com,
        matthew.brost@intel.com, boris.brezillon@collabora.com,
        alexdeucher@gmail.com, ogabbay@kernel.org, bagasdotme@gmail.com,
        willy@infradead.org, jason@jlekstrand.net
Cc:     dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH drm-next v6 13/13] drm/nouveau: debugfs: implement DRM GPU VA debugfs
Date:   Fri, 30 Jun 2023 00:25:29 +0200
Message-ID: <20230629222651.3196-14-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230629222651.3196-1-dakr@redhat.com>
References: <20230629222651.3196-1-dakr@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Provide the driver indirection iterating over all DRM GPU VA spaces to
enable the common 'gpuvas' debugfs file for dumping DRM GPU VA spaces.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_debugfs.c | 39 +++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
index 99d022a91afc..053f703f2f68 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -203,6 +203,44 @@ nouveau_debugfs_pstate_open(struct inode *inode, struct file *file)
 	return single_open(file, nouveau_debugfs_pstate_get, inode->i_private);
 }
 
+static void
+nouveau_debugfs_gpuva_regions(struct seq_file *m, struct nouveau_uvmm *uvmm)
+{
+	MA_STATE(mas, &uvmm->region_mt, 0, 0);
+	struct nouveau_uvma_region *reg;
+
+	seq_puts  (m, " VA regions  | start              | range              | end                \n");
+	seq_puts  (m, "----------------------------------------------------------------------------\n");
+	mas_for_each(&mas, reg, ULONG_MAX)
+		seq_printf(m, "             | 0x%016llx | 0x%016llx | 0x%016llx\n",
+			   reg->va.addr, reg->va.range, reg->va.addr + reg->va.range);
+}
+
+static int
+nouveau_debugfs_gpuva(struct seq_file *m, void *data)
+{
+	struct drm_info_node *node = (struct drm_info_node *) m->private;
+	struct nouveau_drm *drm = nouveau_drm(node->minor->dev);
+	struct nouveau_cli *cli;
+
+	mutex_lock(&drm->clients_lock);
+	list_for_each_entry(cli, &drm->clients, head) {
+		struct nouveau_uvmm *uvmm = nouveau_cli_uvmm(cli);
+
+		if (!uvmm)
+			continue;
+
+		nouveau_uvmm_lock(uvmm);
+		drm_debugfs_gpuva_info(m, &uvmm->umgr);
+		seq_puts(m, "\n");
+		nouveau_debugfs_gpuva_regions(m, uvmm);
+		nouveau_uvmm_unlock(uvmm);
+	}
+	mutex_unlock(&drm->clients_lock);
+
+	return 0;
+}
+
 static const struct file_operations nouveau_pstate_fops = {
 	.owner = THIS_MODULE,
 	.open = nouveau_debugfs_pstate_open,
@@ -214,6 +252,7 @@ static const struct file_operations nouveau_pstate_fops = {
 static struct drm_info_list nouveau_debugfs_list[] = {
 	{ "vbios.rom",  nouveau_debugfs_vbios_image, 0, NULL },
 	{ "strap_peek", nouveau_debugfs_strap_peek, 0, NULL },
+	DRM_DEBUGFS_GPUVA_INFO(nouveau_debugfs_gpuva, NULL),
 };
 #define NOUVEAU_DEBUGFS_ENTRIES ARRAY_SIZE(nouveau_debugfs_list)
 
-- 
2.41.0

