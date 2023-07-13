Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46ADCC001DD
	for <linux-doc@archiver.kernel.org>; Thu, 13 Jul 2023 17:06:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232398AbjGMRGo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 Jul 2023 13:06:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232589AbjGMRG2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Jul 2023 13:06:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 098002D61
        for <linux-doc@vger.kernel.org>; Thu, 13 Jul 2023 10:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689267935;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VFFV/4pnGfS5xOgVl1lU4W1qf1MMs0lzrapLnGgOEpU=;
        b=VUGGq7noToMFHAf4g7CSdhgaVDjLQ4cCN5gfHxCS/BephD2irGy77eal5EBcndnNrUX134
        HeUlrG1r8EsVGZknLDNKAvbVpsGjuWyJTnw65jpKeutQK40FssF7i7Cde2LDWPBbo4YPVd
        fDC8/GVUzafq+Xhprlyl5TbQU8A2vTk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-2RX5uF5aMhaqbb83YyjD6w-1; Thu, 13 Jul 2023 13:05:32 -0400
X-MC-Unique: 2RX5uF5aMhaqbb83YyjD6w-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-51da39aa6dcso546408a12.2
        for <linux-doc@vger.kernel.org>; Thu, 13 Jul 2023 10:05:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689267930; x=1691859930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VFFV/4pnGfS5xOgVl1lU4W1qf1MMs0lzrapLnGgOEpU=;
        b=ccftqQg3f3XHT6tLCGPTkYlifvNJ0uzyCPl1fwA/ggq+KjO1aVZ+SMLByLLmouiTJq
         F5s8K+EP5EmPWQMiS78IyoYjrqPPUTNTi3DIxxub7x/LyQfGTr20FE33Hu0Z8dQpOmRC
         EiebVPGz7LgJoasrVercmfyIJoqZdgfNXd8KIwcSJ6wOhprToaBZMD4kQxDw1m0jIOdj
         A5n9Lo8MDJAkXGnxKmg8sjGi8zFmeDnQqe03BbHP56rFNVymjyrcly2MKmbVOwwySMVe
         p6GGpzXRCBt6f+wzcYB009rJ6vFZ0EHibXGWTXt7l6qWTJOHiDkBfIBA58FNpbD+k/kv
         7H0g==
X-Gm-Message-State: ABy/qLYdvM09SsazoputqUC8jWGHJHjylNF60n46SFoHGQsXPDOdyWZ8
        WtW1QPzewYPUjKNO5H4Kn0QmWZokOnr5+wjWk6s1coDLLl387VXTz8TRyAwzv/C4G5NYr6nKIQn
        UTjDdkQCvO/zjldLYT1Zr
X-Received: by 2002:aa7:c58c:0:b0:51e:f83:6de3 with SMTP id g12-20020aa7c58c000000b0051e0f836de3mr1913963edq.17.1689267930200;
        Thu, 13 Jul 2023 10:05:30 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEODGUrLe1vVHHn6APTyXlr4bMpDbQMD9jG5zlz4/cZihCoEP2XZYalZE9CagIk64p3fS6wOA==
X-Received: by 2002:aa7:c58c:0:b0:51e:f83:6de3 with SMTP id g12-20020aa7c58c000000b0051e0f836de3mr1913942edq.17.1689267929984;
        Thu, 13 Jul 2023 10:05:29 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id n7-20020aa7c447000000b0051e22660835sm4557121edr.46.2023.07.13.10.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 10:05:29 -0700 (PDT)
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
Subject: [PATCH drm-next v7 13/13] drm/nouveau: debugfs: implement DRM GPU VA debugfs
Date:   Thu, 13 Jul 2023 19:04:08 +0200
Message-ID: <20230713170429.2964-14-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713170429.2964-1-dakr@redhat.com>
References: <20230713170429.2964-1-dakr@redhat.com>
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

