Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A071C6379F
	for <linux-doc@archiver.kernel.org>; Wed, 18 Jan 2023 06:32:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbjARGbh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 18 Jan 2023 01:31:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229803AbjARGZz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Jan 2023 01:25:55 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15CB653F8D
        for <linux-doc@vger.kernel.org>; Tue, 17 Jan 2023 22:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674022443;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=n9EJ+tT+/p3duz0VW0fK+iHRhTM0v9eouQOWnSy8nPY=;
        b=TidimVEH65AvR5Z83LkFKuYB7pNK9BmnuSMaYYSPMtZXsDgZEKHyMEPPpdpb+M3V9rtlVs
        kt6TF0zwuBcq0sd5UMusW2SxkplZdIYXrY9l20Q5DOkwVBDxFobTJ5t3cKFXhXOunaFEH4
        KgUZCgs+SoBqivtUmOxeWg/ACNNTI/A=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-370-SjjiqUp4P3G3_mS5Lt88og-1; Wed, 18 Jan 2023 01:14:02 -0500
X-MC-Unique: SjjiqUp4P3G3_mS5Lt88og-1
Received: by mail-ej1-f70.google.com with SMTP id nc27-20020a1709071c1b00b0086dae705676so6919841ejc.12
        for <linux-doc@vger.kernel.org>; Tue, 17 Jan 2023 22:14:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n9EJ+tT+/p3duz0VW0fK+iHRhTM0v9eouQOWnSy8nPY=;
        b=aIVuPlC32tEFDAJvF58hTpu0QQ2AkANvDasfIbQyiwMrvTZlE0uWE3T7rdbTANVc+i
         2TbaoLcEEUxtBqtAaekgMo7irLeMLXyUlaWA/GR5UMP5mljAa1TFCoBb8su1QkLGlJMx
         XqRbNNOC93vEggNi2bePaAvtStJ4LJ9nZDOV1fed2U+D2o2gbpoa7HKiDKZ//tue00Iv
         L17+Zn748zrvnMBLb563cAcfSaZWgbU2UGXwr5uuELFZ4Eg0iAntxTcApZp0h59bdUCK
         +UlBosoYJ2gGBtHDHrW8/C0HaJy+kSCADPYoGWE5P1SRqhGZW/W6Fxu/gVuwnCzYkjzL
         3sHQ==
X-Gm-Message-State: AFqh2kq+kkss8AHduvzSWAQDTaOsMeN5D61sdc258WqYy2NbYVcFpB42
        uwYdB6Z1bm4VAyvlaX1X4ezts4n3+japsF1i3CNtjg9dK4/8Jmj9PBy4iYlai0pKARJvtyGX4gE
        tPp7rvt7pxlqYyUXY7UCJ
X-Received: by 2002:a17:907:d047:b0:86d:6e9f:7e36 with SMTP id vb7-20020a170907d04700b0086d6e9f7e36mr2097350ejc.5.1674022441529;
        Tue, 17 Jan 2023 22:14:01 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt17hYRso2wFEWcK0mlpboIS6E+BA5nIJ4n2A32fGemNRlxrozdcKGS6R6bhkgQQv7FVOxZqA==
X-Received: by 2002:a17:907:d047:b0:86d:6e9f:7e36 with SMTP id vb7-20020a170907d04700b0086d6e9f7e36mr2097334ejc.5.1674022441366;
        Tue, 17 Jan 2023 22:14:01 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id sb25-20020a1709076d9900b0084c6581c16fsm14093965ejc.64.2023.01.17.22.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 22:14:00 -0800 (PST)
From:   Danilo Krummrich <dakr@redhat.com>
To:     daniel@ffwll.ch, airlied@redhat.com, christian.koenig@amd.com,
        bskeggs@redhat.com, jason@jlekstrand.net, tzimmermann@suse.de,
        mripard@kernel.org, corbet@lwn.net
Cc:     dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH drm-next 09/14] drm/nouveau: fence: fail to emit when fence context is killed
Date:   Wed, 18 Jan 2023 07:12:51 +0100
Message-Id: <20230118061256.2689-10-dakr@redhat.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118061256.2689-1-dakr@redhat.com>
References: <20230118061256.2689-1-dakr@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The new VM_BIND UAPI implementation introduced in subsequent commits
will allow asynchronous jobs processing push buffers and emitting
fences.

If a fence context is killed, e.g. due to a channel fault, jobs which
are already queued for execution might still emit new fences. In such a
case a job would hang forever.

To fix that, fail to emit a new fence on a killed fence context with
-ENODEV to unblock the job.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 7 +++++++
 drivers/gpu/drm/nouveau/nouveau_fence.h | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index ee5e9d40c166..62c70d9a32e6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -96,6 +96,7 @@ nouveau_fence_context_kill(struct nouveau_fence_chan *fctx, int error)
 		if (nouveau_fence_signal(fence))
 			nvif_event_block(&fctx->event);
 	}
+	fctx->killed = 1;
 	spin_unlock_irqrestore(&fctx->lock, flags);
 }
 
@@ -226,6 +227,12 @@ nouveau_fence_emit(struct nouveau_fence *fence, struct nouveau_channel *chan)
 		dma_fence_get(&fence->base);
 		spin_lock_irq(&fctx->lock);
 
+		if (unlikely(fctx->killed)) {
+			spin_unlock_irq(&fctx->lock);
+			dma_fence_put(&fence->base);
+			return -ENODEV;
+		}
+
 		if (nouveau_fence_update(chan, fctx))
 			nvif_event_block(&fctx->event);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h b/drivers/gpu/drm/nouveau/nouveau_fence.h
index 0ca2bc85adf6..00a08699bb58 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.h
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
@@ -45,7 +45,7 @@ struct nouveau_fence_chan {
 	char name[32];
 
 	struct nvif_event event;
-	int notify_ref, dead;
+	int notify_ref, dead, killed;
 };
 
 struct nouveau_fence_priv {
-- 
2.39.0

