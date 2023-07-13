Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B19DBC001B0
	for <linux-doc@archiver.kernel.org>; Thu, 13 Jul 2023 17:06:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232577AbjGMRG2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 Jul 2023 13:06:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232094AbjGMRGS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Jul 2023 13:06:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4807B2D5B
        for <linux-doc@vger.kernel.org>; Thu, 13 Jul 2023 10:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689267919;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OhcRjSdJAD7B8JiFY4weu/O+VY7c03xht8db5Jb3htY=;
        b=f6dh4uSDJszvS4PiGmMZhNhaLDP7Xt14T2OqCaKKjWioVO9FQBEafmtYVHuO5F7kOJOjbM
        HavOc2xmWTgszgmthQ6Ycpk/q/6AK3DCQh0lXt+e+FaIvIx8DJEHH1ycKYZGi30bWQkDkj
        2Pzf9m5kAHT50MnhuVNbOzXIcORPkkg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-214-s2cS4KjpMF-xUhAUunuj5w-1; Thu, 13 Jul 2023 13:05:18 -0400
X-MC-Unique: s2cS4KjpMF-xUhAUunuj5w-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-993d500699fso56224566b.1
        for <linux-doc@vger.kernel.org>; Thu, 13 Jul 2023 10:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689267917; x=1691859917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OhcRjSdJAD7B8JiFY4weu/O+VY7c03xht8db5Jb3htY=;
        b=LRvhwouOaY3BQ1pvmqnfQ+pTrZRmqvoei2iZJT/LmKm3tXkTLjNGFIHB8sAO3Pk5yz
         f4qyzdtbK4dIAzWTeypBmzyK3yD9uYW/wQiA59M31jcEKC8Vca3qzMKP2+bG0T3DS2IC
         EpJplyF2rRBnLGQKO5js933UOip94rEGitDg31/hcpGXFJak7iGKUvlvoTlJGnVbQzxb
         66WTSY30jpOExkw1nXbusXhGhxQKbPTBP9Np/+xNNnvCyV+cjwyhHq31y3dR712uXv0g
         aCZ+n/j7nm1B2l1+OMJIabw5NefbBAeyrHHdZwb2ECE4iEnCYTF2eNiWjZ7eFMKIW2Q+
         AbVw==
X-Gm-Message-State: ABy/qLYkzbBhb4IJj7t8RCf1PvXm4A/Q5rRqaJlewcJWRXNJIaf1/2Wj
        jHb6dzwkMLJpkV8ugHwBHEZn/10k4wonZO/Y2IPugr5979mLjmrfNz7/AAXWRm4sZu3Tq+eTqMX
        t/n+B0sFJoeJG1kqFcuNP
X-Received: by 2002:a17:906:cf8e:b0:992:566b:7d57 with SMTP id um14-20020a170906cf8e00b00992566b7d57mr1807158ejb.61.1689267917025;
        Thu, 13 Jul 2023 10:05:17 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF5JGbr5MKAD3oUdg8yQDnH3WfT5V6TxOY51R1276GrqE8YBJQnagr5FbQoFiv4VdihXdb/yw==
X-Received: by 2002:a17:906:cf8e:b0:992:566b:7d57 with SMTP id um14-20020a170906cf8e00b00992566b7d57mr1807146ejb.61.1689267916859;
        Thu, 13 Jul 2023 10:05:16 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id z3-20020a1709063ac300b00992b3ea1ee3sm4215671ejd.159.2023.07.13.10.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 10:05:16 -0700 (PDT)
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
Subject: [PATCH drm-next v7 10/13] drm/nouveau: chan: provide nouveau_channel_kill()
Date:   Thu, 13 Jul 2023 19:04:05 +0200
Message-ID: <20230713170429.2964-11-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713170429.2964-1-dakr@redhat.com>
References: <20230713170429.2964-1-dakr@redhat.com>
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

