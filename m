Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9194EB64DB
	for <linux-doc@archiver.kernel.org>; Tue, 20 Jun 2023 00:44:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229882AbjFTAoH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Jun 2023 20:44:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229885AbjFTAn7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Jun 2023 20:43:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2126510FE
        for <linux-doc@vger.kernel.org>; Mon, 19 Jun 2023 17:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687221802;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+GODPjGDP/v7EDtsYhu3OhDhbf8tl4sgje/Azf5bvXY=;
        b=d2Ul+c6OOVCDCBcG7uZXkk/aXn6pxHv8CKzFAfbrYMJiAJM8D08x+Ty3UbN33pGZvDAp8i
        ENeo3OSqOU2dFAEMAeWQM8Xn2QiSBoSNUfsaxvgT29DE5tEJIw2o8B+/ORl1On2kb9I7uL
        oD6cLaPSCY3bAc2uiMdbMPozpxCop9E=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-145-HchPs4gnNumhGqS1Yvgxpg-1; Mon, 19 Jun 2023 20:43:20 -0400
X-MC-Unique: HchPs4gnNumhGqS1Yvgxpg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-978a991c3f5so321593266b.0
        for <linux-doc@vger.kernel.org>; Mon, 19 Jun 2023 17:43:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687221799; x=1689813799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+GODPjGDP/v7EDtsYhu3OhDhbf8tl4sgje/Azf5bvXY=;
        b=hLnBkdo2vGPTc8QpsfrBvYGfjsr98YQYa/vIFzKdm18GNgXmjebfhvFGlLruNkF2/n
         aW25NjgeXd/zDEeQGJsErn6RqqFQMtSNhkPx7FyC2Cf16wPX6b3qRv3x7oc9JGgkS41f
         p02TZOwL+pF2KVXGLYYGAaNqshI6erCFpwBI4D+YcU6ZhnR6R9tDtNKYd4O2OPSlRji9
         LPQ0c0fgcJLgre4VS3WcP649u3bVWA63F1TsuZTSquIDbY3g7t/m6jNJirGLzD6x9p7C
         4fzdg0B/QEvMqzL8v/daGNBRet3iRK4a6PTx4fHYm7FTkgdApqzzVinowm6ga+HZYVyl
         PsQQ==
X-Gm-Message-State: AC+VfDwPgeimrv+EEzWiyBw0hHmoNXySiFTGhLDgNeoQbudLMZdwgiNw
        0AoE5j0heSs/5Zl/Mz2wzEe/K3UE+cQSj1gcmF4oKHycmGrQf9VrktSU7Q9+WsdawSHzrmu6MKV
        ppsIwGvoEUyOgr7Wvj+sm
X-Received: by 2002:a17:907:9495:b0:982:a065:331d with SMTP id dm21-20020a170907949500b00982a065331dmr9791769ejc.60.1687221799668;
        Mon, 19 Jun 2023 17:43:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ65fHuJnAW0DqDalRe8IFameBpvYe1u3W5keeHpov/NpqxjPQb0EmGROEVydntX30L57FauPQ==
X-Received: by 2002:a17:907:9495:b0:982:a065:331d with SMTP id dm21-20020a170907949500b00982a065331dmr9791756ejc.60.1687221799456;
        Mon, 19 Jun 2023 17:43:19 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id rh8-20020a17090720e800b0098282bb8effsm375959ejb.196.2023.06.19.17.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 17:43:18 -0700 (PDT)
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
Subject: [PATCH drm-next v5 11/14] drm/nouveau: chan: provide nouveau_channel_kill()
Date:   Tue, 20 Jun 2023 02:42:14 +0200
Message-Id: <20230620004217.4700-12-dakr@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230620004217.4700-1-dakr@redhat.com>
References: <20230620004217.4700-1-dakr@redhat.com>
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
index f47c0363683c..a975f8b0e0e5 100644
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
2.40.1

