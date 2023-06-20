Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAD24EB64DB
	for <linux-doc@archiver.kernel.org>; Tue, 20 Jun 2023 00:44:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229820AbjFTAoz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Jun 2023 20:44:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbjFTAos (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Jun 2023 20:44:48 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96388E7C
        for <linux-doc@vger.kernel.org>; Mon, 19 Jun 2023 17:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687221817;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=a7jCgjA/GeF+vfePBjhGpS1KJtr0QbtMbF11c3DSw0c=;
        b=XDPWRI5r/YxqMw77LpKpVWDNaDMJgODj8tNPjnF3U8n9cy7rJtdGB2UmL62p5GILdNu8Dl
        z6UYQzk1nPz0QzWPI3kAwYCu7cUEAoHNLK76xaQISXuThkchMfooirv1QdZdZrMyCWB/MF
        QuinLSqfmX25Gj6bzJeNy3TGihFQOK0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-aPpV0yT0OQmfeTlmWBiyvA-1; Mon, 19 Jun 2023 20:43:36 -0400
X-MC-Unique: aPpV0yT0OQmfeTlmWBiyvA-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-51bca893729so77002a12.1
        for <linux-doc@vger.kernel.org>; Mon, 19 Jun 2023 17:43:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687221815; x=1689813815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a7jCgjA/GeF+vfePBjhGpS1KJtr0QbtMbF11c3DSw0c=;
        b=HPnSF4cKQLtqn/bu3BrLO1by3LcBj9hK/r9Mqrmy1Uib98xgE5CCKc4CBg47sQ1KCH
         UCsrvsQUvaW6OpTtdGUm+FwOKAF6oB17v0EkEWQ5/gNkw7E3dFv3KxDRm96V02paSdNB
         hke923+QwLkFpc7kbq05TueQQa/tRo/iM2L81qks94NdHfe8BiccsbgNOrXiGyWL7qBZ
         lq5AymoC8KsVmR9/IJB05NsWkGns/PP1Rp9qKe1rcnkNKJd0eCNnTxpg0BQNJAF0L72A
         vPKH4G+qQvofZ6WfC3/W2TIOEjXIvPk7XJHlnfjy93ogyGgoI+RkhKZQXMtTE+1eSV55
         a7qg==
X-Gm-Message-State: AC+VfDwlt+ci0yop1LXE+gEZiUUtaYVNwdt8glWxMThN41nHTMywo/l8
        Rx8QUTFgH7vnsAJnweyhM0SIViAANqdcbhBm1c868tGISRTrLeTruyOPCWl2wYuVQ+zj7A4LvsO
        OcP/O2iNZfxc8j44+ldxF
X-Received: by 2002:a17:907:16a2:b0:977:4b68:bf2 with SMTP id hc34-20020a17090716a200b009774b680bf2mr9258865ejc.54.1687221815361;
        Mon, 19 Jun 2023 17:43:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5q+6yQrxXHN5sb4rpMGvKSpAc2GEIwMGMC//JzmRysYg1+0tvGxqivxz5K0CNgMJjmvWb+Bw==
X-Received: by 2002:a17:907:16a2:b0:977:4b68:bf2 with SMTP id hc34-20020a17090716a200b009774b680bf2mr9258842ejc.54.1687221815070;
        Mon, 19 Jun 2023 17:43:35 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id bk6-20020a170906b0c600b0098748422178sm393480ejb.56.2023.06.19.17.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 17:43:34 -0700 (PDT)
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
Subject: [PATCH drm-next v5 14/14] drm/nouveau: debugfs: implement DRM GPU VA debugfs
Date:   Tue, 20 Jun 2023 02:42:17 +0200
Message-Id: <20230620004217.4700-15-dakr@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230620004217.4700-1-dakr@redhat.com>
References: <20230620004217.4700-1-dakr@redhat.com>
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
2.40.1

