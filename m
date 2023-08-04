Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5647CC001DF
	for <linux-doc@archiver.kernel.org>; Fri,  4 Aug 2023 18:27:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231153AbjHDS1g (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 4 Aug 2023 14:27:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231402AbjHDS0Q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Aug 2023 14:26:16 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FDA24C22
        for <linux-doc@vger.kernel.org>; Fri,  4 Aug 2023 11:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691173511;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Fdvxi7T0QQZA7DILvp9xTFYkELtQTf+gq8ZCaeS7cjM=;
        b=LTKPd062QT+mWG3vQDnjqnNrfJTffEA6wK9Bks0zGVEse/g9tonJQTAylpfm8e//Z9APdU
        H2H55tm0dqRYHb2p5N+/vKqxRB0N57bsCIy4871oPDp25BBsuNxmF6UPjNShcTuLEc+9hf
        IkiYMsraKbdpviMLpJjrSPKgqKrd/jM=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-79-fVmk3psxOPGBSS3GJM23SA-1; Fri, 04 Aug 2023 14:25:08 -0400
X-MC-Unique: fVmk3psxOPGBSS3GJM23SA-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-4fe21fda5e3so2402485e87.0
        for <linux-doc@vger.kernel.org>; Fri, 04 Aug 2023 11:25:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691173507; x=1691778307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fdvxi7T0QQZA7DILvp9xTFYkELtQTf+gq8ZCaeS7cjM=;
        b=VHRws119wlO2RGMGp9zzsGWp/GFgYSRUA/Jsdyoxwi52E3h4Be6kP8rC4OfA/uEMgY
         jyNzZOsFhEFyQlCn7id19EkdwvtH+hrquEyMdeMpwkOZCfzntBHZ9ej0etwqq5jB+55m
         2Wrc3L93SrTK20fzg5+plTpWK4MSf5m2FqpduqJrwONwiC/imci3U8N57kepmdinOiPy
         CO8YPwyv0O6RvRlXDNPb9aVllfjkXNR94lleC1COQ/oWz4CKVehV1wRhrptV/IjwmHo3
         ka2vn0v4ukJNKmHWgPohIyKhQYNhR1TDb4+hOs7zKOZNSun3MtQ14YoC4EUm48UtBwI2
         noLA==
X-Gm-Message-State: AOJu0Yx1jWX4EKk+BGBvURuk4+Pz87GF6JzoQ1lZ7KM16isAxg8E9Gns
        I5l61/g0L/YlyJRmKH+iJrXJPznvsVXU1Tpfmh4n4hm7Iy0bFFt4qeIOUexRRriG9S2Q1CcYOP6
        l08aiWO1PQ6Za+jmUL56A
X-Received: by 2002:ac2:4e8c:0:b0:4fb:7666:3bbf with SMTP id o12-20020ac24e8c000000b004fb76663bbfmr1856021lfr.26.1691173507139;
        Fri, 04 Aug 2023 11:25:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRJJOgbOvJzg5RaLcCj6w1yIpUQozrGAJ91MHogx2h+oZXIcVyODrY21YmNH8oxYAKETecWA==
X-Received: by 2002:ac2:4e8c:0:b0:4fb:7666:3bbf with SMTP id o12-20020ac24e8c000000b004fb76663bbfmr1856008lfr.26.1691173506953;
        Fri, 04 Aug 2023 11:25:06 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id u15-20020a056402064f00b00523228f615dsm486979edx.88.2023.08.04.11.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 11:25:06 -0700 (PDT)
From:   Danilo Krummrich <dakr@redhat.com>
To:     airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
        mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
        bskeggs@redhat.com, Liam.Howlett@oracle.com,
        matthew.brost@intel.com, boris.brezillon@collabora.com,
        alexdeucher@gmail.com, ogabbay@kernel.org, bagasdotme@gmail.com,
        willy@infradead.org, jason@jlekstrand.net, donald.robson@imgtec.com
Cc:     dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Danilo Krummrich <dakr@redhat.com>,
        Dave Airlie <airlied@redhat.com>
Subject: [PATCH drm-misc-next v10 12/12] drm/nouveau: debugfs: implement DRM GPU VA debugfs
Date:   Fri,  4 Aug 2023 20:23:52 +0200
Message-ID: <20230804182406.5222-13-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230804182406.5222-1-dakr@redhat.com>
References: <20230804182406.5222-1-dakr@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Provide the driver indirection iterating over all DRM GPU VA spaces to
enable the common 'gpuvas' debugfs file for dumping DRM GPU VA spaces.

Reviewed-by: Dave Airlie <airlied@redhat.com>
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

