Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC668C04A6A
	for <linux-doc@archiver.kernel.org>; Fri,  4 Aug 2023 18:26:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231463AbjHDS0w (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 4 Aug 2023 14:26:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231455AbjHDSZl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Aug 2023 14:25:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 024DB49FF
        for <linux-doc@vger.kernel.org>; Fri,  4 Aug 2023 11:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691173491;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GC244PIhZZVEaEMVp/i0uN0Dlx9b0oRSDCpI7qyebQM=;
        b=EcVwQd8WN6nqPKthWSzIEXz2c5LVl56stBmW3VZT1J3dyToaTbQy7cmHPhgUBoVs19D9NJ
        jf4GDNAS277bW07LQQ0G8OfUesvguIWFjSLqIxBanvFbZW8rAskoEFXFDro2SPEdSk3fKs
        PC6lQWh0wFln6q/b2ct1P8m28qMyEiU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-idjC9Z9QOCikxwwn7IEy3Q-1; Fri, 04 Aug 2023 14:24:49 -0400
X-MC-Unique: idjC9Z9QOCikxwwn7IEy3Q-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-99bebfada8cso151245266b.1
        for <linux-doc@vger.kernel.org>; Fri, 04 Aug 2023 11:24:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691173488; x=1691778288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GC244PIhZZVEaEMVp/i0uN0Dlx9b0oRSDCpI7qyebQM=;
        b=LkT2b/95r67g5DIBixnNrc9AgSce/WcdS4z6UwOVb8dIwKghbCT5q6T5u6dqI4lb9L
         H6eINQasiPJ5cfs9JEyUF/U4YpfyNjNQIp/+6XlAhRaLh4D4PiYcjtZGm01HkEfvt/VJ
         nCfcIZGXTVg1/p7GAwoTWhHgZkmYEmTwzXog7x3yCEOwahSMItke8Cj83XOpHkjP6jn5
         UUxVYCt/OBZiw8wtQrqsPu4tJXcP1D0gsJu/EInGPmtDrwU5ipUyCZbSUHGZFy3sff+7
         L/kL6y4HMRKeqaEa/FKjaZgX0paEwdXpIswp+idNJNCnWeSluPEqrzPj1R5771mhuC9d
         pxhg==
X-Gm-Message-State: AOJu0YzImh3OK1vQN51vM2lsEv0wTUD5KoMotR58AOPuOXReH3FOyKDO
        sxni6HVgIHFYdTbfzVT56lgERXrIwYxJcS/RQEKcANowRVWWq0QD67DCGVGnzEbZ/WeWo8F7YiM
        HJ0XR9g00j+DdM8F25a1E
X-Received: by 2002:a17:906:31cd:b0:994:2fa9:7446 with SMTP id f13-20020a17090631cd00b009942fa97446mr1890102ejf.46.1691173488304;
        Fri, 04 Aug 2023 11:24:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNm88b5/GKa7FD6Aqs6b0cTELulEnpK8lpJSfesvb7pgDI0RFk7OgObhebiBKeVpSn286rFg==
X-Received: by 2002:a17:906:31cd:b0:994:2fa9:7446 with SMTP id f13-20020a17090631cd00b009942fa97446mr1890079ejf.46.1691173487983;
        Fri, 04 Aug 2023 11:24:47 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id bw4-20020a170906c1c400b009829d2e892csm1674052ejb.15.2023.08.04.11.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 11:24:47 -0700 (PDT)
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
Subject: [PATCH drm-misc-next v10 08/12] drm/nouveau: fence: fail to emit when fence context is killed
Date:   Fri,  4 Aug 2023 20:23:48 +0200
Message-ID: <20230804182406.5222-9-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230804182406.5222-1-dakr@redhat.com>
References: <20230804182406.5222-1-dakr@redhat.com>
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

Reviewed-by: Dave Airlie <airlied@redhat.com>
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

