Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73551C0015E
	for <linux-doc@archiver.kernel.org>; Thu, 20 Jul 2023 00:17:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229937AbjGTARF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 19 Jul 2023 20:17:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbjGTAQr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 Jul 2023 20:16:47 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC3CF2137
        for <linux-doc@vger.kernel.org>; Wed, 19 Jul 2023 17:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689812154;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VFFV/4pnGfS5xOgVl1lU4W1qf1MMs0lzrapLnGgOEpU=;
        b=BDBP82xjwmiGTuEIBmQ1THUYZdF4+ps0Q1fERq8lkZlWSwZBVcF4MJV9vI9fz6/E0c/BqP
        lv2jwMoSQQ52Sozz/B3Q1tGmv2GUzUtrAv1e6WNGqlcZ7xltmbbuS1vJ5k8ka07G4A3iC9
        yEl9fznol8dyIIu05X3C85a/PTRI6Fk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-602-8dmHB05wN-yBm9c6r00ixg-1; Wed, 19 Jul 2023 20:15:49 -0400
X-MC-Unique: 8dmHB05wN-yBm9c6r00ixg-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-993eeb3a950so14914566b.2
        for <linux-doc@vger.kernel.org>; Wed, 19 Jul 2023 17:15:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689812148; x=1692404148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VFFV/4pnGfS5xOgVl1lU4W1qf1MMs0lzrapLnGgOEpU=;
        b=MtjgdVulNUY2FYAik+Gn0/nEQJv3HAHZaHeIywTrGoRZ9iBy41m+qYVD7EtUHeiFl9
         OKHnQDTm991HX0GpqgXCmfpssOMPH12J9HWb1bGeQcFjtgqYWO123jMgc+VaS/dFpxTm
         73Tr5hqozfUMW02UBkAnzfWUE8JL5rEuZr1I/EJG5Ci3IJBd6Zji+8m6iERIen9N2/mj
         lV3MboWm3O2d9JmU//P1GYOxr7xNzhK9I0/iCdawckeQRl+Yi7LMX419xuzO3+0BnMtv
         Cri0ixk2envqxkfDcQnxBYl0jmKwczJ0phWKm7ftpjAu/Us3D4m1615CqF0/o/uU4M/L
         ixJQ==
X-Gm-Message-State: ABy/qLZ2NCzm2f4TTvpStlOyqGPoneoABdlyUBViWnfYwvLTqv71SnBd
        0nslswjoUrqTYX8qv4rfCMm2+eIam9FRtI9YGevNJu2fHVAYhwOS1jalUMj4tffeHnCGbuC/mPl
        kH/p4lJFe/kGUBr3EJGy+
X-Received: by 2002:a17:906:77cd:b0:993:f2c2:750b with SMTP id m13-20020a17090677cd00b00993f2c2750bmr3700350ejn.17.1689812148709;
        Wed, 19 Jul 2023 17:15:48 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFzOuzg80y3Uq2LukZtvD62EiHLsA7vDYQLnsDf52HmHve2LBpBPIr9ba/hVWknmAApd73phg==
X-Received: by 2002:a17:906:77cd:b0:993:f2c2:750b with SMTP id m13-20020a17090677cd00b00993f2c2750bmr3700343ejn.17.1689812148501;
        Wed, 19 Jul 2023 17:15:48 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id i10-20020a170906a28a00b00997d7aa59fasm3077515ejz.14.2023.07.19.17.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 17:15:47 -0700 (PDT)
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
Subject: [PATCH drm-misc-next v8 12/12] drm/nouveau: debugfs: implement DRM GPU VA debugfs
Date:   Thu, 20 Jul 2023 02:14:33 +0200
Message-ID: <20230720001443.2380-13-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230720001443.2380-1-dakr@redhat.com>
References: <20230720001443.2380-1-dakr@redhat.com>
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

