Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89113C7EE2F
	for <linux-doc@archiver.kernel.org>; Tue,  6 Jun 2023 22:34:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240056AbjFFWeP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Jun 2023 18:34:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240030AbjFFWdg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Jun 2023 18:33:36 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9B4419AD
        for <linux-doc@vger.kernel.org>; Tue,  6 Jun 2023 15:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686090761;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=a7jCgjA/GeF+vfePBjhGpS1KJtr0QbtMbF11c3DSw0c=;
        b=K4DzI+iFI82Qme43PPXajcn2iQjI1mV/FOIJ/50u4YTneUlnAcVcnOMow9oARWR/bYe35U
        sQJt3djJ2Enu2QORBkJfkmnFDkJ1a7AwzSz+KzPYWZA2GPBvFjuGcWTHAsIUN9Wu6KAUG0
        9hpZ0gdjURuebOF4uaPDohNkI64XoP8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-q1aTwG6tPLykFjIbaTI61g-1; Tue, 06 Jun 2023 18:32:40 -0400
X-MC-Unique: q1aTwG6tPLykFjIbaTI61g-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-94f7a2b21fdso595692766b.2
        for <linux-doc@vger.kernel.org>; Tue, 06 Jun 2023 15:32:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686090759; x=1688682759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a7jCgjA/GeF+vfePBjhGpS1KJtr0QbtMbF11c3DSw0c=;
        b=e/EO7dkW1bKT4JUvZZ9R3Ioj13iiaddXx/fYfY8Du1AKzjecQIXfDrCrSbk5qOB0Sf
         HYu37vUgI+Tlrn2GSAu6sqyYsl7JSqzzIaAN5BPhULIjLneZ97kIjiMG6GrlVhCgswgz
         llGXJG5VY+u28Kd1VNEQdnFLxHU/DgQjqVHEQzGpEHXr/1CeIkfHaFuReR50mlcQGuWY
         mP3JyFXew8Jgt4bmdiV5Ate8UnVixd4R3390772gMZX6cUdMnD0JxKsbmiFePHOWVuBX
         HdPBuaNqiUM/8uT9ip72OohlZcJvfWKUKta5K85SKZeAwdsBzx4USSDvIXuOo2WAR4mf
         ZygA==
X-Gm-Message-State: AC+VfDzE2nqhP2OPmLM38HXell+W/brgXpLvQE/5kiykHPHpK0ylod0w
        npRHT3yKCdNtgEzQfns7mOdFA3wca+0oodc/8fiTWWOUc42F2asvj4GpYq4rMmeu+HATVfw7UBj
        hXE+GQOiTG3QybZPNm1xY
X-Received: by 2002:a17:907:961c:b0:96f:f046:9a92 with SMTP id gb28-20020a170907961c00b0096ff0469a92mr4529867ejc.37.1686090759334;
        Tue, 06 Jun 2023 15:32:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6qGlpc03YEG/CcUcMQBwrK3ZBv0I8EcaoURRio7MIi2slO/uki0F3KmJyflgj5wBFLEUnEiA==
X-Received: by 2002:a17:907:961c:b0:96f:f046:9a92 with SMTP id gb28-20020a170907961c00b0096ff0469a92mr4529834ejc.37.1686090759142;
        Tue, 06 Jun 2023 15:32:39 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id g9-20020a1709063b0900b00969e9fef151sm6051554ejf.97.2023.06.06.15.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 15:32:38 -0700 (PDT)
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
Subject: [PATCH drm-next v4 14/14] drm/nouveau: debugfs: implement DRM GPU VA debugfs
Date:   Wed,  7 Jun 2023 00:31:30 +0200
Message-Id: <20230606223130.6132-15-dakr@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606223130.6132-1-dakr@redhat.com>
References: <20230606223130.6132-1-dakr@redhat.com>
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

