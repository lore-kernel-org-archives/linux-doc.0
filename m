Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 594E5C001B3
	for <linux-doc@archiver.kernel.org>; Thu, 29 Jun 2023 22:29:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232170AbjF2W3r (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Jun 2023 18:29:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232234AbjF2W3N (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Jun 2023 18:29:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 197DB35B0
        for <linux-doc@vger.kernel.org>; Thu, 29 Jun 2023 15:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688077658;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/pp7pCNssCFdX07s9SqyoLBjaIvnkOQtt7NO/vv36Sc=;
        b=XW3sD7BI1xYF/dME6RfUk9chTtu1ZDKYq2GnVa6ymGhvQLdqIMbnKelQ537IvVis6LwuYX
        Braduh370NQ5hu93aVcL45tYRi7jMh28aVXzyp5HAsQkr3P/ktydOtsMU5vOF3gPtWr0Cb
        ECBpErNfn3gjVtM/TiOYWQ93vlpYVMM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-pT_YOsZBO-K2wWg_-rAT5A-1; Thu, 29 Jun 2023 18:27:36 -0400
X-MC-Unique: pT_YOsZBO-K2wWg_-rAT5A-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-30793c16c78so1510120f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 29 Jun 2023 15:27:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688077655; x=1690669655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/pp7pCNssCFdX07s9SqyoLBjaIvnkOQtt7NO/vv36Sc=;
        b=UQbl4gRBAetKtWdKF1aB6ymTodposg4YRe/74paCk5vThPu6AsYGn2D57V3hWDoVOf
         60TePTIdKd7UBw9U9eQ2l9ec/T0RsOKXwOaQmq7AeyCQ21ae9njFRKCaqdtTb666Ostc
         To7RJBkpHOA+SprEdO4wEWm9nVTHdFFZBmj4T5YyrUGcbn7EAGZw1gEs3ZATtoJ62smX
         QmIqo3e+UiQDtRmsDmkLnaoVQQRPx8AR/uOSGVeZq2YfvhN0nOyDkflqeHg1uv63i5qw
         htZcj4kiJLSrtmC7QxTb+yuX7EKEpa9YgOyB2HctZ4d4/07csGFDJI7XNKPxKw/Q1g4g
         f50w==
X-Gm-Message-State: ABy/qLZIUvW9gboPuMs3OIXSdUfDdMx2Kc08ekn9hYMwy/2e01tVskbe
        ThE9hI0yDahktyw8hRB3nsQdSoBF3EDpZ6GdnkP/v1EzNBhYj3dQIOsteGiSd5V7ucAD6Op1JNb
        hjt/Xiit6sC3nPKWReX7K
X-Received: by 2002:a5d:525c:0:b0:313:f61c:42bd with SMTP id k28-20020a5d525c000000b00313f61c42bdmr750850wrc.59.1688077655559;
        Thu, 29 Jun 2023 15:27:35 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFmqOL6OvZYLEHImUuHmBKbH1ljfnPJQLh9s5Ol4fUmQzA+pAg2LS4yxPJw5oYwNr77kuWmwA==
X-Received: by 2002:a5d:525c:0:b0:313:f61c:42bd with SMTP id k28-20020a5d525c000000b00313f61c42bdmr750845wrc.59.1688077655340;
        Thu, 29 Jun 2023 15:27:35 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id f2-20020a5d5682000000b00313ec7dd652sm13949454wrv.44.2023.06.29.15.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 15:27:34 -0700 (PDT)
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
Subject: [PATCH drm-next v6 09/13] drm/nouveau: fence: fail to emit when fence context is killed
Date:   Fri, 30 Jun 2023 00:25:25 +0200
Message-ID: <20230629222651.3196-10-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230629222651.3196-1-dakr@redhat.com>
References: <20230629222651.3196-1-dakr@redhat.com>
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
index e946408f945b..77c739a55b19 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -96,6 +96,7 @@ nouveau_fence_context_kill(struct nouveau_fence_chan *fctx, int error)
 		if (nouveau_fence_signal(fence))
 			nvif_event_block(&fctx->event);
 	}
+	fctx->killed = 1;
 	spin_unlock_irqrestore(&fctx->lock, flags);
 }
 
@@ -229,6 +230,12 @@ nouveau_fence_emit(struct nouveau_fence *fence, struct nouveau_channel *chan)
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
index 7c73c7c9834a..2c72d96ef17d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.h
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
@@ -44,7 +44,7 @@ struct nouveau_fence_chan {
 	char name[32];
 
 	struct nvif_event event;
-	int notify_ref, dead;
+	int notify_ref, dead, killed;
 };
 
 struct nouveau_fence_priv {
-- 
2.41.0

