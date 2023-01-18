Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22D41C38159
	for <linux-doc@archiver.kernel.org>; Wed, 18 Jan 2023 06:34:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbjARGec (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 18 Jan 2023 01:34:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229789AbjARGZX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Jan 2023 01:25:23 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C66E530F2
        for <linux-doc@vger.kernel.org>; Tue, 17 Jan 2023 22:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674022432;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=THkjWbjdTDoalDkhZzXhw8wgGXeOdJbZJd1kVOay+qU=;
        b=TfbUcEirIv6UTmT0CY2pX1qWiy8cunksye33BLGXJvWsilTuG+tez2BzwqrH/VXvAbebsu
        VKjbopvY2nNLcTTbQFcW+0AtdI+gHhkyQZZd8dNxGdEjIaL+4qJMaBJr5QM4y069mAHs8H
        16x9ZI563G6SROiU+gKQZGg4El9B8Rw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-116-QieWONWRNZayzI-YDtYHGg-1; Wed, 18 Jan 2023 01:13:50 -0500
X-MC-Unique: QieWONWRNZayzI-YDtYHGg-1
Received: by mail-ed1-f71.google.com with SMTP id j10-20020a05640211ca00b0049e385d5830so2715366edw.22
        for <linux-doc@vger.kernel.org>; Tue, 17 Jan 2023 22:13:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=THkjWbjdTDoalDkhZzXhw8wgGXeOdJbZJd1kVOay+qU=;
        b=Z1VDwyPeaH0w+X9MZz84npxV0FYENLA0rAlzHD40Ao8593CwXNuwhhGIu10x9tlGoT
         3eBAsMIsUBjOVzZ/iuQDdwtBmedRhZ6tD7FZ98bLSVXRKZI9ZYgO+uXez55BrEckd+bc
         Ggs0WlEawbesX2DGXPPkRy9edoaPePxoCFHbMr2+Z8LxBUYLpNAeQhHzeT9N/ay3tgCB
         PlJ8Rra699ubhxr0ze/youXg2a/OmU+XMOJwQSKZ1jDgb/l2KGJZeVPv3yITk28lKYf6
         9KnRRgoaaKw8IM3wn4k8mO7TdQphOrcdgb+CVQW4dT5efVy4OjZE/U6u6METMaBfxbWE
         ybWg==
X-Gm-Message-State: AFqh2kpQPsCqbJGhWlypjiKd1A0y1ehOxzjgOduCIj47kiTlYarM9PpR
        hq0TSqEziiMAmDtNRvREL1tvVlfSqeSjkUGjWwVlq8vW2rXZ6Mrdapfg0DuqhANUXCJdccTTNTc
        mjScMZQyuc/bmmBw3lg72
X-Received: by 2002:a17:907:62a8:b0:86a:d385:81df with SMTP id nd40-20020a17090762a800b0086ad38581dfmr8955221ejc.3.1674022428969;
        Tue, 17 Jan 2023 22:13:48 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv8POTKI4k6olZcwo0e0gJ4B/NW0lciBAeJE2/KV3jsK0Dqe+uZfReADyqZ8IOCRKZS+M2fsg==
X-Received: by 2002:a17:907:62a8:b0:86a:d385:81df with SMTP id nd40-20020a17090762a800b0086ad38581dfmr8955202ejc.3.1674022428774;
        Tue, 17 Jan 2023 22:13:48 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id k2-20020a170906970200b0073dbaeb50f6sm13961020ejx.169.2023.01.17.22.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 22:13:48 -0800 (PST)
From:   Danilo Krummrich <dakr@redhat.com>
To:     daniel@ffwll.ch, airlied@redhat.com, christian.koenig@amd.com,
        bskeggs@redhat.com, jason@jlekstrand.net, tzimmermann@suse.de,
        mripard@kernel.org, corbet@lwn.net
Cc:     dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH drm-next 06/14] drm/nouveau: get vmm via nouveau_cli_vmm()
Date:   Wed, 18 Jan 2023 07:12:48 +0100
Message-Id: <20230118061256.2689-7-dakr@redhat.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118061256.2689-1-dakr@redhat.com>
References: <20230118061256.2689-1-dakr@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Provide a getter function for the client's current vmm context. Since
we'll add a new (u)vmm context for UMD bindings in subsequent commits,
this will keep the code clean.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c   | 2 +-
 drivers/gpu/drm/nouveau/nouveau_chan.c | 2 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h  | 9 +++++++++
 drivers/gpu/drm/nouveau/nouveau_gem.c  | 6 +++---
 4 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 335fa91ca4ad..d2b32a47e480 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -204,7 +204,7 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 domain,
 	struct nouveau_drm *drm = cli->drm;
 	struct nouveau_bo *nvbo;
 	struct nvif_mmu *mmu = &cli->mmu;
