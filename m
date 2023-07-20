Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29A6CC0015E
	for <linux-doc@archiver.kernel.org>; Thu, 20 Jul 2023 00:16:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229808AbjGTAQe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 19 Jul 2023 20:16:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229797AbjGTAQd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 Jul 2023 20:16:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E149E2106
        for <linux-doc@vger.kernel.org>; Wed, 19 Jul 2023 17:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689812116;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DNvPFmPephzOlef4HOM2AR90BUKB3CUNAq245FGhm7Y=;
        b=Gc7prBh9OJv/NqTJrJ2+XslunY36tMXOPSEmUtmAErVkhZtwIIfFmRxZkutFipgDKQDeMJ
        TNOnSCr+F/fNmivicGbHrkwY/W9pCoDQyiy3uwsvT8fqcIEWrUpMcBjLdb96kNvFtlgRe4
        h1zPkjoKX8wWcz1YsjTSu+aHGSKWuGA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-A9bf9oAFPSiOnDBVvMATuQ-1; Wed, 19 Jul 2023 20:15:15 -0400
X-MC-Unique: A9bf9oAFPSiOnDBVvMATuQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-94a34e35f57so13703766b.3
        for <linux-doc@vger.kernel.org>; Wed, 19 Jul 2023 17:15:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689812114; x=1692404114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DNvPFmPephzOlef4HOM2AR90BUKB3CUNAq245FGhm7Y=;
        b=L6iIrvEYgYSCWbKM+lX9FwFLbf2iKdRzsEurC9Hv3SSVQqpYtqoIOUUJYBXJccaYN9
         tkygpi8kkWI5mNLf19q+XYOqYIDnzTum+6364+DDB6Vfe3dl6lSYq1n08KfS6TQCBQeX
         kaLb197RBQFd99FnELQXeN5ysjFRG8jte4DPsWkbw5HMkpJZ3zz90f3vdycqbE7YnkO9
         M/o0FH3e5OSeCjQN2bJn0dZ26ge7MxLz1Q5pdL/3IjX7tKy1/jbUBjHmTqPDDegcX4SA
         Hx5C5NgTwoZ2qQvSNajJtiExVD6HAY8MKysaqEVJbHENwoX8DZqj1Dk1DmdPejQEEj9z
         3nAA==
X-Gm-Message-State: ABy/qLaNXdHoW+yLNgfF+lpmRtMM1M26pfg0vbF5kMAv6xNUtC6Zbn4S
        aBolCkFyW9/GIRQwfyWpW9BkVzox6j2xP7FNQNBq/aY5qKdk5//wAAr3G4iYnbllZYBefBwEWwt
        dC480P+cXjzJh6jC0qII1
X-Received: by 2002:a17:907:3e18:b0:982:caf9:126 with SMTP id hp24-20020a1709073e1800b00982caf90126mr4684531ejc.42.1689812113887;
        Wed, 19 Jul 2023 17:15:13 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF1daekZZFBLbfCaLfLyJMueWXBADd4k886Efz58JfzCtV37i77go/TCfVUi/G0/Sk8GqFq8Q==
X-Received: by 2002:a17:907:3e18:b0:982:caf9:126 with SMTP id hp24-20020a1709073e1800b00982caf90126mr4684505ejc.42.1689812113522;
        Wed, 19 Jul 2023 17:15:13 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id pj20-20020a170906d79400b00993664a9987sm2975604ejb.103.2023.07.19.17.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 17:15:13 -0700 (PDT)
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
Subject: [PATCH drm-misc-next v8 04/12] drm/nouveau: get vmm via nouveau_cli_vmm()
Date:   Thu, 20 Jul 2023 02:14:25 +0200
Message-ID: <20230720001443.2380-5-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230720001443.2380-1-dakr@redhat.com>
References: <20230720001443.2380-1-dakr@redhat.com>
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

