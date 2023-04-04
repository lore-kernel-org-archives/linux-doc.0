Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC84AC761AF
	for <linux-doc@archiver.kernel.org>; Tue,  4 Apr 2023 01:30:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232723AbjDDBaO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 3 Apr 2023 21:30:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232888AbjDDB33 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Apr 2023 21:29:29 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F37901FE0
        for <linux-doc@vger.kernel.org>; Mon,  3 Apr 2023 18:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680571715;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rFDnwLdkC+a84lmheZyyv02Y7sEGNyBLjO5UYHqgwOc=;
        b=RkrfMZjUnVt71py2jam34nXnQWqJEQMQFbjfDw8wE99w2AVhru8aGvz5yxdSuyhmEFAHi+
        QpoDmHMlB/sUCTZfVeI4RKf7C6JUOxbJHOT1nf7ZLJ82ZSehBPR/uZVJF4IP8VOXwQ+JBV
        Wu6UQPbPMT283Sq6a4fAj9qmKGK2hew=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-298-ERkfmOSyNJ6b3h38AFp9MQ-1; Mon, 03 Apr 2023 21:28:33 -0400
X-MC-Unique: ERkfmOSyNJ6b3h38AFp9MQ-1
Received: by mail-ed1-f69.google.com with SMTP id f15-20020a50a6cf000000b0050050d2326aso43237871edc.18
        for <linux-doc@vger.kernel.org>; Mon, 03 Apr 2023 18:28:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680571712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rFDnwLdkC+a84lmheZyyv02Y7sEGNyBLjO5UYHqgwOc=;
        b=SIOsw3EEXKUr7CWkvXZQfHwPmMV5w3xMuLltNNkIj8lRoX0mxUg93G5TJ3V4SHgBxw
         yjzy6YMlvHLWw2zFfLs8rMgvjMNcBUXRRuL891P/EBx7K5/wYf3BTRv8vmGi6fyh3vdK
         5QD9Q+T16wTeqZ2ld0rDixOMyhrW1+/0pSb1qmwT2/k13tS1z8DSKeS9Yqkhc2sJjufn
         +FXD/osBTnPD6/jo9ikIxtTVmDG1PYts3zfuKGjAkXbzYLaSoDoGuUj+IEHcbE/DbGH+
         Tb8/ZRsJjBixdx5auN2uIN6exlZK+Pl7wKOwVpeOkrm72wea1WZTZIbRLCUVCTDI5FK0
         81gQ==
X-Gm-Message-State: AAQBX9fTG/v3ofegaUTBGCTuPBkhkDbdWS+230155tzlkdut/FlQ3Zxw
        vUhdUQ5oFqOkszaN0jIR9p4fxSRLVOtgzFo/kV+tAfNVZXiE5w26IhqxR4HvEDWgU8SyLyYRZJE
        Ub3UMVIuGR6xXFes7w3tj
X-Received: by 2002:a17:907:3f22:b0:931:86cf:9556 with SMTP id hq34-20020a1709073f2200b0093186cf9556mr754092ejc.23.1680571712723;
        Mon, 03 Apr 2023 18:28:32 -0700 (PDT)
X-Google-Smtp-Source: AKy350bTvpbIk/GmxFlxt18RFwL9YdKIZ4Q77ktCoQzFycA8gGsVYWiQjvWZuLDin9qz3iy+Fs1c5A==
X-Received: by 2002:a17:907:3f22:b0:931:86cf:9556 with SMTP id hq34-20020a1709073f2200b0093186cf9556mr754076ejc.23.1680571712535;
        Mon, 03 Apr 2023 18:28:32 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id n6-20020a5099c6000000b004aee4e2a56esm5318778edb.0.2023.04.03.18.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 18:28:32 -0700 (PDT)
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
Subject: [PATCH drm-next v3 12/15] drm/nouveau: chan: provide nouveau_channel_kill()
Date:   Tue,  4 Apr 2023 03:27:38 +0200
Message-Id: <20230404012741.116502-13-dakr@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404012741.116502-1-dakr@redhat.com>
References: <20230404012741.116502-1-dakr@redhat.com>
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
2.39.2

