Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22439C6379F
	for <linux-doc@archiver.kernel.org>; Fri, 17 Feb 2023 13:50:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230045AbjBQNuQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 17 Feb 2023 08:50:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229965AbjBQNuE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Feb 2023 08:50:04 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82A9522034
        for <linux-doc@vger.kernel.org>; Fri, 17 Feb 2023 05:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676641734;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nuqfhAPXoP8eMSRnoJXE/EUnRUmH5Dpmadrq5ZDJBI4=;
        b=JYq6PT3oiqA1NEkV2g6PbS7gAFbx7Yu+/gEvbEilJdT0s1VcxotmUJEnMaNDROGewh96qi
        G5s3P3pxn2hTtYSkEV7x0xhgrGDD5S2/4cGrdZF0KYHjQV04Jf+ljEQgsn8bgW/z3N1ZW/
        pQSothcBflqp3M0UKk6NfyJ9VH1iLqY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-246-XT5YrNTiPb-TJjKrlAVGhA-1; Fri, 17 Feb 2023 08:48:51 -0500
X-MC-Unique: XT5YrNTiPb-TJjKrlAVGhA-1
Received: by mail-ed1-f72.google.com with SMTP id m28-20020a50999c000000b004a245f58006so2162825edb.12
        for <linux-doc@vger.kernel.org>; Fri, 17 Feb 2023 05:48:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nuqfhAPXoP8eMSRnoJXE/EUnRUmH5Dpmadrq5ZDJBI4=;
        b=fHJRewojLCM48ddFRKRmRdzE6ecW/IPUKXpfcjpuTh7WK01WMlCF3VyPv+j3MF6Jta
         Vk4KcYcSIR4nw1TcmBhaEzN2EoBD0uFWFjgrvb6WZwKgb47yv3LnAnRe6LCb9KsROOq+
         WRIKx/x5dldN1VBGHS8m6T0BeNd8IJWGkJyzmILik5xx7ttBSDlN+gp5fgBjmKnbfGqc
         j85FnRem94XSRqTfdcDmuenGpMqNoT1rRgm80K5c33gLWG8REGrlIponm8OdN7Usb5gm
         KEqtTNCf26HhAG+bQ6BTwD7nXwHPLhQXu/tF1Fdd921n4O9xeopDaCE1PBgwkXcnPEZ8
         uxYQ==
X-Gm-Message-State: AO0yUKV4F3fXWyv+qQ1z4Vdbw2hl7YqPzlmpVorY+VAuo3png+Q4Edqp
        236WUh8f9cvZGyLqv7ZhIljyp5O3ETCchC/MTo25UaFxA4OMo/jBkLGk08W6ymzye73K5egkMrJ
        ONa6U2sJy3edVjszlDGtg
X-Received: by 2002:a17:906:5012:b0:87d:9447:f7fb with SMTP id s18-20020a170906501200b0087d9447f7fbmr444199ejj.38.1676641730480;
        Fri, 17 Feb 2023 05:48:50 -0800 (PST)
X-Google-Smtp-Source: AK7set89k4Od4Os7LWbT0Iek0fo+d31O5+Il7AqZlhgERwv5aHbfx3F8XejW0D6aFl2/IjkHLHgKFg==
X-Received: by 2002:a17:906:5012:b0:87d:9447:f7fb with SMTP id s18-20020a170906501200b0087d9447f7fbmr444186ejj.38.1676641730324;
        Fri, 17 Feb 2023 05:48:50 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id y23-20020a17090614d700b008b155de0984sm2180964ejc.170.2023.02.17.05.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 05:48:49 -0800 (PST)
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
Subject: [PATCH drm-next v2 12/16] drm/nouveau: chan: provide nouveau_channel_kill()
Date:   Fri, 17 Feb 2023 14:48:16 +0100
Message-Id: <20230217134820.14672-7-dakr@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230217134422.14116-1-dakr@redhat.com>
References: <20230217134422.14116-1-dakr@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The new VM_BIND UAPI implementation introduced in subsequent commits
will allow asynchronous jobs processing push buffers and emitting fences.

If a job times out, we need a way to recover from this situation. For
now, simply kill the channel to unblock all hung up jobs and signal
userspace that the device is dead on the next EXEC or VM_BIND ioctl.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_chan.c | 14 +++++++++++---
 drivers/gpu/drm/nouveau/nouveau_chan.h |  1 +
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index 1068abe41024..6f47e997d9cf 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -40,6 +40,14 @@ MODULE_PARM_DESC(vram_pushbuf, "Create DMA push buffers in VRAM");
 int nouveau_vram_pushbuf;
 module_param_named(vram_pushbuf, nouveau_vram_pushbuf, int, 0400);
 
+void
+nouveau_channel_kill(struct nouveau_channel *chan)
+{
+	atomic_set(&chan->killed, 1);
+	if (chan->fence)
+		nouveau_fence_context_kill(chan->fence, -ENODEV);
+}
+
 static int
 nouveau_channel_killed(struct nvif_event *event, void *repv, u32 repc)
 {
@@ -47,9 +55,9 @@ nouveau_channel_killed(struct nvif_event *event, void *repv, u32 repc)
 	struct nouveau_cli *cli = (void *)chan->user.client;
 
 	NV_PRINTK(warn, cli, "channel %d killed!\n", chan->chid);
-	atomic_set(&chan->killed, 1);
-	if (chan->fence)
-		nouveau_fence_context_kill(chan->fence, -ENODEV);
+
+	if (unlikely(!atomic_read(&chan->killed)))
+		nouveau_channel_kill(chan);
 
 	return NVIF_EVENT_DROP;
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.h b/drivers/gpu/drm/nouveau/nouveau_chan.h
index e06a8ffed31a..e483f4a254da 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.h
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.h
@@ -65,6 +65,7 @@ int  nouveau_channel_new(struct nouveau_drm *, struct nvif_device *, bool priv,
 			 u32 vram, u32 gart, struct nouveau_channel **);
 void nouveau_channel_del(struct nouveau_channel **);
 int  nouveau_channel_idle(struct nouveau_channel *);
+void nouveau_channel_kill(struct nouveau_channel *);
 
 extern int nouveau_vram_pushbuf;
 
-- 
2.39.1

