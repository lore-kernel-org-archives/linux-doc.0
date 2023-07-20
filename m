Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D31C001DE
	for <linux-doc@archiver.kernel.org>; Thu, 20 Jul 2023 00:17:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229475AbjGTARA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 19 Jul 2023 20:17:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbjGTAQp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 Jul 2023 20:16:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F05C02127
        for <linux-doc@vger.kernel.org>; Wed, 19 Jul 2023 17:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689812141;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OhcRjSdJAD7B8JiFY4weu/O+VY7c03xht8db5Jb3htY=;
        b=PLfYDMkkhAQncHYXB5hYY/5QGbPLW69GwBQmIqMP16nsLpZ1WQ4xTi5WdytFSxxVEqyh9l
        yjIBxRsA/npmvv2p+IcbU9WK2DcOnJkjYmM1clqfN/gQI+kpWCW51ngkeBWJoDr7zjUa0P
        CQGm9NyKvAovA5ki+fJ/Og7lGjYeO/0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-321-4NvK38oUNGytozLrTjUbOw-1; Wed, 19 Jul 2023 20:15:38 -0400
X-MC-Unique: 4NvK38oUNGytozLrTjUbOw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-94a34d3e5ebso15424566b.3
        for <linux-doc@vger.kernel.org>; Wed, 19 Jul 2023 17:15:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689812135; x=1692404135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OhcRjSdJAD7B8JiFY4weu/O+VY7c03xht8db5Jb3htY=;
        b=gqPZ2qoaQiVC7KjDdGTfvW6Ob6XHxMGFlSPfbsWWoqEOZpv0hJqFRq8m2j8AWHpiyO
         EzBb0eziRPI330eF3v59qjCZ+zr0Uvt9QIP7PERVSWTXdBmE9LAs+tnuo7BhgpERR9Nb
         sNr+7H7Llu2rgVCuTh9E7udUx9XopPjIPw/CjMQllmVO9LhuCboGRE1z2HG4luz9XyOt
         KF1SY4EqZI4Ix7mcb/s/2+iZh7blP0idg90kJ309ILUS0f29iSR5hSnJL8Ioh439UzNI
         7jAhxkUJSEkIJj2sk5TWNXRW4SCfAy/hlBFN33GpXp1wMfsn11D92JXM+4C07Uf0ucUo
         xI3Q==
X-Gm-Message-State: ABy/qLafQH2j59BQj5SwYqnGtBIZTDVmInLdCbibtkSIfRCv3WkX5M+0
        J/zplFoH4tWmnJHkRMsDOoxbKbLwNcynItLlnwhIjfkcWVdkqGy+u2MpmBi5lJtu3X1OfFKvKa+
        dUiX0yDx1gdXt9YeALOB6
X-Received: by 2002:a17:906:289:b0:994:4be4:a106 with SMTP id 9-20020a170906028900b009944be4a106mr3533475ejf.10.1689812135164;
        Wed, 19 Jul 2023 17:15:35 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH96n/KWpDaeUZ3mj4MnmFbtHq5B+xZI4mENhLnHewKGftgqsvLmf7wmzaTf4fUGBLWKW/Rag==
X-Received: by 2002:a17:906:289:b0:994:4be4:a106 with SMTP id 9-20020a170906028900b009944be4a106mr3533468ejf.10.1689812134951;
        Wed, 19 Jul 2023 17:15:34 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id jt16-20020a170906dfd000b00988c0c175c6sm2958515ejc.189.2023.07.19.17.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 17:15:34 -0700 (PDT)
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
Subject: [PATCH drm-misc-next v8 09/12] drm/nouveau: chan: provide nouveau_channel_kill()
Date:   Thu, 20 Jul 2023 02:14:30 +0200
Message-ID: <20230720001443.2380-10-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230720001443.2380-1-dakr@redhat.com>
References: <20230720001443.2380-1-dakr@redhat.com>
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
2.41.0

