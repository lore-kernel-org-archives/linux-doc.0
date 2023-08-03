Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1564CEB64DD
	for <linux-doc@archiver.kernel.org>; Thu,  3 Aug 2023 16:54:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235019AbjHCQym (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 3 Aug 2023 12:54:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234997AbjHCQyf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Aug 2023 12:54:35 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 894072137
        for <linux-doc@vger.kernel.org>; Thu,  3 Aug 2023 09:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691081619;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VFFV/4pnGfS5xOgVl1lU4W1qf1MMs0lzrapLnGgOEpU=;
        b=LdGPXLSdTiOGBtGJKmegOqhGiBq4G2DWD61s2sKcAm8e33mznL8NckfBSgE6YqHdBiAzL0
        66bwUmJD/BEJ35UGIoVmm3aY3aiPSbDGlLZ6bqlVPlj5Mj6h08dcssT1UZ/7EGgpPGlgJI
        hZ0B8QpEk7lP8SWOVyt5szx5PS68/HA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-265-QbH_1qKAOoKGjggYQubp7g-1; Thu, 03 Aug 2023 12:53:38 -0400
X-MC-Unique: QbH_1qKAOoKGjggYQubp7g-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-99bcb13d8ddso78467166b.0
        for <linux-doc@vger.kernel.org>; Thu, 03 Aug 2023 09:53:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691081617; x=1691686417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VFFV/4pnGfS5xOgVl1lU4W1qf1MMs0lzrapLnGgOEpU=;
        b=HMJBj8f6cOwkKpbQ9QSK+fsv8zc3i/ttba/pkHLf9SzaPGSYUXf3d77yUu8o3zv+nI
         ZxqtIHflXRBM5sVY9e8cTWq0ZVW4Vf2kjyByFje4nnoM/DEECWVNmT1iqYDV9wQlr/JZ
         ZfflHnNj6g4XmUsGEFWCjJEErmqTvSq5DtJiHppnpeUTevdaGwWogwiImwJFYj4xuSXy
         Ps+Oe8t2sNQD1E9SmDgh0izi+VmBNfVxgLVXw+QtNhNSDS5YaowuNWhIO3Sk5/hEJHZX
         3seyoNKATgoHE2E5vFw5AbZu/GMy+7lK1NwADa5xfzJOr8oq2dRAUtRZmI3UpTGEkVAz
         juoA==
X-Gm-Message-State: ABy/qLa1pUFj5Z8YTK5hxzCSu53mvn5NytBK3WqrUFQBkzwAC3CAQbcM
        4C84vXTIox04JKuiYPQZ2WoykmBCgWihBkbq6fQ6cieOA3QIZIkpXBeDBwGRQLUAoF1/tRfLSNM
        n3VMdSnqfK7AcSX9d66C6
X-Received: by 2002:a17:906:31d4:b0:96a:63d4:24c5 with SMTP id f20-20020a17090631d400b0096a63d424c5mr7038414ejf.77.1691081617375;
        Thu, 03 Aug 2023 09:53:37 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHRH5ZgjJkQUxJJ+58qKoKTsSHT7S3XigxFOpDntBBMZ19xjhCROTsTFx3KOVVIwi5BUR2bOg==
X-Received: by 2002:a17:906:31d4:b0:96a:63d4:24c5 with SMTP id f20-20020a17090631d400b0096a63d424c5mr7038393ejf.77.1691081617197;
        Thu, 03 Aug 2023 09:53:37 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id f18-20020a1709064dd200b00991bba473e1sm73096ejw.3.2023.08.03.09.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 09:53:36 -0700 (PDT)
From:   Danilo Krummrich <dakr@redhat.com>
To:     airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
        mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
        bskeggs@redhat.com, Liam.Howlett@oracle.com,
        matthew.brost@intel.com, boris.brezillon@collabora.com,
        alexdeucher@gmail.com, ogabbay@kernel.org, bagasdotme@gmail.com,
        willy@infradead.org, jason@jlekstrand.net, donald.robson@imgtec.com
Cc:     dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH drm-misc-next v9 11/11] drm/nouveau: debugfs: implement DRM GPU VA debugfs
Date:   Thu,  3 Aug 2023 18:52:30 +0200
Message-ID: <20230803165238.8798-12-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803165238.8798-1-dakr@redhat.com>
References: <20230803165238.8798-1-dakr@redhat.com>
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