-	struct nvif_vmm *vmm = cli->svm.cli ? &cli->svm.vmm : &cli->vmm.vmm;
+	struct nvif_vmm *vmm = &nouveau_cli_vmm(cli)->vmm;
 	int i, pi = -1;
 
 	if (!*size) {
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index e648ecd0c1a0..1068abe41024 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -148,7 +148,7 @@ nouveau_channel_prep(struct nouveau_drm *drm, struct nvif_device *device,
 
 	chan->device = device;
 	chan->drm = drm;
-	chan->vmm = cli->svm.cli ? &cli->svm : &cli->vmm;
+	chan->vmm = nouveau_cli_vmm(cli);
 	atomic_set(&chan->killed, 0);
 
 	/* allocate memory for dma push buffer */
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index b5de312a523f..81350e685b50 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -112,6 +112,15 @@ struct nouveau_cli_work {
 	struct dma_fence_cb cb;
 };
 
+static inline struct nouveau_vmm *
+nouveau_cli_vmm(struct nouveau_cli *cli)
+{
+	if (cli->svm.cli)
+		return &cli->svm;
+
+	return &cli->vmm;
+}
+
 void nouveau_cli_work_queue(struct nouveau_cli *, struct dma_fence *,
 			    struct nouveau_cli_work *);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index ac5793c96957..48e6ba00ec27 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -103,7 +103,7 @@ nouveau_gem_object_open(struct drm_gem_object *gem, struct drm_file *file_priv)
 	struct nouveau_bo *nvbo = nouveau_gem_object(gem);
 	struct nouveau_drm *drm = nouveau_bdev(nvbo->bo.bdev);
 	struct device *dev = drm->dev->dev;
-	struct nouveau_vmm *vmm = cli->svm.cli ? &cli->svm : &cli->vmm;
+	struct nouveau_vmm *vmm = nouveau_cli_vmm(cli);
 	struct nouveau_vma *vma;
 	int ret;
 
@@ -180,7 +180,7 @@ nouveau_gem_object_close(struct drm_gem_object *gem, struct drm_file *file_priv)
 	struct nouveau_bo *nvbo = nouveau_gem_object(gem);
 	struct nouveau_drm *drm = nouveau_bdev(nvbo->bo.bdev);
 	struct device *dev = drm->dev->dev;
-	struct nouveau_vmm *vmm = cli->svm.cli ? &cli->svm : & cli->vmm;
+	struct nouveau_vmm *vmm = nouveau_cli_vmm(cli);
 	struct nouveau_vma *vma;
 	int ret;
 
@@ -269,7 +269,7 @@ nouveau_gem_info(struct drm_file *file_priv, struct drm_gem_object *gem,
 {
 	struct nouveau_cli *cli = nouveau_cli(file_priv);
 	struct nouveau_bo *nvbo = nouveau_gem_object(gem);
-	struct nouveau_vmm *vmm = cli->svm.cli ? &cli->svm : &cli->vmm;
+	struct nouveau_vmm *vmm = nouveau_cli_vmm(cli);
 	struct nouveau_vma *vma;
 
 	if (is_power_of_2(nvbo->valid_domains))
-- 
2.39.0

