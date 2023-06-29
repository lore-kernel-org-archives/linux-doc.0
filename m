Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03318EB64DD
	for <linux-doc@archiver.kernel.org>; Thu, 29 Jun 2023 22:29:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231888AbjF2W3C (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Jun 2023 18:29:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231946AbjF2W2q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Jun 2023 18:28:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E3113585
        for <linux-doc@vger.kernel.org>; Thu, 29 Jun 2023 15:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688077642;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DNvPFmPephzOlef4HOM2AR90BUKB3CUNAq245FGhm7Y=;
        b=ci6CngYNkiS6Qw6W1TrMxdoi14Jnt4LNK6lgklzTjMc9UAXzcWkirEKZLwbMD3ePJ2Hl4/
        zOsd3T5BEzuqvUpamFs1gOkaduNUf/MjYKx0dHK2t32kvWlT/fu4UTTt9/OSzDnnPVlTVm
        3VogJw1jA8thzjB90x96/tqkSZxPtqM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-NVn7zannM96MZ8BJOYyYoQ-1; Thu, 29 Jun 2023 18:27:21 -0400
X-MC-Unique: NVn7zannM96MZ8BJOYyYoQ-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-313e6020882so505043f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 29 Jun 2023 15:27:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688077640; x=1690669640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DNvPFmPephzOlef4HOM2AR90BUKB3CUNAq245FGhm7Y=;
        b=GxMMwcciPzZTXmSvsyLFyqAjPcIwe/xkepxSINq3ASNx1rktg0TduNX8QPFPjgc1oX
         EQ/x+jaqfmItwIR3XdIC6B/0pXAYFGEgsN4FDBH2zIZ8Cv9RasW+YMNXr66Or4RZ4B6o
         Plcfu48qPlMYTFCrDX19qa43hNyBIpi/xItnr/EaLDyK74Q8M4vC0EVOwmH1YEjaqiuR
         TfZoiDy5rrxd1y1wKjb/kqBgtIjjJcuSAEzmUSqS5VH5P23Hm1+YXnOLjfAzjmbp/mW1
         dXUJ/7osRqT6fmpAPut/Jqq1Fd5S9lVaO++Slun/KN3to9sqHJfwGvRtmMGGE6P8P+wS
         mTFA==
X-Gm-Message-State: ABy/qLZ0WKshTNccJnz4yMjTlLxjierByni59p8Tbj10NTjO40TN34Og
        m1ZbLQR7o2skn/r32diBIUfuEho4XhOMxbkhidSjdZUEe+CdN5JGvHlX8Elrte5yWm5NHymZkQa
        D9PrByqP8uKP1OjtXBOBN
X-Received: by 2002:adf:f84a:0:b0:314:140a:e629 with SMTP id d10-20020adff84a000000b00314140ae629mr3559380wrq.7.1688077640122;
        Thu, 29 Jun 2023 15:27:20 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHCZs9xr20FMLyVq4Gu0EbxKYNIg8D4qKHFA+knn7g08hIzhcHvkv58NWuWzNuDsbDCkU7M8g==
X-Received: by 2002:adf:f84a:0:b0:314:140a:e629 with SMTP id d10-20020adff84a000000b00314140ae629mr3559357wrq.7.1688077639880;
        Thu, 29 Jun 2023 15:27:19 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id u12-20020adfdd4c000000b0030903d44dbcsm16876347wrm.33.2023.06.29.15.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 15:27:19 -0700 (PDT)
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
Subject: [PATCH drm-next v6 05/13] drm/nouveau: get vmm via nouveau_cli_vmm()
Date:   Fri, 30 Jun 2023 00:25:21 +0200
Message-ID: <20230629222651.3196-6-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230629222651.3196-1-dakr@redhat.com>
References: <20230629222651.3196-1-dakr@redhat.com>
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
index c2ec91cc845d..7724fe63067d 100644
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
index ab9062e50977..45ca4eb98f54 100644
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
2.41.0

